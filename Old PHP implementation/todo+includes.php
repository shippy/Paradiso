<?php
// project basis. Classes!

/*
Random assignment of students
Keeping track of people's sections
Students entering section preferences
(Pre-registration and entering preferred times?)
Suggested trades
One-click approval by Levin
*/


/* 
DB design:

1. Table Students (students) 
- Student Internal ID (INT stud_id)
- Student NetID (STR netid)
- Student Name (STR name)
- Student E-mail (STR email)
- Student Current Section Number for L, H, P (INT current_l, current_h, current_p)
- Student Desired Section Number for L, H, P (INT desired_l, desired_h, desired_p) (NULL for no desired change, 0 for all [dropouts])
- Student Enrollment Status (BOOL dropped)

2. Table Sections (sections)
- Section Number (INT sect_id)
- Section Leader (STR sect_leader)
- Section Leader NetID (STR sect_netid)
- Section Times (STR sect_times)

3. Table Trades (trades)
- Student 1 ID (INT stud1_id)
- Student 2 ID (INT stud2_id)
	(sections can be retrieved from students.current_x WHERE stud_id = ...)
- Approved (BOOL approved)

4. Table Users (users)
- NetID (STR netid)
- Name (STR name)
- Email (STR email)
- Admin (BOOL admin)
- Teacher (BOOL teacher)
- Observer (BOOL observer)
- Student (BOOL student)
*/

/*
Screens
1. Verification through CAS (not letting in people not on the list)
2. Demand a different section
3. Approve section trade
4. Display everyone's current section and desired section
...
5. Section Assignment Lottery (criteria?)
6. First two-week "presence" roll call
7. Enrolment management
8. Transfer to an emptier section - how do you order that?

Features
1. Find simple trades (Land -> Kas, Kas -> Land)
2. Find complex trades (Land -> Kas, Kas -> Engel, Engel -> Land) - mathematically, what complexity?
3. Send confirmation e-mails to (1) the 2+ students desiring exchange, and following
	their approval to (2) Levin/Pascarella/anyone with access.approves = TRUE
	with one-click approval
4. 
5. Log all activity in a format that can be used to rollback changes

Implementation
1. Run a procedure anytime someone uploads a section demand, see if any trade is possible
*/

session_start();

$db = new mysqli ('localhost', 'root', '');
if ($db->connect_error) die($db->connect_error);
$db->select_db("Paradiso");

include('classes_user.php');
include('classes_view.php');
include('classes_trades.php');
?>
