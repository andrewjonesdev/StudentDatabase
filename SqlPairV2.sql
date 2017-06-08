create schema montgomeryCollege;
use montgomeryCollege;
 
create table MCStudents
(
	stuName varchar (255),
    stuAddress varChar (255),
    stuCity varChar (255),
    stuState varChar (2),
    stuZip varChar (255),
    stuPhone varChar (255),
    stuID integer auto_increment,
    stuMajor varChar (255),
    primary key (stuID)
);
create table MCDepartments
(
	depName varchar (255),
    depID integer auto_increment,
    primary key (depID)
);

create table MCInstructors
(
	insName varchar (255),
    insAddress varChar (255),
    insCity varChar (255),
    insState varChar (2),
    insZip varChar (255),
    insPhone varChar (255),
    insID integer auto_increment,
    insDep integer,
    depID integer,
    insSalary varChar (255),
    primary key (insID),
    constraint insDep foreign key (depID) references MCDepartments (depID)
);



create table MCCourses
(
	couName varchar (255),
    couHours varChar (2),
    couID integer auto_increment,
    couIns varChar (255),
    insID integer,
    couDep integer,
    depID integer,
    primary key (couID),
    constraint cousIns foreign key (insID) references MCInstructors (insID),
    constraint couDep foreign key (depID) references MCDepartments (depID)
);


alter table MCDepartments
add column insID integer;
alter table MCDepartments
add constraint foreign key depIns (insID) references MCInstructors (insID);

alter table MCStudents
drop column stuName;
alter table MCStudents
add column stuFirstName varchar(255);
alter table MCStudents
add column stuLastName varchar(255);

alter table MCStudents
add column depID integer;
alter table MCStudents
add constraint foreign key stuDep (depID) references MCDepartments (depID);

create table MCMajors
(
	majName varchar (255),
    majID integer auto_increment,
    majDep integer,
    depID integer,
    primary key (majID),
    constraint majDep foreign key (depID) references MCDepartments (depID)
);
alter table MCStudents
drop column stuMajor;
alter table MCStudents
add column majID integer;
alter table MCStudents
add column stuMajor integer;
alter table MCStudents
add constraint foreign key stuMajor (majID) references MCMajors (majID);

show create table MCStudents;
show create table MCInstructors;
show create table MCDepartments;
show create table MCCourses; 
show create table MCMajors; 
select* from MCStudents;
select* from MCInstructors;
select* from MCDepartments;
select* from MCCourses;
select* from MCMajors;
describe MCStudents;
describe MCInstructors;
describe MCDepartments;
describe MCCourses; 
describe MCMajors;