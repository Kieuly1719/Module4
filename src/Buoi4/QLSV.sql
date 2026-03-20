use quanlysinhvien;

select * from subject where Credit = (select max(subject.Credit) from subject);
select * from subject join mark
on mark.subID = subject.subID where Mark = (select max(Mark) from mark);

select student.StudentID, student.StudentName, AVG(mark.Mark) as dtb from student join mark on student.StudentID = mark.StudentID
join subject on subject.SubID = mark.SubID GROUP BY student.StudentID
order by dtb DESC;
