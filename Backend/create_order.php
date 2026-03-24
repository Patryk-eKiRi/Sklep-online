<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Content-Type: application/json");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$conn = new mysqli("localhost", "root", "", "skidb");

$data = json_decode(file_get_contents("php://input"), true);

$user_id = $data["user_id"];
$items = $data["items"]; // tablica produktów

if (!$user_id || !$items) {
    echo json_encode(["status" => "error"]);
    exit;
}


$total = 0;
foreach ($items as $item) {
    $total += $item["price"];
}


$conn->query("INSERT INTO orders (user_id, total_price) VALUES ($user_id, $total)");
$order_id = $conn->insert_id;

foreach ($items as $item) {
    $product_id = $item["id"];
    $price = $item["price"];

    $conn->query("
        INSERT INTO order_items (order_id, product_id, price)
        VALUES ($order_id, $product_id, $price)
    ");
}

echo json_encode(["status" => "ok"]);