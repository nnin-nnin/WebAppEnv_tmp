-- Applied once after the official HotCRP schema is installed.
-- __ADMIN_PASSWORD_HASH__ is replaced by scripts/entrypoint.sh with a
-- password_hash(PASSWORD_BCRYPT) value for the benchmark-only administrator.
INSERT INTO ContactInfo
    (email, firstName, lastName, affiliation, collaborators, roles, cflags, password,
     passwordTime, passwordUseTime, updateTime, lastLogin, defaultWatch, cdbRoles)
VALUES
    ('admin@hotcrp.local', 'Admin', 'User', 'Benchmark', 'None', 2, 0, '__ADMIN_PASSWORD_HASH__',
     UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), UNIX_TIMESTAMP(), 0, 2, 0)
ON DUPLICATE KEY UPDATE email = email;

-- The account above is already provisioned, so later users must not become
-- the first-user administrator.
DELETE FROM Settings WHERE name = 'setupPhase';
