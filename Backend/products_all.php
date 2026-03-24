<?php
require_once __DIR__ . '/config.php';


header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Credentials: true");
header("Access-Control-Allow-Headers: Content-Type");
header("Access-Control-Allow-Methods: GET, POST, OPTIONS");
header("Content-Type: application/json; charset=utf-8");

$stmt = $conn->query("
    SELECT id, name, price, image_url, category_id 
    FROM products
    ORDER BY name
");

echo json_encode($stmt->fetchAll(PDO::FETCH_ASSOC), JSON_UNESCAPED_UNICODE);
exit;
