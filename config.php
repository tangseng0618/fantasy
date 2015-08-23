<?php
// SERVER
define('SERVER_SITE', 'localhost/bench/fantasy');
define('SERVER_DOMAIN', strtolower(SERVER_SITE));
define('SERVER_URL', '//' . SERVER_DOMAIN . '/');
define('SERVER_DIR', '/Users/abel/Sites/bench/fantasy/');

// HTTP
define('HTTP_SERVER', 'http:' . SERVER_URL);

// HTTPS
define('HTTPS_SERVER', 'http:' . SERVER_URL);

// DIR
define('DIR_APPLICATION', SERVER_DIR . 'catalog/');
define('DIR_SYSTEM', SERVER_DIR . 'system/');
define('DIR_LANGUAGE', SERVER_DIR . 'catalog/language/');
define('DIR_TEMPLATE', SERVER_DIR . 'catalog/view/theme/');
define('DIR_CONFIG', SERVER_DIR . 'system/config/');
define('DIR_IMAGE', SERVER_DIR . 'image/');
define('DIR_CACHE', SERVER_DIR . 'system/cache/');
define('DIR_DOWNLOAD', SERVER_DIR . 'system/download/');
define('DIR_UPLOAD', SERVER_DIR . 'system/upload/');
define('DIR_MODIFICATION', SERVER_DIR . 'system/modification/');
define('DIR_LOGS', SERVER_DIR . 'system/logs/');

// DB
define('DB_DRIVER', 'mysqli');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'root');
define('DB_PASSWORD', '123456');
define('DB_DATABASE', 'fantasy');
define('DB_PORT', '3306');
define('DB_PREFIX', '');
