-- Database: "UniversityPrefrenceSystem"

-- DROP DATABASE "UniversityPrefrenceSystem";

CREATE DATABASE "universityPrefrenceSystem"
    WITH 
    OWNER = meldakaradag
    ENCODING = 'UTF8'
    LC_COLLATE = 'Turkish_Turkey.1254'
    LC_CTYPE = 'Turkish_Turkey.1254'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;

DROP TABLE university CASCADE;
DROP TABLE faculty CASCADE;
DROP TABLE department CASCADE;
DROP TABLE student CASCADE;

CREATE TABLE university(
	universityId SERIAL PRIMARY KEY,
	name TEXT UNIQUE NOT NULL,
	adress TEXT,
	email TEXT UNIQUE,
	city TEXT,
	uiversityType TEXT DEFAULT 'state',
	yearOfFoundation INT,
	CONSTRAINT uiversityTypeCheck CHECK (uiversityType IN ('state', 'private'))
);


CREATE TABLE faculty(
	facultyId SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT UNIQUE,
	universityId INT NOT NULL REFERENCES university(universityId)
);

CREATE TABLE department(
	departmentId SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	email TEXT UNIQUE,
	lang TEXT DEFAULT 'Turkish',
	educationType TEXT DEFAULT 'formal',
	quota INT,
	quotaTopRanked INT,
	period INT,
	minScore DECIMAL,
	minOrder DECIMAL,
	facultyId INT NOT NULL REFERENCES faculty(facultyId) ON DELETE CASCADE,
	CONSTRAINT langCheck CHECK (lang IN ('Turkish', 'English')),
	CONSTRAINT educationTypeCheck CHECK (educationType IN ('formal', 'evening education'))
);

CREATE TABLE student(
	studentId SERIAL PRIMARY KEY,
	name TEXT NOT NULL,
	surname TEXT NOT NULL,
	score DECIMAL NOT NULL,
	ranking INT,
	position TEXT DEFAULT 'normal',
	CONSTRAINT positionCheck CHECK (position IN ('normal', 'top ranked'))

);
CREATE TABLE preference(
	studentId INT NOT NULL PRIMARY KEY REFERENCES student(studentId),
	preference1 INT NOT NULL,
	preference2 INT NOT NULL,
	preference3 INT NOT NULL,
	CONSTRAINT preference1 FOREIGN KEY(preference1) REFERENCES department(departmentId) ON DELETE CASCADE,
	CONSTRAINT preference2 FOREIGN KEY(preference2) REFERENCES department(departmentId) ON DELETE CASCADE,
	CONSTRAINT preference3 FOREIGN KEY(preference3) REFERENCES department(departmentId) ON DELETE CASCADE

);

INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('Dokuz Eylül University','deu@mail.com','İzmir','state','1956');
INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('İzmir Ekonomi University','ieu@mail.com','İzmir','private','1985');
INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('Ege University','ege@mail.com','İzmir','state','1999');
INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('Yaşar Unviersity','yasar@mail.com','İzmir','private','1920');
INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('METU','metu@mail.com','Ankara','state','1950');
INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('Boğaziçi University','bogazici@mail.com','İstanbul','state','1962');
INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('Anadolu University','anadolu@mail.com','Eskişehir','state','1973');
INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('Akdeniz University','akdeniz@mail.com','Antalya','state','1999');
INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('Izmir Technical University','izmirtech@mail.com','İzmir','state','2000');
INSERT INTO university(name, email, city, uiversityType, yearOfFoundation)  values('Izmir University','izmiruni@mail.com','İzmir','state','2005');

INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'deueng@mail.com', '1');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'deuads@mail.com', '1');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'deuart@mail.com', '1');
INSERT INTO faculty (name, email, universityId) values ('Medicine Faculty', 'deumed@mail.com', '1');
INSERT INTO faculty (name, email, universityId) values ('Law Faculty', 'deulaw@mail.com', '1');
INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'ieueng@mail.com', '2');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'ieuads@mail.com', '2');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'ieuart@mail.com', '2');
INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'egeeng@mail.com', '3');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'egeads@mail.com', '3');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'egeart@mail.com', '3');
INSERT INTO faculty (name, email, universityId) values ('Medicine Faculty', 'egemed@mail.com', '3');
INSERT INTO faculty (name, email, universityId) values ('Law Faculty', 'egelaw@mail.com', '3');
INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'yasareng@mail.com', '4');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'yasarads@mail.com', '4');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'yasarart@mail.com', '4');
INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'metueng@mail.com', '5');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'metuads@mail.com', '5');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'metuart@mail.com', '5');
INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'bogazicieng@mail.com', '6');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'bogaziciads@mail.com', '6');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'bogaziciart@mail.com', '6');
INSERT INTO faculty (name, email, universityId) values ('Medicine Faculty', 'bogazicimed@mail.com', '6');
INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'anadolueng@mail.com', '7');
INSERT INTO faculty (name, email, universityId) values ('Law Faculty', 'anadolulaw@mail.com', '7');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'anadoluads@mail.com', '7');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'anadoluart@mail.com', '7');
INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'akdenizeng@mail.com', '8');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'akdenizads@mail.com', '8');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'akdenizart@mail.com', '8');
INSERT INTO faculty (name, email, universityId) values ('Law Faculty', 'akdenizlaw@mail.com', '8');
INSERT INTO faculty (name, email, universityId) values ('Medicine Faculty', 'akdenizmed@mail.com', '8');
INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'izmirtecheng@mail.com', '9');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'izmirtechads@mail.com', '9');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'izmirtechart@mail.com', '9');
INSERT INTO faculty (name, email, universityId) values ('Engineering Faculty', 'izmireng@mail.com', '10');
INSERT INTO faculty (name, email, universityId) values ('Administration Faculty', 'izmirads@mail.com', '10');
INSERT INTO faculty (name, email, universityId) values ('Fine Arts Faculty', 'izmirart@mail.com', '10');


