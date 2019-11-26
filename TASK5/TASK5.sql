/*ORDER FOR TABLE CREATION: 
Educational institution -> Faculty -> Room -> Timetable -> Teacher -> Course -> Computer -> Student -> Student_Course -> Group -> Timeslot*/
/*code is written in chronological order how tables should be created and data inserted*/

CREATE DATABASE task5;													/*<----- CREATE DATABASE*/

CREATE TABLE EDUCATIONALINSTITUTION (									/*<----- EDUCATIONALINSTITUTION*/
	institution_ID INT NOT NULL,
    institutionName VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(institution_ID)
);
SELECT * FROM EDUCATIONALINSTITUTION;
DESCRIBE EDUCATIONALINSTITUTION;

CREATE TABLE FACULTY (													/*<----- FACULTY*/
	faculty_ID INT NOT NULL,
    facultyName VARCHAR(25) NOT NULL UNIQUE,
    address VARCHAR(30) NOT NULL UNIQUE,
    institution_ID INT NOT NULL,
    PRIMARY KEY(faculty_ID),
    FOREIGN KEY(institution_ID) REFERENCES EDUCATIONALINSTITUTION(institution_ID)
);
SELECT * FROM FACULTY;
DESCRIBE FACULTY;

CREATE TABLE ROOM (														/*<----- ROOM*/
	room_number INT NOT NULL,
    faculty_ID INT NOT NULL, 
    PRIMARY KEY(room_number),
    FOREIGN KEY(faculty_ID) REFERENCES FACULTY(faculty_ID)
);
SELECT * FROM ROOM;
DESCRIBE ROOM;

CREATE TABLE TIMETABLE (												/*<----- TIMETABLE*/
	timetable_ID INT NOT NULL,
    faculty_ID INT NOT NULL,
    PRIMARY KEY(timetable_ID),
    FOREIGN KEY(faculty_ID) REFERENCES FACULTY(faculty_ID)
);
SELECT * FROM TIMETABLE;
DESCRIBE TIMETABLE;

CREATE TABLE TEACHER (													/*<----- TEACHER*/
	teacher_ID INT NOT NULL,
    teacherName VARCHAR(15) NOT NULL UNIQUE,
    teacherSurname VARCHAR(25) NOT NULL UNIQUE,
	teacherEmail VARCHAR(50) NOT NULL UNIQUE,
    teacher_rank VARCHAR(10) NOT NULL,
    faculty_ID INT NOT NULL,
    PRIMARY KEY(teacher_ID),
    FOREIGN KEY(faculty_ID) REFERENCES FACULTY(faculty_ID)
);
SELECT * FROM TEACHER;
DESCRIBE TEACHER;

CREATE TABLE COURSE (													/*<----- COURSE*/
	course_ID INT NOT NULL,
    course_Name VARCHAR(15) NOT NULL UNIQUE,
    course_Credits INT NOT NULL,
    teacher_ID INT NOT NULL,
    PRIMARY KEY(course_ID),
    FOREIGN KEY(teacher_ID) REFERENCES TEACHER(teacher_ID)
);
SELECT * FROM COURSE;
DESCRIBE COURSE;

CREATE TABLE COMPUTER ( 												/*<----- COMPUTER*/ 
	computer_ID INT NOT NULL,											
	factory_Name VARCHAR(15) NOT NULL,
    PRIMARY KEY(computer_ID)
);
SELECT * FROM COMPUTER;
DESCRIBE COMPUTER;

CREATE TABLE STUDENT (													/*<----- STUDENT*/
	student_ID INT NOT NULL UNIQUE,
    firstName VARCHAR(15) NOT NULL UNIQUE,
    lastName VARCHAR(25) NOT NULL UNIQUE,
	studentEmail VARCHAR(50) NOT NULL UNIQUE,
    computer_ID INT NOT NULL,
    course_ID INT NOT NULL,
    PRIMARY KEY(student_ID),
    FOREIGN KEY(computer_ID) REFERENCES COMPUTER(computer_ID),
    FOREIGN KEY(course_ID) REFERENCES COURSE(course_ID)
);
SELECT * FROM STUDENT;
DESCRIBE STUDENT;

CREATE TABLE STUDENT_COURSE (											/*<----- STUDENT_COURSE*/
	course_ID INT NOT NULL,
    student_ID INT NOT NULL,
	numberOfGrades INT NOT NULL,
    FOREIGN KEY(course_ID) REFERENCES COURSE(course_ID),
    FOREIGN KEY(student_ID) REFERENCES STUDENT(student_ID)
);
SELECT * FROM STUDENT_COURSE;
DESCRIBE STUDENT_COURSE;

CREATE TABLE STUDENTGROUP (												/*<----- STUDENTGROUP*/
	group_ID VARCHAR(5) NOT NULL,
    studentCount INT NOT NULL,
    semester INT NOT NULL,
    student_ID INT NOT NULL,
    PRIMARY KEY(group_ID),
    FOREIGN KEY(student_ID) REFERENCES STUDENT(student_ID)
);
SELECT * FROM STUDENTGROUP;
DESCRIBE STUDENTGROUP;

CREATE TABLE TIMESLOT (													/*<----- TIMESLOT*/
	slot_ID INT NOT NULL,
    day_Of_Week VARCHAR(10) NOT NULL,
    start_Time TIME NOT NULL, /*HH:MI:SS*/
    end_Time TIME NOT NULL, /*HH:MI:SS*/
    timetable_ID INT NOT NULL,
    room_number INT NOT NULL,
    group_ID VARCHAR(5) NOT NULL,
    PRIMARY KEY(slot_ID),
	FOREIGN KEY(room_number) REFERENCES ROOM(room_number),
	FOREIGN KEY(timetable_ID) REFERENCES TIMETABLE(timetable_ID),
	FOREIGN KEY(group_ID) REFERENCES STUDENTGROUP(group_ID)
);
SELECT * FROM TIMESLOT;
DESCRIBE TIMESLOT;

