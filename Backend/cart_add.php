<?php
session_start();
require 'config.php';

if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['error' => 'NOT_LOGGED_IN']);
    exit;
}

$data = json_decode(file_get_contents("php://input"), true);
$productId = $data['product_id'] ?? null;

if (!$productId) {
    http_response_code(400);
    echo json_encode(['error' => 'NO_PRODUCT_ID']);
    exit;
}

if (!isset($_SESSION['cart'])) {
    $_SESSION['cart'] = [];
}

$_SESSION['cart'][$productId] = ($_SESSION['cart'][$productId] ?? 0) + 1;

echo json_encode([
    'success' => true,
    'cart' => $_SESSION['cart']
]);
