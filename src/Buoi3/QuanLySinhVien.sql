create database QuanLySinhVien;
use QuanLySinhVien;

create table Class (
	ClassID INT auto_increment PRIMARY KEY,
    ClassName varchar(20) NOT NULL,
    StartDate date NOT NULL,
    Status INT
);
create table Student (
	StudentID INT auto_increment PRIMARY KEY,
    StudentName varchar(20) NOT NULL,
    Address varchar(20) NOT NULL,
    Phone varchar(15),
    Status INT NOT NULL,
    ClassID INT NOT NULL,
    foreign key (ClassID) references Class(ClassID)
);

create table Subject (
	SubID INT auto_increment primary key,
    SubName varchar(20) NOT NULL,
    Credit INT not null,
    Status INT NOT NULL
);

create table Mark (
	MarkID int auto_increment primary key,
    SubID int NOT NULL,
    StudentID int NOT NULL,
    Mark decimal(10,2) NOT NULL,
    ExamTimes int NOT NULL,
    foreign key (SubID) references Subject(SubID),
    foreign key (StudentID) references Student(StudentID)
);

INSERT INTO Class
VALUES (1, 'A1', '2008-12-20', 1);
INSERT INTO Class
VALUES (2, 'A2', '2008-12-22', 1);
INSERT INTO Class
VALUES (3, 'B3', current_date, 0);

INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Hung', 'Ha Noi', '0912113113', 1, 1);
INSERT INTO Student (StudentName, Address, Status, ClassId)
VALUES ('Hoa', 'Hai phong', 1, 1);
INSERT INTO Student (StudentName, Address, Phone, Status, ClassId)
VALUES ('Manh', 'HCM', '0123123123', 0, 2);

INSERT INTO Subject
VALUES (1, 'CF', 5, 1),
 (2, 'C', 6, 1),
 (3, 'HDJ', 5, 1),
 (4, 'RDBMS', 10, 1);
 
INSERT INTO Mark (SubId, StudentId, Mark, ExamTimes) 
VALUES 
    (1, 1, 8.0, 1), 
    (1, 2, 10.0, 2), 
    (2, 1, 12.0, 1);

select * from Student where Student.StudentName LIKE 'h%';
select * from Class where month(StartDate) = 12;
select * from Subject where Credit >= 3 and Credit <= 5;
SET SQL_SAFE_UPDATES = 0;
update Student SET ClassID = 2 where Student.StudentName = 'Hung';
select * from Student;
select StudentName, SubName, Mark from Student
join Mark on Mark.StudentID = Student.StudentID
join Subject on Subject.SubID = Mark.subId ORDER BY Mark.Mark DESC;