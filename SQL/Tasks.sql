USE homework;
CREATE TABLE universities (
	universityId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameOfUniversity VARCHAR (45) UNIQUE
);
INSERT INTO universities (nameOfUniversity) VALUES
("CHNU"),
("KNU"),
("POLITEKHNIKA"),
("KNTEU"),
("BDMU"),
("KHNU");
INSERT INTO universities (nameOfUniversity) VALUES
("BU");

CREATE TABLE faculties (
	facultyId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameOfFaculty VARCHAR (45) UNIQUE,
    universityId INT,
    FOREIGN KEY(universityId) REFERENCES universities(universityId)
);
INSERT INTO faculties (nameOfFaculty, universityId) VALUES
("Computer science", 1),
("Law faculty", 4),
("Economy faculty", 2),
("Historical faculty", 6),
("Medical faculty", 5),
("Math faculty", 3);

CREATE TABLE classes (
	classId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    nameOfClass VARCHAR (45) UNIQUE,
    universityId INT,
    facultyId INT,
    FOREIGN KEY(universityId) REFERENCES universities(universityId),
    FOREIGN KEY(facultyId) REFERENCES faculties(facultyId)
);
INSERT INTO classes (nameOfClass, universityId, facultyId) VALUES
("544", 1, 1),
("544sk", 1, 1),
("622", 5, 5),
("622sk", 5, 5),
("172", 2, 2),
("433", 2, 2),
("444", 3, 3),
("444sk", 1, 1),
("222", 4, 4),
("342", 6, 6);

CREATE TABLE students (
	studentId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR (45),
    lastName VARCHAR (45),
    age INT,
    universityId INT,
    facultyId INT,
    classId INT,
    FOREIGN KEY(universityId) REFERENCES universities(universityId),
    FOREIGN KEY(facultyId) REFERENCES faculties(facultyId),
    FOREIGN KEY(classId) REFERENCES classes(classId)
);
INSERT INTO students (firstName, lastName, age, classId, facultyId, universityId) VALUES
("Vasyl", "Nedashkivsky", 22, 1, 1, 1),
("Viktor", "Voloshin", 20, 10, 6, 6),
("Andriy", "Melnyk", 21, 9, 4, 4),
("Oleksandr", "Makarov", 20, 3, 5, 5),
("Gennadiy", "Artemov", 23, 5, 2, 2),
("Vladyslav", "Shevchenko", 23, 7, 3, 3);

CREATE TABLE teachers (
	teacherId INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    firstName VARCHAR (45),
    lastName VARCHAR (45),
    universityId INT,
    facultyId INT,
    FOREIGN KEY(universityId) REFERENCES universities(universityId),
    FOREIGN KEY(facultyId) REFERENCES faculties(facultyId)
);
INSERT INTO teachers (firstName, lastName, facultyId, universityId) VALUES
("Lilia", "Boiko", 1, 1),
("Oleg", "Kovalenko", 4, 4),
("Oleksiy", "Chereshnev", 2, 2),
("Boris", "Nestaiko", 6, 6),
("Anna", "Myronova", 5, 5),
("Myroslava", "Grinchenko", 3, 3);

SELECT * FROM universities;
SELECT * FROM faculties;
SELECT * FROM classes;
SELECT * FROM students;
SELECT * FROM teachers;

/* select*/
SELECT * FROM universities;
SELECT firstName, lastName FROM students;
SELECT * FROM teachers WHERE firstName = "Oleg";
SELECT * FROM classes WHERE nameOfClass > 300;
SELECT * FROM universities WHERE nameOfUniversity LIKE "%U%"; 

/* aggreagte functions */
SELECT COUNT(*) FROM universities;
SELECT COUNT(nameOfUniversity) FROM universities;
SELECT COUNT(nameOfUniversity) FROM universities WHERE nameOfUniversity LIKE "K%";

SELECT MIN(age) FROM students;

SELECT MAX(age) AS minimumAge FROM students;

SELECT AVG(age) FROM students;

SELECT SUM(age) FROM students;

/* group by, order by */
SELECT COUNT(age), age FROM students GROUP BY age HAVING age <> 21;

SELECT * FROM students ORDER BY firstName;

SELECT * FROM students ORDER BY firstName DESC;  /* ASC */

SELECT * FROM students ORDER BY age LIMIT 3;

SELECT * FROM students ORDER BY age LIMIT 3 OFFSET 1; /* offset - skip 1st student */

/* join */
SELECT * FROM universities JOIN faculties ON universities.universityId = faculties.universityId;
SELECT * FROM universities LEFT JOIN faculties ON universities.universityId = faculties.universityId;
 



