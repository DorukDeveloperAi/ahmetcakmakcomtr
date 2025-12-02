<?php
include 'db.php';

header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");
header("Content-Type: application/json; charset=UTF-8");

ini_set('display_errors', 1);
error_reporting(E_ALL);

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

// Get JSON input
$data = json_decode(file_get_contents('php://input'), true);

if (!isset($data['user_message']) || !isset($data['bot_response'])) {
    http_response_code(400);
    echo json_encode(['error' => 'Missing required fields']);
    exit;
}

try {
    // Get client info
    $ip_address = $_SERVER['REMOTE_ADDR'] ?? 'unknown';
    $user_agent = $_SERVER['HTTP_USER_AGENT'] ?? 'unknown';
    $sentiment = $data['sentiment'] ?? 'neutral';
    $is_helpful = isset($data['is_helpful']) ? (int) $data['is_helpful'] : 1;

    // Generate or get session ID from cookie
    $session_id = $_COOKIE['chat_session_id'] ?? uniqid('chat_', true);
    if (!isset($_COOKIE['chat_session_id'])) {
        setcookie('chat_session_id', $session_id, time() + (86400 * 30), '/'); // 30 days
    }

    // Insert chat log
    $stmt = $conn->prepare("
        INSERT INTO chat_logs 
        (user_message, bot_response, sentiment, is_helpful, ip_address, user_agent, session_id) 
        VALUES (?, ?, ?, ?, ?, ?, ?)
    ");

    $stmt->execute([
        $data['user_message'],
        $data['bot_response'],
        $sentiment,
        $is_helpful,
        $ip_address,
        $user_agent,
        $session_id
    ]);

    echo json_encode(['success' => true, 'id' => $conn->lastInsertId()]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Database error: ' . $e->getMessage()]);
}
?>