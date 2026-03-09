# Finbarr Inventory - Super Admin Master Guide (Beginner Friendly)

Last Updated: 2026-03-08

## Welcome

This guide is written for someone who is not technical.

If you can use WhatsApp and fill a form, you can run this system.

Think of this software as one business story:

1. You buy items from suppliers.
2. You receive the goods.
3. You sell to students in clinic/bookshop.
4. You collect money in cash or bank.
5. You track stock and know what has finished.
6. You see profit/loss and supplier debts clearly.

## Before You Start (Important Mindset)

As Super Admin, your job is not to do everything yourself.
Your main job is:

1. Set the system correctly once.
2. Give the right access to the right staff.
3. Monitor reports and controls.
4. Keep data clean and traceable.

## The Correct Setup Order (Do This First)

Use this order so everything connects properly.

1. `Settings -> Application Setting`
   - App name, address, timezone, logo, footer.
   - App version and developer details.

2. `Settings -> App Customization (SMTP)`
   - Email settings.
   - Send test email to confirm notifications can work.

3. `Role Permission`
   - Create staff roles before onboarding many users.

4. `Supplier`
   - Add all suppliers you buy from.

5. `Item`
   - Add Unit first (`piece`, `carton`, `pack`, `kg`, `litre`).
   - Add Category.
   - Add products and carton quantity.

6. `HRM -> Department`
   - Add departments like Clinic, Bookshop, Pharmacy, Store.

7. `Bank`
   - Add bank accounts.
   - Add opening balances using bank adjustment.

8. `Student`
   - Add/import student records.
   - Include School ID Number.

9. `Purchase`
   - Start procurement flow (PO -> GRN -> Post to Stock).

10. `Invoice / Return / Accounts / Report`
   - Start daily operations and management reporting.

## Sidebar Meaning (Very Simple)

## Dashboard
Big summary of your business today.

## Notifications / Messaging
Internal communication and alerts.

## Supplier
Who you buy from.

## Item
What you buy and sell.

## Purchase
How goods enter your business.

## Invoice
How goods leave your business (sales).

## Return
Corrections/reversals for sales or supplier issues.

## Stock
What is still available.

## Bank
Your bank accounts and transactions.

## Accounts
Accounting controls and adjustments.

## Report
Financial and performance visibility.

## Role Permission
Who can do what.

## Settings
System-level control (admin only).

## Who Should Get Which Role?

Never give everyone full access.

Use this practical model:

1. **Super Admin (Owner/Top Manager)**
   - Full access.
   - Should be very few users.

2. **Store/Purchase Officer**
   - Supplier, Item, Purchase, Stock.
   - No system settings, no role management.

3. **Sales/Clinic Desk**
   - Student, Invoice/POS, Returns, Messaging.
   - No bank setup, no role settings.

4. **Accountant**
   - Bank ledger, Accounts, supplier settlement, reports.
   - No role settings.

## Super Admin Access Guarantee

Yes, Super Admin can strictly control what each Admin/User can do.

How it works:

1. Create or edit role in `Menu -> Role Permission`.
2. Tick only the actions needed (`create`, `read`, `edit`, `delete`).
3. Assign role to a user in role assignment/user form.
4. Keep non-owner admins as **Standard User + Role**.

Important:

1. System is configured for a single Super Admin owner account.
2. New feature menus are synced to role permissions so they can be allowed/denied.
3. If a user can access something they should not, review role mapping first.

## Purchase Control You Should Use (Best Practice)

Do not jump straight to random purchase entries.
Use this disciplined flow:

1. **Create PO**
   - Record planned purchase.

2. **Create GRN**
   - Record what physically arrived.

3. **Post GRN to Stock**
   - This is when stock is officially increased.

4. **Supplier Due Settlement**
   - Pay old dues from cash/bank with receipt trail.

This gives you:

1. Better stock accuracy.
2. Better supplier debt tracking.
3. Better audit trail.

## Batch / Expiry / Lot (Why It Matters)

For clinic/pharmacy/bookshop control:

