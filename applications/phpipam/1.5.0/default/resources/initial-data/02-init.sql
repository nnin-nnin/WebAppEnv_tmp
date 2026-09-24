-- Disable forced password change on initial login for Admin
UPDATE `users` SET `passChange` = 'No' WHERE `username` = 'Admin';
