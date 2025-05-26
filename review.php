<?php
session_start();

$servername = "localhost";
$username   = "root";
$password   = "";
$dbname     = "canteen";
$conn       = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$category = $_GET['category'] ?? '';
$dish_id  = $_GET['dish_id']  ?? '';


if (!is_numeric($dish_id) || !in_array($category, ['breakfast', 'lunch', 'snacks', 'beverages'])) {
  die("Invalid request.");
}

if (!isset($_SESSION['user_id'])) {
  header("Location: login.php");
  exit();
}

$sql    = "SELECT * FROM `$category` WHERE id = $dish_id";
$result = $conn->query($sql);
$dish   = $result->fetch_assoc();

if (!$dish) {
  die("Dish not found.");
}

$review_sql  = "SELECT * FROM reviews WHERE dish_id = ? AND category = ?";
$review_stmt = $conn->prepare($review_sql);
$review_stmt->bind_param("is", $dish_id, $category);
$review_stmt->execute();
$review_result = $review_stmt->get_result();

$success_message = '';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  $user_name   = $_SESSION['username'];  
  $rating      = $_POST['rating'];
  $review_text = $_POST['review_text'];

  $stmt = $conn->prepare(
    "INSERT INTO reviews (dish_id, category, user_name, rating, review_text)
     VALUES (?, ?, ?, ?, ?)"
  );
  $stmt->bind_param(
    "issss",
    $dish_id,
    $category,
    $user_name,
    $rating,
    $review_text
  );

  if ($stmt->execute()) {
    $success_message = "Review submitted!";
  } else {
    $success_message = "Error: " . $conn->error;
  }
  $stmt->close();

  $review_stmt->execute();
  $review_result = $review_stmt->get_result();
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Review for <?= htmlspecialchars($dish['dish_name']) ?></title>
  <link rel="stylesheet" href="style3.css">
</head>
<body>
  <div class="review-container">
    <h2>Review for: <?= htmlspecialchars($dish['dish_name']) ?></h2>

    <?php if ($success_message): ?>
      <p class="success"><?= htmlspecialchars($success_message) ?></p>
    <?php endif; ?>

    <form method="post">
      <label>Rating:</label>
      <select name="rating" required>
        <option value="1">1 - Poor</option>
        <option value="2">2 - Fair</option>
        <option value="3">3 - Good</option>
        <option value="4">4 - Very Good</option>
        <option value="5">5 - Excellent</option>
      </select><br>

      <label>Review:</label>
      <textarea name="review_text" required></textarea><br>

      <button type="submit">Submit Review</button>
    </form>

    <hr>

    <div class="reviews">
      <?php if ($review_result->num_rows > 0): ?>
        <h3>Customer Reviews:</h3>
        <?php while ($review = $review_result->fetch_assoc()): ?>
          <div class="review-card">
            <p>
              <strong><?= htmlspecialchars($review['user_name']) ?></strong>
               — Rating: <?= htmlspecialchars($review['rating']) ?>/5
            </p>
            <p><?= htmlspecialchars($review['review_text']) ?></p>
          </div>
        <?php endwhile; ?>
      <?php else: ?>
        <p>No reviews yet. Be the first to write a review!</p>
      <?php endif; ?>
    </div>
  </div>
</body>
</html>

<?php
$review_stmt->close();
$conn->close();
?>
