create database Hospital;
go
use Hospital;

--create tables
go
create table Departments
(
    ID int primary key identity (1,1) not null,
    Building int not null check (Building > 1 and Building < 5),
    Financing money not null check (Financing > 0) Default 0,
    Name nvarchar(100) not null unique check (LEN(Name) > 0)
);
go
create table Diseases(
                         ID int primary key identity (1,1) not null,
                         Name nvarchar(100) not null unique check (LEN(Name) > 0),
                         Severity int not null check (Severity > 1) Default 1
);
go
create table Doctors(
                        ID int primary key identity (1,1) not null,
                        Name nvarchar(max) not null check (LEN(Name) > 0),
                        Phone nvarchar(10) not null,
                        Salary money not null check (Salary > 0),
                        Surname nvarchar(max) not null check (LEN(Surname) > 0)
);

go
create table Examinations(
                             ID int primary key identity (1,1) not null,
                             DayOfWeek int not null check (DayOfWeek > 0 and DayOfWeek < 8),
                             EndTime time not null,--check (EndTime > StartTime) don`t work in SQL Server
                             Name nvarchar(100) not null check (LEN(Name) > 0),
                             StartTime time not null check (StartTime >= '08:00' and StartTime <= '18:00')
);

--inserts
go
insert into Departments (Building, Financing, Name) values
                                                        (2, 1000000, 'Cardiology'),
                                                        (3, 2000000, 'Neurology'),
                                                        (4, 3000000, 'Oncology'),
                                                        (2, 4000000, 'Pediatrics');

go
insert into Diseases (Name, Severity) values
                                          ('Heart attack', 5),
                                          ('Stroke', 5),
                                          ('Cancer', 5),
                                          ('Flu', 2),
                                          ('Cold', 2),
                                          ('Headache', 2);

go
insert into Doctors (Name, Phone, Salary, Surname) values
                                                       ('John', '1234567890', 1000, 'Doe'),
                                                       ('Jane', '1234567890', 1000, 'Doe'),
                                                       ('Alice', '1234567890', 1000, 'Smith'),
                                                       ('Bob', '1234567890', 1000, 'Smith'),
                                                       ('Charlie', '1234567890', 1000, 'Brown'),
                                                       ('Daisy', '1234567890', 1000, 'Brown');

go
insert into Examinations (DayOfWeek, EndTime, Name, StartTime) values
                                                                   (1, '12:00', 'Cardiology', '08:00'),
                                                                   (2, '12:00', 'Neurology', '08:00'),
                                                                   (3, '12:00', 'Oncology', '08:00'),
                                                                   (4, '12:00', 'Pediatrics', '08:00'),
                                                                   (5, '12:00', 'Cardiology', '08:00'),
                                                                   (6, '12:00', 'Neurology', '08:00'),
                                                                   (7, '12:00', 'Oncology', '08:00');

--selects
go
select * from Departments;
select * from Diseases;
select * from Doctors;
select * from Examinations;

--deletes
go
drop table Examinations;
drop table Doctors;
drop table Diseases;
drop table Departments;
use master;
drop database Hospital;