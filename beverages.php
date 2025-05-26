<?php
session_start();

include 'db.php';

if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit();
}

$result = $conn->query("SELECT * FROM beverages");
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Beverages Menu - ADBU Canteen</title>
  <link rel="stylesheet" href="style2.css">
</head>
<body>
  <div class="beverages-container">
    <h2>Beverages Menu</h2>
    <div class="dish-grid">
      <?php while($row = $result->fetch_assoc()): ?>
        <div class="dish-card">
          <a href="review.php?dish_id=<?= $row['id'] ?>&category=beverages">
            <img src="<?= $row['image'] ?>" alt="<?= $row['dish_name'] ?>">
            <p><?= $row['dish_name'] ?></p>
            <p>Rs.<?= htmlspecialchars($row['price']) ?></p>
          </a>
        </div>
      <?php endwhile; ?>
    </div>
  </div>
</body>
</html>

<?php
$conn->close();
?>