INSERT INTO department (name, educationType, period, minScore, facultyId) values ('Computer Engineering', 'formal', '4', '400', '89');
INSERT INTO department (name, educationType, period, minScore, facultyId) values ('Computer Engineering', 'evening education', '4', '380', '89');
INSERT INTO department (name, educationType, period, minScore, facultyId) values ('Electrical Engineering', 'formal', '4', '400', '89');
INSERT INTO department (name, educationType, period, minScore, facultyId) values ('Electrical Engineering', 'formal', '4', '380', '89');
INSERT INTO department (name, educationType, period, minScore, facultyId) values ('Low', 'formal', '5', '420', '93');
INSERT INTO department (name, educationType, period, minScore, facultyId) values ('Medicine', 'formal', '6', '480', '92');
INSERT INTO department (name, educationType, period, minScore, facultyId) values ('Computer Engineering', 'formal', '4', '360', '121');
INSERT INTO department (name, educationType, period, minScore, facultyId) values ('Computer Engineering', 'formal', '4', '340', '124');
INSERT INTO department (name, educationType, period, minScore, facultyId) values ('Paint', 'formal', '2', '320', '126');


INSERT INTO student (name, surname, score) values ('Melda','Karadag','420');
INSERT INTO student (name, surname, score) values ('Oguz','Aslan','450');
INSERT INTO student (name, surname, score) values ('Yigit','Ayyıldız','460');
INSERT INTO student (name, surname, score) values ('Burak','Karakaya','360');
INSERT INTO student (name, surname, score) values ('Şevval','Aslan','500');
INSERT INTO student (name, surname, score) values ('Ayşe','Özcan','254');
INSERT INTO student (name, surname, score) values ('Tuğçe','Kurt','412');



INSERT INTO preference (studentId, preference1, preference2, preference3) values ('1','6','5','1');
INSERT INTO preference (studentId, preference1, preference2, preference3) values ('2','5','1','3');
INSERT INTO preference (studentId, preference1, preference2, preference3) values ('3','7','8','9');
INSERT INTO preference (studentId, preference1, preference2, preference3) values ('4','4','2','7');
INSERT INTO preference (studentId, preference1, preference2, preference3) values ('5','6','5','3');
INSERT INTO preference (studentId, preference1, preference2, preference3) values ('6','7','8','9');
INSERT INTO preference (studentId, preference1, preference2, preference3) values ('7','5','3','2');



--Query 1
SELECT university.name
FROM university
WHERE university.yearOfFoundation>1990 AND university.city LIKE 'İ%';

--Query 2 
SELECT *
FROM university INNER JOIN faculty ON university.universityId = faculty.universityId
WHERE (faculty.name LIKE '%Engineering%') INTERSECT (SELECT *
FROM university INNER JOIN faculty ON university.universityId = faculty.universityId
WHERE faculty.name LIKE '%Medicine%');

--Query 3
SELECT COUNT(*), university.uiversityType
FROM university INNER JOIN faculty ON university.universityId = faculty.universityId
GROUP BY university.uiversityType;

--Query 4
SELECT *
FROM department
WHERE department.name LIKE '%Engineering%' AND department.educationType = 'evening education';

--Query 5
SELECT *
FROM department
ORDER BY department.period, department.minScore DESC LIMIT 5;

--Query 6
SELECT COUNT(*), preference1, d.departmentId, d,quota
FROM(
	SELECT preference1 FROM preference
	UNION ALL
	SELECT preference2 FROM preference 
	UNION ALL
	SELECT preference3 FROM preference
) AS temp
INNER JOIN department AS d ON temp.preference1 = d.departmentId
WHERE quota = 4
GROUP BY preference1, d.departmentId, d.quota
ORDER BY COUNT DESC;

--Query 7
SELECT s.studentId, s.name, s.surname
FROM student AS s, department AS d, preference AS p
WHERE s.studentId = p.studentId AND d.departmentId = p.preference1 AND d.name = 'Department of Computer Engineering'
ORDER BY s.score DESC;

--Query 8
UPDATE faculty
SET facultyId = '2' 
FROM university AS u, faculty AS f
WHERE u.universityId = f.universityId AND u.name = 'Dokuz Eylül University' AND f.name LIKE '%Engineering%';

--Query 9
UPDATE department
SET period =+ 1
FROM department AS d, faculty AS f
WHERE d.facultyId = f.facultyId AND f.name LIKE '%Law%' ; 

--Query 10
DELETE FROM faculty 
WHERE faculty.universityId IN (
SELECT universityId 
FROM university
WHERE university.name = 'Izmir University';
);