# SuperMarket Security Evaluation Environment (2x2 Dual-Tier Account Matrix)

- **Application**: `SuperMarket`
- **Upstream Repository**: https://github.com/ZongXR/SuperMarket (ef4f8ef9ae7f901b5c2e3d0c6cd851fafe1843d1)
- **Exposed Host Port**: `http://127.0.0.1:18098`
- **Docker Image**: `yorem/supermarket:default`

## Pre-configured 2x2 Account Matrix (4 Accounts)

| Username | Password | Role | Dimension | Peer Group | Purpose |
| :--- | :--- | :--- | :--- | :--- | :--- |
| `admin` | `AdminPassword123!` | `administrator` | `vertical_admin` | `admin_group` | Primary system administrator |
| `admin2` | `AdminPassword123!` | `administrator` | `horizontal_admin` | `admin_group` | Peer administrator for horizontal admin isolation testing |
| `user1` | `UserPassword123!` | `standard_user` | `horizontal_user` | `standard_users` | Standard user A with isolated business data |
| `user2` | `UserPassword123!` | `standard_user` | `horizontal_user` | `standard_users` | Standard user B for horizontal IDOR testing |
