import mysql from 'mysql2/promise';
import fs from 'fs';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

async function deployDatabase() {
    console.log('🗄️  Database deployment starting...\n');

    const connection = await mysql.createConnection({
        host: 'localhost',
        user: 'ahmetcak_admin',
        password: 'YFatFw9K5WPJnJkVAUeH',
        database: 'ahmetcak_db',
        multipleStatements: true
    });

    try {
        console.log('✅ Connected to MySQL server\n');

        // Read SQL file
        const sqlFile = fs.readFileSync(path.join(__dirname, 'docker/init.sql'), 'utf8');

        console.log('🗑️  Dropping existing tables...');
        await connection.query('DROP TABLE IF EXISTS chat_logs, chat_knowledge_base, testimonials, blogs');
        console.log('✅ Tables dropped\n');

        console.log('📝 Executing SQL script...');
        await connection.query(sqlFile);
        console.log('✅ Database schema created and data inserted\n');

        // Verify
        const [tables] = await connection.query('SHOW TABLES');
        console.log('📊 Created tables:');
        tables.forEach(t => console.log('  - ' + Object.values(t)[0]));

        console.log('\n✅ Database deployment completed successfully!');

    } catch (error) {
        console.error('❌ Database deployment failed:', error);
        throw error;
    } finally {
        await connection.end();
    }
}

deployDatabase();
