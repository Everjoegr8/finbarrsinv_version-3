# Finbarr Enterprise Suite - Developer Pitch Deck

Date: 2026-03-08  
Presenter: Product/Engineering Team

## Slide 1: Product Vision

Build one connected school operations platform where:

1. Academic planning
2. Documents
3. Inventory
4. Finance
5. HR

all share one trusted data backbone.

## Slide 2: Core Problem We Solve

Most schools run separate tools and spreadsheets, causing:

1. Duplicate entry
2. Inconsistent records
3. Weak accountability
4. Slow reporting
5. Hard staff handover

This app solves that by linking modules with role-based controls and audit traces.

## Slide 3: What Makes This Different

1. End-to-end data flow (procurement -> stock -> sales -> finance).
2. Super Admin governance (who can do what, precisely).
3. Operational audit trail for sensitive decisions.
4. School-specific workflows (curriculum approval, student-linked sales, staff lifecycle).

## Slide 4: Academic Sync

1. Academic Calendar with typed events:
   - term, exam, holiday, meeting, event, other
2. Curriculum management for junior/senior secondary.
3. Approval flow:
   - Dept Head submits syllabus
   - Admin approves/rejects with comments

Impact:

1. Better term planning
2. Clear academic accountability
3. Central syllabus repository

## Slide 5: File Sync

1. Structured document upload and sharing.
2. User/department visibility controls.
3. Centralized document retrieval.

Impact:

1. Less file loss
2. Better cross-team collaboration
3. Faster compliance response

## Slide 6: Asset Sync

1. Asset register (chairs, ACs, computers, lab tools, etc).
2. Category + condition + location + assignment.
3. Maintenance logs.
4. Transfer history:
   - who moved what
   - from/to
   - date/time
5. Depreciation support.

Impact:

1. Better asset accountability
2. Lower waste/loss
3. Better replacement planning

## Slide 7: HR + Staff Lifecycle

1. Employee onboarding and profile management.
2. Appointment and termination workflows.
3. Leave request and approval flow.
4. Passport photo capture and staff documents.
5. ID card generation with:
   - QR data
   - expiry policy
   - storage path in staff documents

Impact:

1. Better HR governance
2. Faster staff verification
3. Reduced identity errors

## Slide 8: Procurement and Finance Linkage

1. Purchase workflow:
   - PO -> GRN -> Post to Stock
2. Supplier due settlement with payment metadata:
   - money source
   - transferred by
   - payment reference
3. Ledger integration updates balances automatically.

Impact:

1. Real stock integrity
2. Accurate due tracking
3. Transparent finance trail

## Slide 9: Access Control Model

1. One Super Admin owner account.
2. Other admins operate as standard users with assigned roles.
3. Permission matrix per menu:
   - create/read/edit/delete
4. New features are menu-synced to role permission setup.

Impact:

1. Principle of least privilege
2. Reduced misuse risk
3. Predictable operations

## Slide 10: Audit and Compliance

Admin action audit captures key activities:

1. Staff appointment
2. Staff termination
3. Leave approval/rejection
4. Syllabus approval/rejection

Impact:

1. Accountability
2. Faster incident investigation
3. Better governance maturity

## Slide 11: Business Outcomes

1. Faster operations with fewer manual corrections.
2. Better decision-making with connected reports.
3. Stronger financial and operational control.
4. Better readiness for audits and leadership review.

## Slide 12: Demo Path (Recommended)

1. Create role and assign user.
2. Add calendar event.
3. Upload curriculum and approve as admin.
4. Register asset and log transfer.
5. Add employee, generate QR ID card.
6. Run PO -> GRN -> post to stock -> settle supplier due.
7. View audit trail entries.

## Slide 13: Data Integrity and Security Model

1. Single source tables for master entities:
   - `student_tbl`, `employee_tbl`, `product_tbl`, `supplier_tbl`
2. Transaction tables for flows:
   - purchases, invoices, returns, ledgers, documents, audits
3. Role + menu permission controls for least-privilege access.
4. Immutable-style auditing for sensitive admin actions.

## Slide 14: Operational KPIs the App Supports

1. Stock availability and low-stock rate.
2. Supplier due aging and settlement speed.
3. Sales by class/student group.
4. Return ratio (student returns and supplier returns).
5. Staff action transparency via audit and approvals.

## Slide 15: Deployment and Governance Notes

1. Super Admin remains owner-level governance account.
2. Other admins should be role-scoped standard users.
3. Monthly role/access review is recommended.
4. Backups should include database + file assets directories.

## Slide 16: Expansion Roadmap

1. Optional parent/guardian portal for statement visibility.
2. Multi-campus support and branch-level reporting.
3. Automated reminders (expiring stock, overdue supplier due, leave actions).
4. Approval workflow extensions for other critical transactions.