1. Batch No = production batch identity.
2. Lot No = grouping identity.
3. MFG Date = manufacture date.
4. Expiry Date = safe-use deadline.

Always capture these during purchase/GRN for regulated items.

Use `Stock -> Batch Report` to monitor near-expiry/expired stock.

## Bank and Accounts Explained Like Cashbook

When reading bank ledger:

1. **Debit (d)** means money entered bank.
2. **Credit (c)** means money left bank.

Examples:

1. Customer transfer received into bank -> bank **debit**.
2. Supplier paid from bank -> bank **credit**.

Fields to always fill:

1. Money Source (`cash`, `transfer`, `POS`, `other`).
2. Transferred By (person/account owner).
3. Payment Reference (transaction id/teller).
4. Supplier (if transaction relates to supplier).

## Student Management (For Clinic/Bookshop Sales Traceability)

Students are your customers in this system.

Minimum student data to keep:

1. Name.
2. School ID Number.
3. Class/Grade.
4. Parent phone.
5. Student phone/email (if available).

### CSV Import/Export

Now available:

1. **CSV Template** download (shows correct import format).
2. **Export CSV** (download current students).

Main columns:

1. `name`
2. `mobile`
3. `email`
4. `address`
5. `paytype`
6. `previous_balance`
7. `status`
8. `class`
9. `parent_phone`
10. `school_id_number`

## Messaging Cleanup (Select + Delete)

Now available in:

1. `Messaging -> Inbox`
2. `Messaging -> Sent`

How to use:

1. Tick messages.
2. Or use Select All checkbox.
3. Click **Delete Selected**.
4. Confirm delete.

## New School Sync Features (What Was Added)

1. `Academic Sync`
   - Academic Calendar (term/exam/holiday/meeting/event).
   - Curriculum upload (PDF) for junior and senior secondary.
   - Approval workflow: Department Head submits -> Admin approves/rejects with comments.

2. `File Sync`
   - Structured document upload/share by department and users.

3. `Asset Sync`
   - Asset register, categories, maintenance.
   - Transfer history log and depreciation support.

4. `HR Sync`
   - Appointment, termination, leave workflow.
   - Passport photo capture and QR + expiry ID card generation.

5. `Audit`
   - Admin action audit trail for sensitive operations.

## ID Card Clarification and Quality Rules

1. Staff ID card photo source priority:
   - `em_passport_photo` (passport upload)
   - fallback to `em_image` (profile photo)
2. Card header is left-aligned (logo + title) for better print readability.
3. QR block is separated from footer text to prevent overlap/collision.
4. ID card file path is stored under staff documents for traceability.

## Barcode/QR Label Printing Controls

Item label print now supports:

1. Label Type selector (`Barcode` or `QR Code`).
2. Copies to Print input (set exact quantity before printing).
3. Improved typography to avoid name/model collision.

## Daily Super Admin Checklist

1. Check low stock alerts.
2. Check due supplier balances.
3. Check bank ledger for unusual movements.
4. Check expiry report for near-expiry products.
5. Check important staff messages/notifications.

## Weekly Checklist

1. Review purchase report.
2. Review sales report.
3. Review profit/loss.
4. Review audit log for sensitive changes.
5. Confirm user roles are still correct.

## Monthly Checklist

1. Run accounts closing.
2. Export key reports and keep archive backup.
3. Reconfirm app settings and communication channels.
4. Review role access for staff who changed position.

## Common Mistakes to Avoid

1. Giving too many people Super Admin rights.
2. Posting stock without proper GRN.
3. Missing money source/reference on payments.
4. Not capturing student school ID.
5. Ignoring expiry tracking for clinic products.

## One Full Test You Should Run After Setup

Do this once after setup to prove everything is connected:

1. Add supplier.
2. Add product with unit/carton config.
3. Create PO.
4. Create GRN with batch/expiry.
5. Post GRN to stock.
6. Confirm supplier due appears.
7. Settle part of due from bank.
8. Confirm bank balance changed correctly.
9. Create student sale invoice.
10. Export student CSV and verify school ID column.
11. Check reports.

If all 11 steps work, your system is well connected for live operations.
