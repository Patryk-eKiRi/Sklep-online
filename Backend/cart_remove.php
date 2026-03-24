<?php
session_start();

if (!isset($_SESSION['user_id'])) {
    http_response_code(401);
    echo json_encode(['error' => 'NOT_LOGGED_IN']);
    exit;
}

$data = json_decode(file_get_contents("php://input"), true);
$productId = $data['product_id'] ?? null;

if ($productId && isset($_SESSION['cart'][$productId])) {
    unset($_SESSION['cart'][$productId]);
}

echo json_encode([
    'success' => true,
    'cart' => $_SESSION['cart'] ?? []
]);
