<?php
if (!function_exists('locale_get_default')) {
    function locale_get_default(): string {
        return 'en_US';
    }
}
if (!class_exists('IntlDateFormatter', false)) {
    class IntlDateFormatter {
        public const NONE = -1;
        public const SHORT = 3;
        public const MEDIUM = 2;
        public const LONG = 1;
        public const FULL = 0;
        public const GREGORIAN = 1;
        public const TRADITIONAL = 0;
        public function __construct($locale = null, $dateType = null, $timeType = null, $timezone = null, $calendar = null, $pattern = '') {}
        public function format($datetime): string {
            return date('r', is_numeric($datetime) ? (int)$datetime : time());
        }
    }
}
if (!class_exists('Locale', false)) {
    class Locale {
        public static function getDefault(): string { return 'en_US'; }
        public static function setDefault(string $locale): bool { return true; }
    }
}
