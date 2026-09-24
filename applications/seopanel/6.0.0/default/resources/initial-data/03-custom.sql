UPDATE `users` SET `password` = MD5('spadmin'), `confirm` = 1, `status` = 1, `email` = 'spadmin@example.com' WHERE `id` = 1;
INSERT INTO `settings` (`set_label`, `set_name`, `set_val`, `set_type`)
SELECT 'Seo Panel API Key', 'SP_API_KEY', 'e10adc3949ba59abbe56e057f20f883e', 'large'
FROM DUAL
WHERE NOT EXISTS (SELECT 1 FROM `settings` WHERE `set_name` = 'SP_API_KEY');
