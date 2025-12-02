<?php
include 'db.php';

header('Content-Type: application/json; charset=utf-8');
ini_set('display_errors', 1);
error_reporting(E_ALL);

$response = [];

try {
    // 1. Tabloları Listele
    $stmt = $conn->query("SHOW TABLES");
    $tables = $stmt->fetchAll(PDO::FETCH_COLUMN);
    $response['tables'] = $tables;

    // 2. chat_logs Tablosunu İncele
    if (in_array('chat_logs', $tables)) {
        $stmt = $conn->query("DESCRIBE chat_logs");
        $response['chat_logs_columns'] = $stmt->fetchAll(PDO::FETCH_ASSOC);
    } else {
        $response['error'] = "chat_logs tablosu bulunamadı!";
    }

    // 3. Test Kaydı Ekleme Denemesi
    try {
        $stmt = $conn->prepare("INSERT INTO chat_logs (user_message, bot_response, sentiment, ip_address, user_agent, session_id) VALUES (?, ?, ?, ?, ?, ?)");
        $stmt->execute(['TEST_MSG', 'TEST_RESPONSE', 'neutral', '127.0.0.1', 'DebugScript', 'debug_session']);
        $response['insert_test'] = "Başarılı: Test kaydı eklendi (ID: " . $conn->lastInsertId() . ")";
    } catch (Exception $e) {
        $response['insert_test_error'] = $e->getMessage();
    }

} catch (PDOException $e) {
    $response['connection_error'] = $e->getMessage();
}

echo json_encode($response, JSON_PRETTY_PRINT);
?>