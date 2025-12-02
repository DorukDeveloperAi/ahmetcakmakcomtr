<?php
include 'db.php';

try {
    // Get analytics data

    // Total conversations
    $stmt = $conn->prepare("SELECT COUNT(*) as total FROM chat_logs");
    $stmt->execute();
    $total = $stmt->fetch()['total'];

    // Sentiment distribution
    $stmt = $conn->prepare("
        SELECT sentiment, COUNT(*) as count 
        FROM chat_logs 
        GROUP BY sentiment
    ");
    $stmt->execute();
    $sentiments = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Popular queries (top 10 user messages)
    $stmt = $conn->prepare("
        SELECT user_message, COUNT(*) as count 
        FROM chat_logs 
        GROUP BY user_message 
        ORDER BY count DESC 
        LIMIT 10
    ");
    $stmt->execute();
    $popularQueries = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Daily activity (last 7 days)
    $stmt = $conn->prepare("
        SELECT DATE(created_at) as date, COUNT(*) as count 
        FROM chat_logs 
        WHERE created_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)
        GROUP BY DATE(created_at)
        ORDER BY date DESC
    ");
    $stmt->execute();
    $dailyActivity = $stmt->fetchAll(PDO::FETCH_ASSOC);

    // Unique sessions
    $stmt = $conn->prepare("SELECT COUNT(DISTINCT session_id) as unique_sessions FROM chat_logs");
    $stmt->execute();
    $uniqueSessions = $stmt->fetch()['unique_sessions'];

    // Average messages per session
    $avgMessagesPerSession = $uniqueSessions > 0 ? round($total / $uniqueSessions, 2) : 0;

    // Recent chats (last 20)
    $stmt = $conn->prepare("
        SELECT user_message, bot_response, sentiment, ip_address, created_at 
        FROM chat_logs 
        ORDER BY created_at DESC 
        LIMIT 20
    ");
    $stmt->execute();
    $recentChats = $stmt->fetchAll(PDO::FETCH_ASSOC);

    echo json_encode([
        'total_conversations' => $total,
        'unique_sessions' => $uniqueSessions,
        'avg_messages_per_session' => $avgMessagesPerSession,
        'sentiment_distribution' => $sentiments,
        'popular_queries' => $popularQueries,
        'daily_activity' => $dailyActivity,
        'recent_chats' => $recentChats
    ]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(['error' => 'Analytics error: ' . $e->getMessage()]);
}
?>