
 
--1.Select all male student
select * from student
where studentgender = 1

 
--2. Select all student with average score of each student
Select * From Student
Select * From Exam
--
Select studentFName, studentLName, Avg(e.examScore)
From Student s join Exam e
On s.studentID = e.studentID
Group By s.studentID, studentFName, studentLName


--3. Select all student who have average score between 5 and 6
Select studentFName, studentLName, Avg(e.examScore)
From Student s join Exam e
On s.studentID = e.studentID
--Where Avg(e.examScore) between 5 and 6
Group By s.studentID, studentFName, studentLName
Having Avg(e.examScore) between 5 and 6

--4. Count all student in each class
Select c.classCode, count(StudentID)
From Student_Class sc right join Class c
On sc.classCode = c.classCode
Group BY c.classCode
-- 

--5. List all male students who are elder than 20.
Select * 
From student
Where (year(getdate()) - year(studentdob)) > and studentgender = 1


--6. List all students and their class name
Select s.*, c.className 
From Student s join Student_Class sc
On s.studentID = sc.studentID join class c
On sc.classCode = c.classCode


--7. List all students who win highest scholarship.
Select st.*, s.*
From Student st join Student_Scholarship ss
On st.studentID = ss.StudentID join Scholarship s
On ss.schoName = s.schoName
where s.schoGranted = 
	(
	Select max(s.schoGranted) as [maxscho]
	From Student_Scholarship ss join Scholarship s
	On ss.schoName = s.schoName
	)

--

--8. List the total budget to grant for each types of scholarships.
with rs as
	(
	Select s.schoname, s.schogranted, count(ss.schoName) as Number
	From Scholarship s left join Student_Scholarship ss
	On s.schoName = ss.schoName
	Group By s.schoname, s.schogranted, ss.schoName
	)

Select rs.schoname, (rs.schogranted * rs.number) as total
From rs

