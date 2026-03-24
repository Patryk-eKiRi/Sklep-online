<?php
declare(strict_types=1);

session_start();
require_once __DIR__ . '/config.php';

header('Content-Type: application/json; charset=utf-8');

$parentId = isset($_GET['parent_id']) ? (int)$_GET['parent_id'] : null;

if ($parentId === null) {
    $stmt = $conn->query(
        "SELECT id, name FROM categories WHERE parent_id IS NULL ORDER BY name"
    );
} else {
    $stmt = $conn->prepare(
        "SELECT id, name FROM categories WHERE parent_id = :pid ORDER BY name"
    );
    $stmt->execute(['pid' => $parentId]);
}

$data = $stmt->fetchAll(PDO::FETCH_ASSOC);


echo json_encode($data, JSON_UNESCAPED_UNICODE);
exit;
