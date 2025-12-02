import * as ftp from 'basic-ftp';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

async function deployDatabase() {
    const client = new ftp.Client();
    client.ftp.verbose = true;

    try {
        await client.access({
            host: "ahmetcakmak.com.tr",
            user: "ftp@ahmetcakmak.com.tr",
            password: "ERrPBsU8WVdDs6uCma4p",
            secure: false
        });

        console.log("✅ Connected to FTP");

        // Navigate to public_html
        const list = await client.list();
        const publicHtml = list.find(f => f.name === 'public_html' || f.name === 'www');

        if (publicHtml && publicHtml.isDirectory) {
            await client.cd(publicHtml.name);
            console.log(`✅ Navigated to ${publicHtml.name}`);
        }

        // Create db-deploy folder and navigate into it
        await client.ensureDir('db-deploy');
        console.log("✅ Created/verified db-deploy folder");

        // Upload init.sql
        console.log("📤 Uploading init.sql...");
        await client.uploadFrom(
            path.join(__dirname, 'docker', 'init.sql'),
            'init.sql'
        );
        console.log("✅ init.sql uploaded");

        // Upload deploy-database.php
        console.log("📤 Uploading deploy-database.php...");
        await client.uploadFrom(
            path.join(__dirname, 'deploy-database.php'),
            'deploy-database.php'
        );
        console.log("✅ deploy-database.php uploaded");

        console.log("\n🎉 Database deployment files uploaded successfully!");
        console.log("\n📋 Next steps:");
        console.log("1. Visit: https://ahmetcakmak.com.tr/db-deploy/deploy-database.php");
        console.log("2. The script will automatically deploy the database");
        console.log("3. You can delete the db-deploy folder after deployment");

    } catch (err) {
        console.error("❌ Error:", err);
    }

    client.close();
}

deployDatabase();
