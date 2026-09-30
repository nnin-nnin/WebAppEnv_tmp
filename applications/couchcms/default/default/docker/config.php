<?php
    if ( !defined('K_COUCH_DIR') ) die();

    define( 'K_SITE_OFFLINE', 0 );

    define( 'K_GMT_OFFSET', 0 );
    define( 'K_CHARSET', 'utf-8' );

    // MySQL settings
    define( 'K_DB_NAME', getenv('COUCH_DB_NAME') ?: 'couchcms' );
    define( 'K_DB_USER', getenv('COUCH_DB_USER') ?: 'couchcms' );
    define( 'K_DB_PASSWORD', getenv('COUCH_DB_PASSWORD') ?: 'couchcms_pass' );
    define( 'K_DB_HOST', getenv('COUCH_DB_HOST') ?: 'db' );
    define( 'K_DB_TABLES_PREFIX', '' );

    define( 'K_PRETTY_URLS', 0 );
    define( 'K_USE_CACHE', 0 );
    define( 'K_CACHE_PURGE_INTERVAL', 24 );
    define( 'K_MAX_CACHE_AGE', 7 * 24 );

    define( 'K_EMAIL_TO', 'admin@example.com' );
    define( 'K_EMAIL_FROM', 'couchcms@example.com' );
    define( 'K_USE_ALTERNATIVE_MTA', 0 );

    define( 'K_COMMENTS_REQUIRE_APPROVAL', 1 );
    define( 'K_COMMENTS_INTERVAL', 5 * 60 );

    define( 'K_ADMIN_LANG', 'EN' );
    define( 'K_EXTRACT_EXIF_DATA', 0 );
    define( 'K_USE_KC_FINDER', 1 );
    define( 'K_SQL_DUMP_USE_EXTENDED_INSERTS', 0 );
    define( 'K_PAID_LICENSE', 0 );
    define( 'K_REMOVE_FOOTER_LINK', 0 );
