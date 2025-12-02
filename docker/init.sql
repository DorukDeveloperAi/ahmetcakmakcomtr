-- MySQL dump 10.13  Distrib 8.0.44, for Linux (x86_64)
--
-- Host: localhost    Database: ahmetcak_db
-- ------------------------------------------------------
-- Server version	8.0.44

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `blogs`
--

DROP TABLE IF EXISTS `blogs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tr',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `summary` text COLLATE utf8mb4_unicode_ci,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blogs`
--

LOCK TABLES `blogs` WRITE;
/*!40000 ALTER TABLE `blogs` DISABLE KEYS */;
INSERT INTO `blogs` VALUES (1,'tr','Modern Web GeliÅŸtirme Trendleri 2025','modern-web-gelistirme-2025','2025 yÄ±lÄ±nda web geliÅŸtirme dÃ¼nyasÄ±nda Ã¶ne Ã§Ä±kan teknolojiler ve yaklaÅŸÄ±mlar.','# Modern Web GeliÅŸtirme Trendleri 2025\n\nTeknoloji dÃ¼nyasÄ± hÄ±zla deÄŸiÅŸiyor. Ä°ÅŸte 2025\'te dikkat etmeniz gerekenler:\n\n1. **AI Destekli Kodlama:** ArtÄ±k standart.\n2. **Serverless Mimariler:** Daha da yaygÄ±nlaÅŸÄ±yor.\n3. **WebAssembly:** Performans gerektiren iÅŸlerde JavaScript\'in yerini alÄ±yor.\n\nDetaylar yakÄ±nda...','https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop','Teknoloji','2025-12-02 10:44:47'),(2,'tr','Antigravity ile Kodlama: Yapay ZekanÄ±n GeleceÄŸi','antigravity-ile-kodlama','Google\'Ä±n geliÅŸmiÅŸ yapay zeka kodlama asistanÄ± Antigravity\'nin yeteneklerini ve geliÅŸtirme sÃ¼recini nasÄ±l devrimleÅŸtirdiÄŸini keÅŸfedin.','# Antigravity ile Kodlama\n\nYapay zeka kodlama asistanlarÄ± artÄ±k sadece kod tamamlama yapmÄ±yor. Antigravity gibi geliÅŸmiÅŸ sistemler tÃ¼m projeleri yÃ¶netebiliyor.\n\n## Ã–zellikler\n- Tam otonom kod yazma\n- Proje yÃ¶netimi\n- Hata dÃ¼zeltme\n\nDetaylar yakÄ±nda...','https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop','Yapay Zeka','2025-12-02 10:44:47'),(3,'en','Modern Web Development Trends 2025','modern-web-development-2025','Technologies and approaches standing out in the web development world in 2025.','# Modern Web Development Trends 2025\n\nThe technology world is changing rapidly. Here is what you need to watch out for in 2025:\n\n1. **AI-Assisted Coding:** Now standard.\n2. **Serverless Architectures:** Becoming even more widespread.\n3. **WebAssembly:** Replacing JavaScript in performance-critical tasks.\n\nDetails coming soon...','https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop','Technology','2025-12-02 10:44:47'),(4,'en','Coding with Antigravity: The Future of AI','coding-with-antigravity','Exploring the capabilities of Google\'s advanced AI coding assistant, Antigravity, and how it revolutionizes the development workflow.','# Coding with Antigravity\n\nAI coding assistants now do more than just code completion. Advanced systems like Antigravity can manage entire projects.\n\n## Features\n- Fully autonomous code writing\n- Project management\n- Bug fixing\n\nDetails coming soon...','https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop','Artificial Intelligence','2025-12-02 10:44:47'),(5,'de','Moderne Webentwicklungstrends 2025','moderne-webentwicklungstrends-2025','Technologien und AnsÃ¤tze, die 2025 in der Welt der Webentwicklung hervorstechen.','# Moderne Webentwicklungstrends 2025\n\nDie Technologiewelt verÃ¤ndert sich rasant. Hier ist, worauf Sie 2025 achten mÃ¼ssen:\n\n1. **KI-gestÃ¼tztes Coding:** Jetzt Standard.\n2. **Serverless-Architekturen:** Werden noch weiter verbreitet.\n3. **WebAssembly:** Ersetzt JavaScript bei leistungsintensiven Aufgaben.\n\nDetails folgen bald...','https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop','Technologie','2025-12-02 10:44:47'),(6,'de','Programmieren mit Antigravity: Die Zukunft der KI','programmieren-mit-antigravity','Entdecken Sie die FÃ¤higkeiten von Googles fortschrittlichem KI-Coding-Assistenten Antigravity und wie er den Entwicklungsprozess revolutioniert.','# Programmieren mit Antigravity\n\nKI-Coding-Assistenten machen jetzt mehr als nur Code-VervollstÃ¤ndigung. Fortgeschrittene Systeme wie Antigravity kÃ¶nnen ganze Projekte verwalten.\n\n## Funktionen\n- Vollautonomes Schreiben von Code\n- Projektmanagement\n- Fehlerbehebung\n\nDetails folgen bald...','https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop','KÃ¼nstliche Intelligenz','2025-12-02 10:44:47'),(7,'ar','Ø§ØªØ¬Ø§Ù‡Ø§Øª ØªØ·ÙˆÙŠØ± Ø§Ù„ÙˆÙŠØ¨ Ø§Ù„Ø­Ø¯ÙŠØ«Ø© 2025','modern-web-development-trends-2025-ar','Ø§Ù„ØªÙ‚Ù†ÙŠØ§Øª ÙˆØ§Ù„Ù…Ù†Ø§Ù‡Ø¬ Ø§Ù„ØªÙŠ ØªØ¨Ø±Ø² ÙÙŠ Ø¹Ø§Ù„Ù… ØªØ·ÙˆÙŠØ± Ø§Ù„ÙˆÙŠØ¨ ÙÙŠ Ø¹Ø§Ù… 2025.','# Ø§ØªØ¬Ø§Ù‡Ø§Øª ØªØ·ÙˆÙŠØ± Ø§Ù„ÙˆÙŠØ¨ Ø§Ù„Ø­Ø¯ÙŠØ«Ø© 2025\n\nØ¹Ø§Ù„Ù… Ø§Ù„ØªÙƒÙ†ÙˆÙ„ÙˆØ¬ÙŠØ§ ÙŠØªØºÙŠØ± Ø¨Ø³Ø±Ø¹Ø©. Ø¥Ù„ÙŠÙƒ Ù…Ø§ ØªØ­ØªØ§Ø¬ Ø¥Ù„Ù‰ Ø§Ù„Ø§Ù†ØªØ¨Ø§Ù‡ Ø¥Ù„ÙŠÙ‡ ÙÙŠ Ø¹Ø§Ù… 2025:\n\n1. **Ø§Ù„Ø¨Ø±Ù…Ø¬Ø© Ø¨Ù…Ø³Ø§Ø¹Ø¯Ø© Ø§Ù„Ø°ÙƒØ§Ø¡ Ø§Ù„Ø§ØµØ·Ù†Ø§Ø¹ÙŠ:** Ø£ØµØ¨Ø­Øª Ø§Ù„Ø¢Ù† Ù…Ø¹ÙŠØ§Ø±Ù‹Ø§.\n2. **Ø§Ù„Ø¨Ù†Ù‰ Ø§Ù„ØªØ­ØªÙŠØ© Ø¨Ø¯ÙˆÙ† Ø®Ø§Ø¯Ù… (Serverless):** Ø£ØµØ¨Ø­Øª Ø£ÙƒØ«Ø± Ø§Ù†ØªØ´Ø§Ø±Ù‹Ø§.\n3. **WebAssembly:** ØªØ­Ù„ Ù…Ø­Ù„ JavaScript ÙÙŠ Ø§Ù„Ù…Ù‡Ø§Ù… Ø§Ù„ØªÙŠ ØªØªØ·Ù„Ø¨ Ø£Ø¯Ø§Ø¡Ù‹ Ø¹Ø§Ù„ÙŠÙ‹Ø§.\n\nØ§Ù„ØªÙØ§ØµÙŠÙ„ Ù‚Ø±ÙŠØ¨Ø§...','https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop','ØªÙƒÙ†ÙˆÙ„ÙˆØ¬ÙŠØ§','2025-12-02 10:44:47'),(8,'ar','Ø§Ù„Ø¨Ø±Ù…Ø¬Ø© Ù…Ø¹ Antigravity: Ù…Ø³ØªÙ‚Ø¨Ù„ Ø§Ù„Ø°ÙƒØ§Ø¡ Ø§Ù„Ø§ØµØ·Ù†Ø§Ø¹ÙŠ','coding-with-antigravity-ar','Ø§Ø³ØªÙƒØ´Ø§Ù Ù‚Ø¯Ø±Ø§Øª Ù…Ø³Ø§Ø¹Ø¯ Ø§Ù„Ø¨Ø±Ù…Ø¬Ø© Ø¨Ø§Ù„Ø°ÙƒØ§Ø¡ Ø§Ù„Ø§ØµØ·Ù†Ø§Ø¹ÙŠ Ø§Ù„Ù…ØªÙ‚Ø¯Ù… Ù…Ù† GoogleØŒ AntigravityØŒ ÙˆÙƒÙŠÙ ÙŠØ­Ø¯Ø« Ø«ÙˆØ±Ø© ÙÙŠ Ø³ÙŠØ± Ø¹Ù…Ù„ Ø§Ù„ØªØ·ÙˆÙŠØ±.','# Ø§Ù„Ø¨Ø±Ù…Ø¬Ø© Ù…Ø¹ Antigravity\n\nÙ…Ø³Ø§Ø¹Ø¯Ùˆ Ø§Ù„Ø¨Ø±Ù…Ø¬Ø© Ø¨Ø§Ù„Ø°ÙƒØ§Ø¡ Ø§Ù„Ø§ØµØ·Ù†Ø§Ø¹ÙŠ ÙŠÙØ¹Ù„ÙˆÙ† Ø§Ù„Ø¢Ù† Ø£ÙƒØ«Ø± Ù…Ù† Ù…Ø¬Ø±Ø¯ Ø¥ÙƒÙ…Ø§Ù„ Ø§Ù„ØªØ¹Ù„ÙŠÙ…Ø§Øª Ø§Ù„Ø¨Ø±Ù…Ø¬ÙŠØ©. ÙŠÙ…ÙƒÙ† Ù„Ù„Ø£Ù†Ø¸Ù…Ø© Ø§Ù„Ù…ØªÙ‚Ø¯Ù…Ø© Ù…Ø«Ù„ Antigravity Ø¥Ø¯Ø§Ø±Ø© Ù…Ø´Ø§Ø±ÙŠØ¹ Ø¨Ø£ÙƒÙ…Ù„Ù‡Ø§.\n\n## Ø§Ù„Ù…ÙŠØ²Ø§Øª\n- ÙƒØªØ§Ø¨Ø© Ø§Ù„ØªØ¹Ù„ÙŠÙ…Ø§Øª Ø§Ù„Ø¨Ø±Ù…Ø¬ÙŠØ© Ø¨Ø´ÙƒÙ„ Ù…Ø³ØªÙ‚Ù„ ØªÙ…Ø§Ù…Ù‹Ø§\n- Ø¥Ø¯Ø§Ø±Ø© Ø§Ù„Ù…Ø´Ø§Ø±ÙŠØ¹\n- Ø¥ØµÙ„Ø§Ø­ Ø§Ù„Ø£Ø®Ø·Ø§Ø¡\n\nØ§Ù„ØªÙØ§ØµÙŠÙ„ Ù‚Ø±ÙŠØ¨Ø§...','https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop','Ø§Ù„Ø°ÙƒØ§Ø¡ Ø§Ù„Ø§ØµØ·Ù†Ø§Ø¹ÙŠ','2025-12-02 10:44:47'),(9,'ru','Ð¢Ñ€ÐµÐ½Ð´Ñ‹ ÑÐ¾Ð²Ñ€ÐµÐ¼ÐµÐ½Ð½Ð¾Ð¹ Ð²ÐµÐ±-Ñ€Ð°Ð·Ñ€Ð°Ð±Ð¾Ñ‚ÐºÐ¸ 2025','modern-web-development-trends-2025-ru','Ð¢ÐµÑ…Ð½Ð¾Ð»Ð¾Ð³Ð¸Ð¸ Ð¸ Ð¿Ð¾Ð´Ñ…Ð¾Ð´Ñ‹, Ð²Ñ‹Ð´ÐµÐ»ÑÑŽÑ‰Ð¸ÐµÑÑ Ð² Ð¼Ð¸Ñ€Ðµ Ð²ÐµÐ±-Ñ€Ð°Ð·Ñ€Ð°Ð±Ð¾Ñ‚ÐºÐ¸ Ð² 2025 Ð³Ð¾Ð´Ñƒ.','# Ð¢Ñ€ÐµÐ½Ð´Ñ‹ ÑÐ¾Ð²Ñ€ÐµÐ¼ÐµÐ½Ð½Ð¾Ð¹ Ð²ÐµÐ±-Ñ€Ð°Ð·Ñ€Ð°Ð±Ð¾Ñ‚ÐºÐ¸ 2025\n\nÐœÐ¸Ñ€ Ñ‚ÐµÑ…Ð½Ð¾Ð»Ð¾Ð³Ð¸Ð¹ Ð±Ñ‹ÑÑ‚Ñ€Ð¾ Ð¼ÐµÐ½ÑÐµÑ‚ÑÑ. Ð’Ð¾Ñ‚ Ð½Ð° Ñ‡Ñ‚Ð¾ Ð½ÑƒÐ¶Ð½Ð¾ Ð¾Ð±Ñ€Ð°Ñ‚Ð¸Ñ‚ÑŒ Ð²Ð½Ð¸Ð¼Ð°Ð½Ð¸Ðµ Ð² 2025 Ð³Ð¾Ð´Ñƒ:\n\n1. **ÐšÐ¾Ð´Ð¸Ð½Ð³ Ñ Ð˜Ð˜:** Ð¢ÐµÐ¿ÐµÑ€ÑŒ ÑÑ‚Ð°Ð½Ð´Ð°Ñ€Ñ‚.\n2. **Ð‘ÐµÑÑÐµÑ€Ð²ÐµÑ€Ð½Ñ‹Ðµ Ð°Ñ€Ñ…Ð¸Ñ‚ÐµÐºÑ‚ÑƒÑ€Ñ‹:** Ð¡Ñ‚Ð°Ð½Ð¾Ð²ÑÑ‚ÑÑ ÐµÑ‰Ðµ Ð±Ð¾Ð»ÐµÐµ Ñ€Ð°ÑÐ¿Ñ€Ð¾ÑÑ‚Ñ€Ð°Ð½ÐµÐ½Ð½Ñ‹Ð¼Ð¸.\n3. **WebAssembly:** Ð—Ð°Ð¼ÐµÐ½ÑÐµÑ‚ JavaScript Ð² Ð·Ð°Ð´Ð°Ñ‡Ð°Ñ…, Ñ‚Ñ€ÐµÐ±ÑƒÑŽÑ‰Ð¸Ñ… Ð²Ñ‹ÑÐ¾ÐºÐ¾Ð¹ Ð¿Ñ€Ð¾Ð¸Ð·Ð²Ð¾Ð´Ð¸Ñ‚ÐµÐ»ÑŒÐ½Ð¾ÑÑ‚Ð¸.\n\nÐŸÐ¾Ð´Ñ€Ð¾Ð±Ð½Ð¾ÑÑ‚Ð¸ ÑÐºÐ¾Ñ€Ð¾...','https://images.unsplash.com/photo-1498050108023-c5249f4df085?q=80&w=600&auto=format&fit=crop','Ð¢ÐµÑ…Ð½Ð¾Ð»Ð¾Ð³Ð¸Ð¸','2025-12-02 10:44:47'),(10,'ru','ÐŸÑ€Ð¾Ð³Ñ€Ð°Ð¼Ð¼Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ Ñ Antigravity: Ð‘ÑƒÐ´ÑƒÑ‰ÐµÐµ Ð˜Ð˜','coding-with-antigravity-ru','Ð˜Ð·ÑƒÑ‡ÐµÐ½Ð¸Ðµ Ð²Ð¾Ð·Ð¼Ð¾Ð¶Ð½Ð¾ÑÑ‚ÐµÐ¹ Ð¿ÐµÑ€ÐµÐ´Ð¾Ð²Ð¾Ð³Ð¾ Ð˜Ð˜-Ð°ÑÑÐ¸ÑÑ‚ÐµÐ½Ñ‚Ð° Ð¿Ð¾ Ð¿Ñ€Ð¾Ð³Ñ€Ð°Ð¼Ð¼Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸ÑŽ Ð¾Ñ‚ Google, Antigravity, Ð¸ Ñ‚Ð¾Ð³Ð¾, ÐºÐ°Ðº Ð¾Ð½ Ñ€ÐµÐ²Ð¾Ð»ÑŽÑ†Ð¸Ð¾Ð½Ð¸Ð·Ð¸Ñ€ÑƒÐµÑ‚ Ð¿Ñ€Ð¾Ñ†ÐµÑÑ Ñ€Ð°Ð·Ñ€Ð°Ð±Ð¾Ñ‚ÐºÐ¸.','# ÐŸÑ€Ð¾Ð³Ñ€Ð°Ð¼Ð¼Ð¸Ñ€Ð¾Ð²Ð°Ð½Ð¸Ðµ Ñ Antigravity\n\nÐ˜Ð˜-Ð°ÑÑÐ¸ÑÑ‚ÐµÐ½Ñ‚Ñ‹ Ñ‚ÐµÐ¿ÐµÑ€ÑŒ Ð´ÐµÐ»Ð°ÑŽÑ‚ Ð±Ð¾Ð»ÑŒÑˆÐµ, Ñ‡ÐµÐ¼ Ð¿Ñ€Ð¾ÑÑ‚Ð¾ Ð°Ð²Ñ‚Ð¾Ð´Ð¾Ð¿Ð¾Ð»Ð½ÐµÐ½Ð¸Ðµ ÐºÐ¾Ð´Ð°. ÐŸÐµÑ€ÐµÐ´Ð¾Ð²Ñ‹Ðµ ÑÐ¸ÑÑ‚ÐµÐ¼Ñ‹, Ñ‚Ð°ÐºÐ¸Ðµ ÐºÐ°Ðº Antigravity, Ð¼Ð¾Ð³ÑƒÑ‚ ÑƒÐ¿Ñ€Ð°Ð²Ð»ÑÑ‚ÑŒ Ñ†ÐµÐ»Ñ‹Ð¼Ð¸ Ð¿Ñ€Ð¾ÐµÐºÑ‚Ð°Ð¼Ð¸.\n\n## ÐžÑÐ¾Ð±ÐµÐ½Ð½Ð¾ÑÑ‚Ð¸\n- ÐŸÐ¾Ð»Ð½Ð¾ÑÑ‚ÑŒÑŽ Ð°Ð²Ñ‚Ð¾Ð½Ð¾Ð¼Ð½Ð¾Ðµ Ð½Ð°Ð¿Ð¸ÑÐ°Ð½Ð¸Ðµ ÐºÐ¾Ð´Ð°\n- Ð£Ð¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð¿Ñ€Ð¾ÐµÐºÑ‚Ð°Ð¼Ð¸\n- Ð˜ÑÐ¿Ñ€Ð°Ð²Ð»ÐµÐ½Ð¸Ðµ Ð¾ÑˆÐ¸Ð±Ð¾Ðº\n\nÐŸÐ¾Ð´Ñ€Ð¾Ð±Ð½Ð¾ÑÑ‚Ð¸ ÑÐºÐ¾Ñ€Ð¾...','https://images.unsplash.com/photo-1620712943543-bcc4688e7485?q=80&w=600&auto=format&fit=crop','Ð˜ÑÐºÑƒÑÑÑ‚Ð²ÐµÐ½Ð½Ñ‹Ð¹ Ð˜Ð½Ñ‚ÐµÐ»Ð»ÐµÐºÑ‚','2025-12-02 10:44:47');
/*!40000 ALTER TABLE `blogs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_knowledge_base`
--

DROP TABLE IF EXISTS `chat_knowledge_base`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_knowledge_base` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `keywords` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci DEFAULT 'tr',
  `category` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_knowledge_base`
--

LOCK TABLES `chat_knowledge_base` WRITE;
/*!40000 ALTER TABLE `chat_knowledge_base` DISABLE KEYS */;
INSERT INTO `chat_knowledge_base` VALUES (1,'kimsin,sen kimsin,ahmet kim,ahmet cakmak kimdir,kendini tanit','Ben Ahmet Çakmak\'ın yapay zeka asistanıyım. Ahmet, 10 yılı aşkın deneyime sahip bir Bilgi İşlem Uzmanı ve Full Stack Geliştiricidir. Kocaeli Üniversitesi Bilgisayar Öğretmenliği mezunudur.','tr','about','2025-12-02 11:30:25'),(2,'ne is yapiyorsun,meslegin ne,uzmanlik alanin','Bilgi İşlem Uzmanı ve Full Stack Geliştirici olarak çalışıyorum. Web geliştirme, sistem yönetimi, ERP/CRM çözümleri ve yapay zeka entegrasyonları konusunda uzmanım.','tr','about','2025-12-02 11:30:25'),(3,'egitim,okul,universite,hangi bolum,mezuniyet','Kocaeli Üniversitesi Bilgisayar Öğretmenliği bölümü mezunuyum.','tr','education','2025-12-02 11:30:25'),(4,'deneyim,tecrube,is gecmisi,nerede calistin,hangi firmalar','10+ yıllık deneyimim var. Şu anda Özel Doruk Nilüfer Hastanesi\'nde Bilgi İşlem Uzmanı olarak çalışıyorum. Daha önce Motif Mensucat, Hamzagil Emprime ve Ente Tanıtım firmalarında görev aldım.','tr','experience','2025-12-02 11:30:25'),(5,'su an nerede calisiyorsun,mevcut isin,calisiyor musun','Şu anda Özel Doruk Nilüfer Hastanesi\'nde Bilgi İşlem Uzmanı olarak çalışmaktayım. Ayrıca freelance projelere de açığım.','tr','experience','2025-12-02 11:30:25'),(6,'hizmetler,neler yapiyorsun,ne sunuyorsun,servisler','Sunduğum başlıca hizmetler: Web Site Danışmanlığı, ERP & CRM Çözümleri, Sosyal Medya Yönetimi, BT Altyapı Danışmanlığı ve Yapay Zeka Entegrasyonu.','tr','services','2025-12-02 11:30:25'),(7,'web sitesi,internet sitesi,web tasarim,kurumsal site,site yaptirmak','Modern, responsive (mobil uyumlu) ve SEO dostu kurumsal web siteleri geliştiriyorum. İhtiyacınıza özel çözümler sunabilirim.','tr','services','2025-12-02 11:30:25'),(8,'mobil uygulama,android,ios,app,uygulama gelistirme','React Native ve Capacitor teknolojileri ile hem iOS hem de Android için çalışabilen mobil uygulamalar geliştiriyorum.','tr','services','2025-12-02 11:30:25'),(9,'seo,arama motoru,google siralamasi,seo danismanligi','Web sitenizin arama motorlarında üst sıralarda yer alması için SEO (Arama Motoru Optimizasyonu) danışmanlığı veriyorum.','tr','services','2025-12-02 11:30:25'),(10,'erp,crm,yazilim,ozel yazilim,is takibi,musteri takibi','İş süreçlerinizi ve müşteri ilişkilerinizi yönetebileceğiniz web tabanlı özel ERP ve CRM yazılımları geliştiriyorum.','tr','services','2025-12-02 11:30:25'),(11,'yapay zeka,ai,otomasyon,chatgpt entegrasyonu,llm','İş süreçlerinizi otomatize etmek ve verimliliği artırmak için yapay zeka modellerini (LLM) sistemlerinize entegre ediyorum.','tr','services','2025-12-02 11:30:25'),(12,'iletisim,mail,telefon,adres,nasil ulasirim','Bana sitedeki iletişim formundan veya ahmet@example.com mail adresinden ulaşabilirsiniz. En kısa sürede dönüş yaparım!','tr','contact','2025-12-02 11:30:25'),(13,'freelance,is aliyor musun,musaitlik,proje','Evet, şu anda freelance işler için uygunum ve yeni projelere açığım. Detayları konuşmak için iletişime geçebilirsiniz.','tr','contact','2025-12-02 11:30:25'),(14,'fiyat,ucret,kac para,ne kadar,butce','Fiyatlandırma projenin kapsamına, özelliklerine ve süresine göre değişmektedir. Detaylı bir teklif için lütfen projenizden bahsedin.','tr','pricing','2025-12-02 11:30:25'),(15,'teknolojiler,hangi diller,kullandigin programlar,tech stack','Genellikle React, Node.js, PHP, Python, MySQL/MSSQL, Docker ve Git teknolojilerini kullanıyorum.','tr','tech','2025-12-02 11:30:25'),(16,'who are you,who is ahmet,tell me about yourself','I am Ahmet\'s AI assistant. Ahmet is an IT Specialist and Full Stack Developer with over 10 years of experience. He is a graduate of Kocaeli University Computer Education.','en','about','2025-12-02 11:30:25'),(17,'what do you do,profession,job','I work as an IT Specialist and Full Stack Developer. I specialize in web development, system administration, ERP/CRM solutions, and AI integration.','en','about','2025-12-02 11:30:25'),(18,'experience,work history,companies,where did you work','I have 10+ years of experience. Currently working at Private Doruk Nilüfer Hospital as an IT Specialist. Previously worked at Motif Mensucat, Hamzagil Emprime, and Ente Tanıtım.','en','experience','2025-12-02 11:30:25'),(19,'services,what do you offer,consultancy','My main services include: Website Consultancy, ERP & CRM Solutions, Social Media Management, IT Infrastructure Consultancy, and AI Integration.','en','services','2025-12-02 11:30:25'),(20,'web development,website,web design','I develop modern, responsive, and SEO-friendly corporate websites tailored to your needs.','en','services','2025-12-02 11:30:25'),(21,'mobile app,android,ios,application','I develop cross-platform mobile applications for both iOS and Android using React Native and Capacitor.','en','services','2025-12-02 11:30:25'),(22,'contact,email,phone,reach out','You can reach me via the contact form on the site or email at ahmet@example.com. I\'ll get back to you as soon as possible!','en','contact','2025-12-02 11:30:25'),(23,'freelance,available,hiring','Yes, I am currently available for freelance work and open to new opportunities. Feel free to contact me to discuss your project.','en','contact','2025-12-02 11:30:25'),(24,'price,cost,how much,budget,quote','Pricing depends on the project scope, features, and timeline. Please contact me for a detailed quote.','en','pricing','2025-12-02 11:30:25'),(25,'technologies,stack,programming languages,skills','I mostly use React, Node.js, PHP, Python, MySQL/MSSQL, Docker, and Git.','en','tech','2025-12-02 11:30:25');
/*!40000 ALTER TABLE `chat_knowledge_base` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chat_logs`
--

DROP TABLE IF EXISTS `chat_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `chat_logs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `user_message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `bot_response` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sentiment` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'neutral',
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `session_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `idx_sentiment` (`sentiment`),
  KEY `idx_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chat_logs`
--

LOCK TABLES `chat_logs` WRITE;
/*!40000 ALTER TABLE `chat_logs` DISABLE KEYS */;
INSERT INTO `chat_logs` VALUES (1,'merhaba','Selam! Projelerim hakkında bilgi almak ister misin?','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 10:46:11'),(2,'price','Fiyatlandırma proje bazlı değişmektedir. Detaylı bilgi ve teklif için benimle iletişime geçebilirsiniz! 💰','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 10:47:29'),(3,'iletişim','Ahmet\'e ahmet@example.com adresinden ulaşabilirsin.','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 10:47:55'),(4,'telefon','Bana ahmet@example.com adresinden veya iletiÅŸim formundan ulaÅŸabilirsiniz.','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 10:48:02'),(5,'sen kimsin','Ben Ahmet\'in yapay zeka asistanÄ±yÄ±m. Size projeler ve hizmetler hakkÄ±nda bilgi verebilirim.','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 10:51:28'),(6,'kimsin','Ben Ahmet\'in yapay zeka asistanÄ±yÄ±m. Size projeler ve hizmetler hakkÄ±nda bilgi verebilirim.','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 10:53:02'),(7,'Hangi firmalarda çalıştın?','Bu konuda henüz bilgim yok. Ama şunları sorabilirsiniz:\n• Projeler ve portfolio\n• Kullanılan teknolojiler\n• Hizmetler\n• İletişim bilgileri 💡','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 11:10:25'),(8,'Hangi firmalarda çalıştın?','Bu konuda henüz bilgim yok. Ama şunları sorabilirsiniz:\n• Projeler ve portfolio\n• Kullanılan teknolojiler\n• Hizmetler\n• İletişim bilgileri 💡','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 11:10:47'),(9,'kimsin sen','Ben Ahmet Çakmak\'ın yapay zeka asistanıyım. Ahmet, 10 yılı aşkın deneyime sahip bir Bilgi İşlem Uzmanı ve Full Stack Geliştiricidir. Kocaeli Üniversitesi Bilgisayar Öğretmenliği mezunudur.','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 12:01:35'),(10,'ne iş yapıyorsun','Bilgi İşlem Uzmanı ve Full Stack Geliştirici olarak çalışıyorum. Web geliştirme, sistem yönetimi, ERP/CRM çözümleri ve yapay zeka entegrasyonları konusunda uzmanım.','neutral','172.18.0.1','Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/142.0.0.0 Safari/537.36','chat_692ebf735dcde3.81644964','2025-12-02 12:01:48');
/*!40000 ALTER TABLE `chat_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `lang` varchar(5) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'tr',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating` int DEFAULT '5',
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'tr','Mehmet YÄ±lmaz','CTO','TechCorp','Ahmet ile Ã§alÄ±ÅŸmak harikaydÄ±. Projemizi zamanÄ±nda ve mÃ¼kemmel kalitede teslim etti.','https://randomuser.me/api/portraits/men/32.jpg',5,'2025-12-02 10:44:47'),(2,'tr','AyÅŸe Demir','ÃœrÃ¼n MÃ¼dÃ¼rÃ¼','StartUp Inc','YaratÄ±cÄ± Ã§Ã¶zÃ¼mleri ve teknik bilgisiyle projemize deÄŸer kattÄ±. Kesinlikle tavsiye ederim.','https://randomuser.me/api/portraits/women/44.jpg',5,'2025-12-02 10:44:47'),(3,'tr','Caner Erkin','Kurucu','Digital Agency','HÄ±zlÄ±, gÃ¼venilir ve profesyonel. Beklentilerimizin Ã§ok Ã¶tesinde bir iÅŸ Ã§Ä±kardÄ±.','https://randomuser.me/api/portraits/men/85.jpg',5,'2025-12-02 10:44:47'),(4,'en','John Doe','CTO','TechCorp','Working with Ahmet was great. He delivered our project on time and with excellent quality.','https://randomuser.me/api/portraits/men/32.jpg',5,'2025-12-02 10:44:47'),(5,'en','Jane Smith','Product Manager','StartUp Inc','Added value to our project with creative solutions and technical knowledge. Highly recommended.','https://randomuser.me/api/portraits/women/44.jpg',5,'2025-12-02 10:44:47'),(6,'en','Michael Brown','Founder','Digital Agency','Fast, reliable, and professional. Delivered work far beyond our expectations.','https://randomuser.me/api/portraits/men/85.jpg',5,'2025-12-02 10:44:47'),(7,'de','Hans MÃ¼ller','CTO','TechCorp','Die Zusammenarbeit mit Ahmet war groÃŸartig. Er hat unser Projekt pÃ¼nktlich und in hervorragender QualitÃ¤t geliefert.','https://randomuser.me/api/portraits/men/32.jpg',5,'2025-12-02 10:44:47'),(8,'de','Julia Weber','Produktmanagerin','StartUp Inc','Hat mit kreativen LÃ¶sungen und technischem Wissen einen Mehrwert fÃ¼r unser Projekt geschaffen. Absolut empfehlenswert.','https://randomuser.me/api/portraits/women/44.jpg',5,'2025-12-02 10:44:47'),(9,'de','Klaus Wagner','GrÃ¼nder','Digital Agency','Schnell, zuverlÃ¤ssig und professionell. Hat eine Arbeit geleistet, die weit Ã¼ber unseren Erwartungen lag.','https://randomuser.me/api/portraits/men/85.jpg',5,'2025-12-02 10:44:47'),(10,'ar','Ø£Ø­Ù…Ø¯ Ø­Ø³Ù†','Ø§Ù„Ù…Ø¯ÙŠØ± Ø§Ù„ØªÙ‚Ù†ÙŠ','ØªÙŠÙƒ ÙƒÙˆØ±Ø¨','ÙƒØ§Ù† Ø§Ù„Ø¹Ù…Ù„ Ù…Ø¹ Ø£Ø­Ù…Ø¯ Ø±Ø§Ø¦Ø¹Ù‹Ø§. Ø³Ù„Ù… Ù…Ø´Ø±ÙˆØ¹Ù†Ø§ ÙÙŠ Ø§Ù„ÙˆÙ‚Øª Ø§Ù„Ù…Ø­Ø¯Ø¯ ÙˆØ¨Ø¬ÙˆØ¯Ø© Ù…Ù…ØªØ§Ø²Ø©.','https://randomuser.me/api/portraits/men/32.jpg',5,'2025-12-02 10:44:47'),(11,'ar','Ù„ÙŠÙ„Ù‰ Ù…Ø­Ù…ÙˆØ¯','Ù…Ø¯ÙŠØ±Ø© Ø§Ù„Ù…Ù†ØªØ¬','Ø³ØªØ§Ø±Øª Ø£Ø¨','Ø£Ø¶Ø§Ù Ù‚ÙŠÙ…Ø© Ù„Ù…Ø´Ø±ÙˆØ¹Ù†Ø§ Ø¨Ø­Ù„ÙˆÙ„Ù‡ Ø§Ù„Ø¥Ø¨Ø¯Ø§Ø¹ÙŠØ© ÙˆÙ…Ø¹Ø±ÙØªÙ‡ Ø§Ù„ØªÙ‚Ù†ÙŠØ©. Ø£ÙˆØµÙŠ Ø¨Ù‡ Ø¨Ø´Ø¯Ø©.','https://randomuser.me/api/portraits/women/44.jpg',5,'2025-12-02 10:44:47'),(12,'ar','Ø¹Ù…Ø± Ø®Ø§Ù„Ø¯','Ø§Ù„Ù…Ø¤Ø³Ø³','ÙˆÙƒØ§Ù„Ø© Ø±Ù‚Ù…ÙŠØ©','Ø³Ø±ÙŠØ¹ ÙˆÙ…ÙˆØ«ÙˆÙ‚ ÙˆÙ…Ø­ØªØ±Ù. Ù‚Ø¯Ù… Ø¹Ù…Ù„Ø§Ù‹ ÙŠÙÙˆÙ‚ ØªÙˆÙ‚Ø¹Ø§ØªÙ†Ø§ Ø¨ÙƒØ«ÙŠØ±.','https://randomuser.me/api/portraits/men/85.jpg',5,'2025-12-02 10:44:47'),(13,'ru','Ð”Ð¼Ð¸Ñ‚Ñ€Ð¸Ð¹ Ð’Ð¾Ð»ÐºÐ¾Ð²','CTO','TechCorp','Ð Ð°Ð±Ð¾Ñ‚Ð°Ñ‚ÑŒ Ñ ÐÑ…Ð¼ÐµÑ‚Ð¾Ð¼ Ð±Ñ‹Ð»Ð¾ Ð·Ð´Ð¾Ñ€Ð¾Ð²Ð¾. ÐžÐ½ ÑÐ´Ð°Ð» Ð½Ð°Ñˆ Ð¿Ñ€Ð¾ÐµÐºÑ‚ Ð²Ð¾Ð²Ñ€ÐµÐ¼Ñ Ð¸ Ñ Ð¾Ñ‚Ð»Ð¸Ñ‡Ð½Ñ‹Ð¼ ÐºÐ°Ñ‡ÐµÑÑ‚Ð²Ð¾Ð¼.','https://randomuser.me/api/portraits/men/32.jpg',5,'2025-12-02 10:44:47'),(14,'ru','Ð•Ð»ÐµÐ½Ð° Ð¡Ð¾ÐºÐ¾Ð»Ð¾Ð²Ð°','ÐœÐµÐ½ÐµÐ´Ð¶ÐµÑ€ Ð¿Ñ€Ð¾Ð´ÑƒÐºÑ‚Ð°','StartUp Inc','Ð”Ð¾Ð±Ð°Ð²Ð¸Ð» Ñ†ÐµÐ½Ð½Ð¾ÑÑ‚ÑŒ Ð½Ð°ÑˆÐµÐ¼Ñƒ Ð¿Ñ€Ð¾ÐµÐºÑ‚Ñƒ ÑÐ²Ð¾Ð¸Ð¼Ð¸ Ñ‚Ð²Ð¾Ñ€Ñ‡ÐµÑÐºÐ¸Ð¼Ð¸ Ñ€ÐµÑˆÐµÐ½Ð¸ÑÐ¼Ð¸ Ð¸ Ñ‚ÐµÑ…Ð½Ð¸Ñ‡ÐµÑÐºÐ¸Ð¼Ð¸ Ð·Ð½Ð°Ð½Ð¸ÑÐ¼Ð¸. ÐÐ°ÑÑ‚Ð¾ÑÑ‚ÐµÐ»ÑŒÐ½Ð¾ Ñ€ÐµÐºÐ¾Ð¼ÐµÐ½Ð´ÑƒÑŽ.','https://randomuser.me/api/portraits/women/44.jpg',5,'2025-12-02 10:44:47'),(15,'ru','ÐÐ»ÐµÐºÑÐµÐ¹ ÐœÐ¾Ñ€Ð¾Ð·Ð¾Ð²','ÐžÑÐ½Ð¾Ð²Ð°Ñ‚ÐµÐ»ÑŒ','Digital Agency','Ð‘Ñ‹ÑÑ‚Ñ€Ð¾, Ð½Ð°Ð´ÐµÐ¶Ð½Ð¾ Ð¸ Ð¿Ñ€Ð¾Ñ„ÐµÑÑÐ¸Ð¾Ð½Ð°Ð»ÑŒÐ½Ð¾. Ð¡Ð´ÐµÐ»Ð°Ð» Ñ€Ð°Ð±Ð¾Ñ‚Ñƒ, Ð¿Ñ€ÐµÐ²Ð¾ÑÑ…Ð¾Ð´ÑÑ‰ÑƒÑŽ Ð½Ð°ÑˆÐ¸ Ð¾Ð¶Ð¸Ð´Ð°Ð½Ð¸Ñ.','https://randomuser.me/api/portraits/men/85.jpg',5,'2025-12-02 10:44:47');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-12-02 14:41:02
