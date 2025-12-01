import * as ftp from 'basic-ftp';
import path from 'path';
import { fileURLToPath } from 'url';

const __dirname = path.dirname(fileURLToPath(import.meta.url));

async function deploy() {
    const client = new ftp.Client();
    client.ftp.verbose = true;

    try {
        await client.access({
            host: "ahmetcakmak.com.tr",
            user: "ftp@ahmetcakmak.com.tr",
            password: "ERrPBsU8WVdDs6uCma4p",
            secure: false // Try false first, or true if explicit TLS is required. Many shared hosts use explicit TLS or plain FTP.
        });

        console.log("Connected to FTP");

        // List files to see where we are
        const list = await client.list();
        console.log("Current directory listing:", list.map(f => f.name));

        let targetDir = ".";
        const publicHtml = list.find(f => f.name === 'public_html' || f.name === 'www');

        if (publicHtml && publicHtml.isDirectory) {
            targetDir = publicHtml.name;
            console.log(`Found ${targetDir}, navigating into it.`);
            await client.cd(targetDir);
        } else {
            console.log("No public_html or www folder found, deploying to root.");
        }

        // Clear directory
        // Clear directory
        console.log("Clearing remote directory...");
        const remoteFiles = await client.list();
        for (const file of remoteFiles) {
            if (file.name === 'app-release.apk' || file.name === '.' || file.name === '..') {
                continue;
            }
            try {
                if (file.isDirectory) {
                    await client.removeDir(file.name);
                } else {
                    await client.remove(file.name);
                }
            } catch (e) {
                console.log(`Failed to remove ${file.name}:`, e);
            }
        }
        console.log("Remote directory cleared (preserved app-release.apk).");

        // Upload dist folder
        console.log("Uploading dist folder...");
        await client.uploadFromDir(path.join(__dirname, "dist"));
        console.log("Upload complete!");

    } catch (err) {
        console.log(err);
    }
    client.close();
}

deploy();
