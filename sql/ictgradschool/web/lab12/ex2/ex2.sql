-- Answers to exercise 2 questions

-- A. What are the names of the students who attend COMP219?
SELECT CONCAT(stu.fname,' ',stu.lname) AS studentname
FROM unidb_students AS stu, unidb_attend AS att
WHERE stu.id = att.id AND concat(att.dept,att.num) LIKE 'comp219';

-- B. What are the names of the student reps that are not from NZ?
SELECT CONCAT(stu.fname,' ',stu.lname) AS studentname
FROM unidb_students AS stu, unidb_courses As cours
WHERE stu.id = cours.rep_id AND stu.country NOT LIKE 'NZ';

-- C. Where are the offices for the lecturers of 219?
SELECT lect.office
FROM unidb_lecturers AS lect, unidb_teach AS teach
WHERE lect.staff_no = teach.staff_no AND teach.num=219;

-- D. What are the names of the students taught by Te Taka?
-- subquery
SELECT DISTINCT fname,lname
FROM unidb_attend As attend
JOIN unidb_students As student ON attend.id = student.id
WHERE attend.dept = 'comp' AND attend.num in (SELECT num
                                              FROM unidb_teach As T
                                                     JOIN unidb_lecturers AS L ON T.staff_no = L.staff_no
                                              where fname like 'Te Taka');

-- joined??
SELECT DISTINCT CONCAT(stu.fname,' ',stu.lname) AS studentname
FROM unidb_students AS stu,
     unidb_lecturers AS lect,
     unidb_teach AS teach,
     unidb_attend AS attend
WHERE lect.staff_no = teach.staff_no
  AND lect.fname = 'Te Taka'
  AND stu.id=attend.id
  AND teach.num = attend.num
  AND teach.dept = attend.dept;


-- E. List the students and their mentors
SELECT Concat(mentor.fname," ",mentor.lname) AS Student_Name,Concat(student.fname," ",student.lname) AS Mentor_Name
FROM unidb_students AS mentor, unidb_students AS student
WHERE mentor.mentor = student.id order by student.lname;

-- F. Name the lecturers whose office is in G-Block as well naming the students that are
-- not from NZ
SELECT DISTINCT CONCAT(lect.fname,' ',lect.lname) AS lecturer_name
FROM unidb_lecturers AS lect
WHERE lect.office like 'g%'
  UNION
SELECT DISTINCT CONCAT(stu.fname,' ',stu.lname) AS studentname
FROM unidb_students AS stu
WHERE stu.country NOT LIKE 'NZ';

-- G. List the course coordinator and student rep for COMP219
SELECT DISTINCT CONCAT(stu.fname,' ',stu.lname) AS studentname,CONCAT(lect.fname,' ',lect.lname) AS lecturer_name
FROM unidb_students AS stu,
     unidb_lecturers AS lect,
     unidb_courses AS courses
WHERE courses.coord_no = lect.staff_no
  AND stu.id=courses.rep_id
  AND CONCAT(courses.dept,courses.num)='comp219';
