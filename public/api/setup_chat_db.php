<?php
include 'db.php';

try {
    // Enhanced Chat Logs Table with sentiment analysis and success status
    $sql = "CREATE TABLE IF NOT EXISTS chat_logs (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        user_message TEXT NOT NULL,
        bot_response TEXT NOT NULL,
        sentiment VARCHAR(20) DEFAULT 'neutral',
        is_helpful TINYINT(1) DEFAULT 1,
        ip_address VARCHAR(45),
        user_agent TEXT,
        session_id VARCHAR(100),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
        INDEX idx_sentiment (sentiment),
        INDEX idx_created_at (created_at)
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";

    $conn->exec($sql);

    // Add is_helpful column if not exists (migration for existing tables)
    try {
        $conn->query("SELECT is_helpful FROM chat_logs LIMIT 1");
    } catch (Exception $e) {
        $conn->exec("ALTER TABLE chat_logs ADD COLUMN is_helpful TINYINT(1) DEFAULT 1 AFTER sentiment");
    }

    // Knowledge Base Table
    $sql = "CREATE TABLE IF NOT EXISTS chat_knowledge_base (
        id INT(11) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        keywords TEXT NOT NULL,
        answer TEXT NOT NULL,
        lang VARCHAR(5) DEFAULT 'tr',
        category VARCHAR(50),
        created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
    ) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci";

    $conn->exec($sql);

    echo json_encode(["message" => "Chat logs and knowledge base tables setup completed."]);

} catch (PDOException $e) {
    http_response_code(500);
    echo json_encode(["error" => "Setup failed: " . $e->getMessage()]);
}
?>