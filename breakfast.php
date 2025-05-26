<?php
session_start();

$servername = "localhost";
$username = "root";
$password = "";
$dbname = "canteen";

$conn = new mysqli($servername, $username, $password, $dbname);

if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT * FROM breakfast";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Breakfast Menu - ADBU Canteen</title>
  <link rel="stylesheet" href="style2.css">
</head>
<body>
  <div class="breakfast-container">
    <h2>Breakfast Menu</h2>

    <div class="dish-grid">
      <?php
      if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
          $dish_name = htmlspecialchars($row["dish_name"]);
          $image_path = htmlspecialchars($row["image"]);
          $price = htmlspecialchars($row["price"]);
          $dish_id = $row["id"];

          if (!empty($image_path) && !file_exists($image_path)) {
            $image_path = 'default_image_path.jpg';
          }

          echo '
          <div class="dish-card">
            <a href="review.php?category=breakfast&dish_id=' . $dish_id . '">
              <img src="' . $image_path . '" alt="' . $dish_name . '">
              <p>' . $dish_name . '</p>
              <p>Rs.' . $price . '</p>
            </a>
          </div>';
        }
      } else {
        echo "No breakfast items available.";
      }
      ?>
    </div>
  </div>
</body>
</html>

<?php
$conn->close();
?>
