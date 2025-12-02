<?php
/**
 * Database Deployment Script
 * This script deploys the database schema and initial data to the production server
 */

ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Database configuration
$host = 'localhost';
$username = 'ahmetcak_admin';
$password = 'YFatFw9K5WPJnJkVAUeH';
$database = 'ahmetcak_db';

// Read SQL file
$sqlFile = __DIR__ . '/init.sql';

if (!file_exists($sqlFile)) {
    die("❌ Error: init.sql file not found!\n");
}

$sqlContent = file_get_contents($sqlFile);

if ($sqlContent === false) {
    die("❌ Error: Could not read init.sql file!\n");
}

echo "🗄️  Database deployment starting...\n\n";

// Create connection
$mysqli = new mysqli($host, $username, $password, $database);

// Check connection
if ($mysqli->connect_error) {
    die("❌ Connection failed: " . $mysqli->connect_error . "\n");
}

echo "✅ Connected to MySQL server\n\n";

// Set charset
$mysqli->set_charset("utf8mb4");

// Drop existing tables
echo "🗑️  Dropping existing tables...\n";
$dropTables = [
    'chat_logs',
    'chat_knowledge_base',
    'testimonials',
    'blogs'
];

foreach ($dropTables as $table) {
    $mysqli->query("DROP TABLE IF EXISTS `$table`");
}
echo "✅ Tables dropped\n\n";

// Execute SQL script
echo "📝 Executing SQL script...\n";

try {
    if ($mysqli->multi_query($sqlContent)) {
        do {
            // store first result set
            if ($result = $mysqli->store_result()) {
                $result->free();
            }
        } while ($mysqli->more_results() && $mysqli->next_result());
        echo "✅ Database schema created and data inserted\n\n";
    } else {
        echo "❌ Error executing SQL: " . $mysqli->error . "\n";
    }
} catch (Exception $e) {
    echo "❌ Exception: " . $e->getMessage() . "\n";
}

// Verify tables
echo "📊 Created tables:\n";
$result = $mysqli->query("SHOW TABLES");

if ($result) {
    while ($row = $result->fetch_array()) {
        $tableName = $row[0];
        $countResult = $mysqli->query("SELECT COUNT(*) as count FROM `$tableName`");
        $count = $countResult->fetch_assoc()['count'];
        echo "  - $tableName ($count rows)\n";
    }
    $result->free();
}

echo "\n✅ Database deployment completed successfully!\n";

$mysqli->close();
?>