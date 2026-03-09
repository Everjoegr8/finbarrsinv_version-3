# Finbarrsinv – Test Credentials & Setup

## Installation Steps

1. **Run SQL in order** (via phpMyAdmin or MySQL command line):
   - Import `install/sql/schema_updates.sql` first (safe to run multiple times)
   - Then import `install/sql/demo_data.sql`

   **Command line:** `mysql -u root -p your_database < install/sql/schema_updates.sql`

2. **Base URL**: In `application/config/config.php`, ensure `base_url` is correct (e.g. `http://localhost/finbarrsinv/`).

---

## Test Credentials (after running demo_data.sql)

| Role    | Email                    | Password  |
|---------|--------------------------|-----------|
| Admin   | admin@finbarrschool.com  | admin123  |
| Clerk   | clerk@finbarrschool.com  | temp123   |
| Nurse   | nurse@finbarrschool.com  | temp123   |

---

## What to Test

1. **Login** – Use admin credentials.
2. **Bell notification** – Header bell icon should show a badge with unread count. Click to open dropdown and follow links.
3. **Messages** – Sidebar > Messages > Inbox. You should see a sample message from Admin to Clerk. Login as `clerk@finbarrschool.com` / `temp123` to see it in Inbox.
4. **Notifications** – Sidebar > Notifications to view list.
5. **App Customization** – Settings > App Customization (SMTP) to configure SMTP, notifications, departments, etc.
6. **Students** – Sidebar > Students > Student List (after demo data).
7. **Add Employee** – HRM > Add Employee (departments populated from demo data).

---

## Email (SMTP)

- Go to **Settings > App Customization (SMTP)**.
- Configure: host, port, username, password, encryption.
- Click **Save Settings**, then use **Test Email** to verify.
- For Gmail: host `smtp.gmail.com`, port `587`, TLS, and use an App Password (not your normal password).
- When enabled, new Messages will send an email notification to the recipient (if **Email notifications** is on).
