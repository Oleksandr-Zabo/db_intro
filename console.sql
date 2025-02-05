create database Academy;
go
use Academy;

--create tables
go
create table Groups
(
    Id int primary key identity (1,1) not null,
    Name nvarchar(10) NOT NULL UNIQUE check (LEN(Name) > 0),
    Rating int not null check (Rating >= 0 and Rating <= 5),
    Year int not null check (Year >= 1 and Year <= 5)
);

go
create table Departments
(
    Id int primary key identity (1,1) not null,
    Financing money not null check (Financing >= 0) default 0,
    Name nvarchar(100) NOT NULL UNIQUE check (LEN(Name) > 0),
);

go
create table Faculties(
                          Id int primary key identity (1,1) not null,
                          Name nvarchar(100) NOT NULL UNIQUE check (LEN(Name) > 0)
);

go
create table Teachers
(
    Id int primary key identity (1,1) not null,
    EmploymentDate date not null check (EmploymentDate <= '1990-01-01'),
    Name nvarchar(max) NOT NULL check (LEN(Name) > 0),
    Premium money not null check (Premium >= 0) default 0,
    Salary money not null check (Salary >= 0),
    Surname nvarchar(max) NOT NULL check (LEN(Surname) > 0),
);

--inserts
go
insert into Groups (Name, Rating, Year) values
                                            ('A1', 5, 1),
                                            ('A2', 4, 2),
                                            ('A3', 3, 3),
                                            ('A4', 2, 4),
                                            ('A5', 1, 5);

go
insert into Departments (Financing, Name) values
                                              (100000, 'Department of Mathematics'),
                                              (200000, 'Department of Physics'),
                                              (300000, 'Department of Chemistry'),
                                              (400000, 'Department of Biology'),
                                              (500000, 'Department of Computer Science');

go
insert into Faculties (Name) values
                                 ('Faculty of Mathematics'),
                                 ('Faculty of Physics'),
                                 ('Faculty of Chemistry'),
                                 ('Faculty of Biology'),
                                 ('Faculty of Computer Science');

go
insert into Teachers (EmploymentDate, Name, Premium, Salary, Surname) values
                                                                          ('1980-01-01', 'John', 1000, 10000, 'Doe'),
                                                                          ('1981-01-01', 'Jane', 2000, 20000, 'Doe'),
                                                                          ('1982-01-01', 'Alice', 3000, 30000, 'Smith'),
                                                                          ('1983-01-01', 'Bob', 4000, 40000, 'Smith'),
                                                                          ('1984-01-01', 'Charlie', 5000, 50000, 'Brown');

--selects
go
select * from Groups;
select * from Departments;
select * from Faculties;
select * from Teachers;

select Teachers.Name, Teachers.Surname, Groups.Name, Departments.Name, Faculties.Name  from Teachers, Groups, Departments, Faculties
where Teachers.Id = Groups.Id and Departments.Id = Groups.Id and Faculties.Id = Groups.Id;

--deletes
go
drop table Teachers;
drop table Faculties;
drop table Departments;
drop table Groups;

use master;
drop database Academy;