<?php
include 'db.php';

$lang = isset($_GET['lang']) ? $_GET['lang'] : 'tr';

try {
    $stmt = $conn->prepare("SELECT * FROM testimonials WHERE lang = ? ORDER BY created_at DESC");
    $stmt->execute([$lang]);
    $result = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode($result);
} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => $e->getMessage()]);
}
?>