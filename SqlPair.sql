
drop table if exists MCStudents; 
drop table if exists MCDepartments; 
drop table if exists MCInstructors; 
drop table if exists MCCourses; 
create table MCStudents
(
	stuName varchar (50),
    stuAddress varChar (100),
    stuCity varChar (50),
    stuState varChar (2),
    stuZip varChar (5),
    stuPhone varChar (10),
    stuID varchar (10),
    stuMajor varChar (50),
    primary key (stuID)
);
create table MCDepartments
(
	depName varchar (50),
    depID varChar (10),
    primary key (depID)
);
create table MCInstructors
(
	insName varchar (50),
    insAddress varChar (100),
    insCity varChar (50),
    insState varChar (2),
    insZip varChar (5),
    insPhone varChar (10),
    insID varchar (10),
    depID varChar (10),
    insSalary varChar (50),
    primary key (insID),
    foreign key (depID) references MCDepartments (depID)
);
create table MCCourses
(
	couName varchar (50),
    depID varChar (10),
    couHours varChar (2),
    insID varChar (10),
    couID varchar (10),
    stuMajor varChar (50),
    primary key (couID),
    foreign key (insID) references MCInstructors (insID),
    foreign key (depID) references MCDepartments (depID)
);
alter table MCDepartments
modify column insID varchar(10);
alter table MCDepartments
add foreign key (insID) references MCInstructors (insID); 
select* from MCStudents;
select* from MCInstructors;
select* from MCDepartments;
select* from MCCourses;