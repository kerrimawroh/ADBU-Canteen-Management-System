<?php
include 'db.php';

$dish_id = $_POST['dish_id'];
$user_name = $_POST['user_name'];
$rating = $_POST['rating'];
$review_text = $_POST['review_text'];

$stmt = $conn->prepare("INSERT INTO reviews (dish_id, user_name, rating, review_text) VALUES (?, ?, ?, ?)");
$stmt->bind_param("isis", $dish_id, $user_name, $rating, $review_text);

if ($stmt->execute()) {
  echo "Review submitted successfully!<br>";
  echo "<a href='breakfast.php'>Go Back to Menu</a>";
} else {
  echo "Error: " . $stmt->error;
}
?>
