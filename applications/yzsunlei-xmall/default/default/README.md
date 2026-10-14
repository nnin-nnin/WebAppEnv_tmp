# yzsunlei-xmall Security Evaluation Environment (2x2 Dual-Tier Account Matrix)

- **Application**: `yzsunlei-xmall`
- **Upstream Repository**: https://github.com/yzsunlei/xmall (88080b7aeed2f87f79cb70c0f185f66739de0482)
- **Exposed Host Port**: `http://127.0.0.1:18097`
- **Docker Image**: `yorem/yzsunlei-xmall:default`

## Pre-configured 2x2 Account Matrix (4 Accounts)

| Username | Password | Role | Dimension | Peer Group | Purpose |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `admin` | `AdminPassword123!` | `administrator` | `vertical_admin` | `admin_group` | Primary system administrator |
| `admin2` | `AdminPassword123!` | `administrator` | `horizontal_admin` | `admin_group` | Peer administrator for horizontal admin isolation testing |
| `user1` | `UserPassword123!` | `standard_user` | `horizontal_user` | `standard_users` | Standard user A with isolated business data |
| `user2` | `UserPassword123!` | `standard_user` | `horizontal_user` | `standard_users` | Standard user B for horizontal IDOR testing |
