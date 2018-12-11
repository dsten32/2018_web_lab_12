-- Answers to exercise 1 questions
-- A. Display the departments offering courses
SELECT DISTINCT dept FROM unidb_courses;

-- B. Display the semesters being attended
SELECT DISTINCT semester FROM unidb_attend;

-- C. Display the courses that are attended
SELECT CONCAT(dept,num) AS Course_ID,descrip AS Course_Description FROM unidb_courses;

-- D. List the student names and country, ordered by first name
SELECT Concat(fname," ",lname) AS Student_Name, country FROM unidb_students ORDER BY fname;

-- E. List the student names and mentors, ordered by mentors
SELECT Concat(fname," ",lname) AS Student_Name,mentor FROM unidb_students ORDER BY mentor;
-- not sure about this one
SELECT *
FROM unidb_students AS student, unidb_students AS mentor
WHERE mentors.mentor = students.id order by students.lname;

-- F. List the lecturers, ordered by office
SELECT CONCAT(fname," ",lname) AS Lecturer_Name FROM unidb_lecturers ORDER BY office;

-- G. List the staff whose staff number is greater than 500
SELECT CONCAT(fname," ",lname) FROM unidb_lecturers WHERE staff_no > 500;

-- H. List the students whose id is greater than 1668 and less than 1824
SELECT CONCAT(fname," ",lname) AS Name FROM unidb_students WHERE id between 1668 AND 1824;

-- I. List the students from NZ, Australia and US
SELECT CONCAT(fname," ",lname) AS Name FROM unidb_students WHERE country IN ('US','NZ','AU');

-- J. List the lecturers in G Block
SELECT CONCAT(fname," ",lname) AS Name FROM unidb_lecturers WHERE office LIKE 'G%';

-- K. List the courses not from the Computer Science Department
SELECT descrip FROM unidb_courses WHERE dept NOT LIKE 'comp';

-- L. List the students from France or Mexico
SELECT CONCAT(fname," ",lname) AS Name FROM unidb_students WHERE country IN ('FR','MX');