/*--------------------------------------------------------------DATA INSERTION--------------------------------------------------------------*/

INSERT INTO EDUCATIONALINSTITUTION(institution_ID, institutionName) VALUES (1, 'Vilniaus Kolegija');
INSERT INTO EDUCATIONALINSTITUTION(institution_ID, institutionName) VALUES (2, 'Vilniaus Gedimino Technikos Universitetas');
INSERT INTO EDUCATIONALINSTITUTION(institution_ID, institutionName) VALUES (3, 'Vilniaus Universitetas');

INSERT INTO FACULTY(faculty_ID, facultyName, address, institution_ID) VALUES (1, 'EIF', 'Jasinskio g. 15', 1);
INSERT INTO FACULTY(faculty_ID, facultyName, address, institution_ID) VALUES (2, 'VVF', 'Didlaukio g. 49', 1);
INSERT INTO FACULTY(faculty_ID, facultyName, address, institution_ID) VALUES (3, 'AGAI', 'Linkmenu g. 28', 2);

INSERT INTO ROOM(room_number, faculty_ID) VALUES (324, 1);
INSERT INTO ROOM(room_number, faculty_ID) VALUES (202, 1);
INSERT INTO ROOM(room_number, faculty_ID) VALUES (414, 1);
INSERT INTO ROOM(room_number, faculty_ID) VALUES (6320, 3);

INSERT INTO TIMETABLE(timetable_ID, faculty_ID) VALUES (201901, 1); /*2019 1st half (2018-2019 2nd semester)*/
INSERT INTO TIMETABLE(timetable_ID, faculty_ID) VALUES (201902, 1); /*2019 2nd half (2019-2020 1st semester)*/
INSERT INTO TIMETABLE(timetable_ID, faculty_ID) VALUES (202001, 1);	/*and so on*/
INSERT INTO TIMETABLE(timetable_ID, faculty_ID) VALUES (202002, 1);

INSERT INTO TEACHER(teacher_ID, teacherName, teacherSurname, teacherEmail, teacher_rank, faculty_ID) VALUES (424568, 'Justinas', 'Zailskas', 't424568@ad.viko.lt', 'lec.', 1);
INSERT INTO TEACHER(teacher_ID, teacherName, teacherSurname, teacherEmail, teacher_rank, faculty_ID) VALUES (625879, 'Mindaugas', 'Liogys', 't625879@ad.viko.lt', 'doc.', 1);
INSERT INTO TEACHER(teacher_ID, teacherName, teacherSurname, teacherEmail, teacher_rank, faculty_ID) VALUES (385651, 'Rūta', 'Trimailovienė', 't385651@ad.viko.lt', 'lec.', 2);

INSERT INTO COURSE(course_ID, course_Name, course_Credits, teacher_ID) VALUES (1, 'Database Design', 6, 424568);
INSERT INTO COURSE(course_ID, course_Name, course_Credits, teacher_ID) VALUES (2, 'Law', 3, 385651);
INSERT INTO COURSE(course_ID, course_Name, course_Credits, teacher_ID) VALUES (3, 'OOP', 6, 625879);

INSERT INTO COMPUTER(computer_ID, factory_Name) VALUES (1,'DELL');
INSERT INTO COMPUTER(computer_ID, factory_Name) VALUES (2,'HP');
INSERT INTO COMPUTER(computer_ID, factory_Name) VALUES (3,'TOSHIBA');

INSERT INTO STUDENT(student_ID, firstName, lastName, studentEmail, computer_ID, course_ID) VALUES (033960, 'Dziugas', 'Peciulevicius', 's033960@ad.viko.lt', 1, 2);
INSERT INTO STUDENT(student_ID, firstName, lastName, studentEmail, computer_ID, course_ID) VALUES (034666, 'Saule', 'Stankeviciute', 's034666@ad.viko.lt', 2, 1);
INSERT INTO STUDENT(student_ID, firstName, lastName, studentEmail, computer_ID, course_ID) VALUES (035842, 'Mantas', 'Podolskis', 's035842@ad.viko.lt', 1, 3);

INSERT INTO STUDENT_COURSE(course_ID, student_ID, numberOfGrades) VALUES (1, 033960, 5);
INSERT INTO STUDENT_COURSE(course_ID, student_ID, numberOfGrades) VALUES (1, 034666, 6);
INSERT INTO STUDENT_COURSE(course_ID, student_ID, numberOfGrades) VALUES (3, 035842, 2);

INSERT INTO STUDENTGROUP(group_ID, studentCount, semester, student_ID) VALUES ('PI18E', 18, 3, 033960);
INSERT INTO STUDENTGROUP(group_ID, studentCount, semester, student_ID) VALUES ('PI18C', 32, 3, 034666);
INSERT INTO STUDENTGROUP(group_ID, studentCount, semester, student_ID) VALUES ('PI17A', 10, 5, 035842);
																											
INSERT INTO TIMESLOT(slot_ID, day_Of_Week, start_Time, end_Time, timetable_ID, room_number, group_ID) VALUES (209301100, 'wednesday', '09:30', '11:00', 201902, 414, 'PI18E');
INSERT INTO TIMESLOT(slot_ID, day_Of_Week, start_Time, end_Time, timetable_ID, room_number, group_ID) VALUES (311451315, 'wednesday', '11:45', '13:15', 201902, 324, 'PI18E');
INSERT INTO TIMESLOT(slot_ID, day_Of_Week, start_Time, end_Time, timetable_ID, room_number, group_ID) VALUES (511451315, 'friday', '11:45', '13:15', 201902, 202, 'PI18E');