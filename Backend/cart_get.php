<?php
session_start();
require 'config.php';

if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['error' => 'NOT_LOGGED_IN']);
    exit;
}

if (!isset($_SESSION['cart']) || empty($_SESSION['cart'])) {
    echo json_encode([]);
    exit;
}

$result = [];

foreach ($_SESSION['cart'] as $id => $qty) {
    $stmt = $conn->prepare("SELECT id, name, price FROM products WHERE id = ?");
    $stmt->execute([$id]);
    $product = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($product) {
        $product['quantity'] = $qty;
        $result[] = $product;
    }
}

echo json_encode($result);
