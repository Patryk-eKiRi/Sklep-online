<?php
require 'config.php';

$category_id = $_GET['category_id'] ?? null;

if (!$category_id) {
    http_response_code(400);
    echo json_encode(["error" => "Brak category_id"]);
    exit;
}

$stmt = $conn->prepare(
    "SELECT id, name, price, image_url FROM products WHERE category_id = ?"
);
$stmt->execute([$category_id]);

echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC));
