create database TestDB;
go
use TestDB;
go
create table Users
(
    Id int primary key identity (1,1),
    Name nvarchar(50) NOT NULL,
    Surname nvarchar(50) NOT NULL
);
go create table Account
   (
       Id int primary key identity (1,1),
       Login nvarchar(50) NOT NULL,
       Password nvarchar(16) NOT NULL,
       UserId int NOT NULL,
       CONSTRAINT FK_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
   );

go

insert into Users (Name, Surname) values
                                      ('John', 'Doe'),
                                      ('Jane', 'Doe'),
                                      ('Alice', 'Smith'),
                                      ('Bob', 'Smith'),
                                      ('Charlie', 'Brown'),
                                      ('Daisy', 'Brown');

go

insert into Account (Login, Password, UserId) values
                                                  ('john.doe', '123456', 1),
                                                  ('jane.doe', '123456', 2),
                                                  ('alice.smith', '123456', 3),
                                                  ('bob.smith', '123456', 4),
                                                  ('charlie.brown', '123456', 5),
                                                  ('daisy.brown', '123456', 6);

go

select * from Users;
select * from Account;

select Account.Login, Account.Password, Users.Name+ ' ' + Users.Surname as 'User Info' from Account, Users
where Account.UserId = Users.Id;

go
drop table Account;
drop table Users;
use master;
drop database TestDB;