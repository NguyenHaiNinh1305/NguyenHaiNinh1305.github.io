CREATE DATABASE Testing_System_Assignment_1;
USE Testing_System_Assignment_1;
-- TB1
CREATE TABLE Department(
DepartmentID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
DepartmentName varchar(50)  
);
DROP TABLE DEPARTMENT;
INSERT INTO Department(DepartmentName)
VALUES('Black');
INSERT INTO Department(DepartmentName)
VALUES('red');
INSERT INTO Department(DepartmentName)
VALUES('Yellow');
INSERT INTO Department(DepartmentName)
VALUES('Orange');
INSERT INTO Department(DepartmentName)
VALUES('Violet');
SELECT *FROM DEPARTMENT;
-- TB2
CREATE TABLE Positions(
PositionID int NOT NULL PRIMARY KEY AUTO_INCREMENT,
PositionName VARCHAR(50)
);
INSERT INTO Positions(PositionName)
VALUES('CEO');
INSERT INTO Positions(PositionName)
VALUES('Founder');
INSERT INTO Positions(PositionName)
VALUES('Staff');
INSERT INTO Positions(PositionName)
VALUES('Manager');
INSERT INTO Positions(PositionName)
VALUES('Vice-president');
DROP TABLE Positions;
-- TB3
CREATE TABLE Accounts(
AccountID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
Email VARCHAR(50),
Username VARCHAR(50),
FullName VARCHAR(50),
DepartmentID INT,
PositionID INT,
CONSTRAINT fk_de FOREIGN KEY (DepartmentID) REFERENCES DEPARTMENT(DepartmentID),
CONSTRAINT fk_po FOREIGN KEY (PositionID) REFERENCES Positions(PositionID)
);
INSERT INTO Accounts(Email, Username, FullName, DepartmentID, PositionID )
VALUES('a@gmail.com', 'Ninh', 'Nguyen Hai Ninh', '1', '1');
INSERT INTO Accounts(Email, Username, FullName, DepartmentID, PositionID )
VALUES('b@gmail.com', 'Hai', 'Nguyen Hai Hai', '2', '2');
INSERT INTO Accounts(Email, Username, FullName, DepartmentID, PositionID )
VALUES('c@gmail.com', 'HU', 'Nguyen Hai HU', '3', '3');
INSERT INTO Accounts(Email, Username, FullName, DepartmentID, PositionID )
VALUES('d@gmail.com', 'Hi', 'Nguyen Hai Hi', '4', '4');
INSERT INTO Accounts(Email, Username, FullName, DepartmentID, PositionID )
VALUES('e@gmail.com', 'Ha', 'Nguyen Hai Ha', '5', '5');
drop table Accounts;
SELECT * FROM Accounts;
-- TB4
CREATE TABLE Grs(
GroupID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
GroupName varchar(50),
CreatorID int ,
CreateDate date 
);
INSERT INTO Grs(GroupName, CreatorID, CreateDate )
VALUES('Creative', '111', '2021/02/15');
INSERT INTO Grs(GroupName, CreatorID, CreateDate )
VALUES('Creative1', '112',  '2001/02/16');
INSERT INTO Grs(GroupName, CreatorID, CreateDate )
VALUES('Creative2', '113',  '2001/02/17');
INSERT INTO Grs(GroupName, CreatorID, CreateDate )
VALUES('Creative3', '114',  '2001/02/18');
INSERT INTO Grs(GroupName, CreatorID, CreateDate )
VALUES('Creative4', '115', '2001/02/19');
SELECT * FROM Grs;
-- TB5
CREATE TABLE GrsAcc(
GroupID INT,
FOREIGN KEY (GroupID) REFERENCES Grs(GroupID),
AccountID INT,
CONSTRAINT fk_ac FOREIGN KEY (AccountID) REFERENCES Accounts(AccountID),
JoinDate date
);
INSERT INTO GrsAcc(GroupID, AccountID, JoinDate )
VALUES('1', '1', '2021/03/15');
INSERT INTO GrsAcc(GroupID, AccountID, JoinDate )
VALUES('2', '2',  '2001/04/16');
INSERT INTO GrsAcc(GroupID, AccountID, JoinDate )
VALUES('3', '3',  '2001/05/17');
INSERT INTO GrsAcc(GroupID, AccountID, JoinDate )
VALUES('4', '4',  '2001/06/18');
INSERT INTO GrsAcc(GroupID, AccountID, JoinDate )
VALUES('5', '5', '2001/07/19');
SELECT * FROM GrsAcc;
-- TB6
CREATE TABLE TypeQuestion(
TypeID int not null primary key auto_increment,
TypeName varchar(20)
);
INSERT INTO TypeQuestion(TypeName)
VALUES('Easy');
INSERT INTO TypeQuestion(TypeName)
VALUES('Easy');
INSERT INTO TypeQuestion(TypeName)
VALUES('Medium');
INSERT INTO TypeQuestion(TypeName)
VALUES('Hard');
INSERT INTO TypeQuestion(TypeName)
VALUES('Expert');
SELECT * FROM TypeQuestion;
-- TB7
CREATE TABLE CategoryQuestion(
CategoryID INT 	not null primary key auto_increment,
CategoryName varchar(50)
);
INSERT INTO CategoryQuestion(CategoryName)
VALUES('Math');
INSERT INTO CategoryQuestion(CategoryName)
VALUES('Geography');
INSERT INTO CategoryQuestion(CategoryName)
VALUES('IT');
INSERT INTO CategoryQuestion(CategoryName)
VALUES('History');
INSERT INTO CategoryQuestion(CategoryName)
VALUES('Data');
SELECT * FROM CategoryQuestion;
Drop table CategoryQuestion;
-- TB8
CREATE TABLE Question(
QuestionID int not null primary key auto_increment,
Content text,
CategoryID int,
TypeID int,
CreatorID int ,
CreateDate date,
CONSTRAINT fk_ca FOREIGN KEY (CategoryID) REFERENCES CategoryQuestion(CategoryID),
CONSTRAINT fk_ty FOREIGN KEY (TypeID) REFERENCES TypeQuestion(TypeID)
);
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES('How many legs does a cow have?','1', '1', '111', '2021/02/15');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES('How many legs does a dog have?','2', '2', '112', '2021/02/16');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES('How many legs does a Spider have?','3', '3', '113', '2021/02/17');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES('How many legs does a crab have?','4', '4', '114', '2021/02/18');
INSERT INTO Question (Content, CategoryID, TypeID, CreatorID, CreateDate)
VALUES('How many legs does a centipede have?','5', '5', '115', '2021/02/19');
DROP TABLE Question;
-- TB9
CREATE TABLE Answer(
AnswerID int not null primary key auto_increment,
content text,
QuestionID int,
CONSTRAINT fk_qu FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID),
isCorrect boolean
);
INSERT INTO Answer(content, QuestionID, isCorrect)
VALUES('HAS 4', '1', true);
INSERT INTO Answer(content, QuestionID, isCorrect)
VALUES('HAS 4', '2', true);
INSERT INTO Answer(content, QuestionID, isCorrect)
VALUES('HAS 8', '3', true);
INSERT INTO Answer(content, QuestionID, isCorrect)
VALUES('HAS 8', '4', true);
INSERT INTO Answer(content, QuestionID, isCorrect)
VALUES('HAS more than 300', '5', false);
SELECT *FROM Answer;
DROP TABLE Answer;
-- table10
CREATE TABLE Exam(
ExamID int not null primary key auto_increment,
codes varchar(10),
Title varchar(50),
Duration time,
CreatorID int,
CreatorDate date
);
INSERT INTO Exam(codes, Title, Duration, CreatorID, CreatorDate)
VALUES('A01', 'Final exam1', '12:52:30', '1', '2021/6/1');
INSERT INTO Exam(codes, Title, Duration, CreatorID, CreatorDate)
VALUES('A02', 'Final exam2', '12:52:30', '15', '2021/6/1');
INSERT INTO Exam(codes, Title, Duration, CreatorID, CreatorDate)
VALUES('A03', 'Final exam3', '12:52:30', '1', '2021/6/1');
INSERT INTO Exam(codes, Title, Duration, CreatorID, CreatorDate)
VALUES('A04', 'Final exam4', '12:52:30', '2', '2021/6/1');
INSERT INTO Exam(codes, Title, Duration, CreatorID, CreatorDate)
VALUES('A05', 'Final exam5', '12:52:30', '1', '2021/6/1');
DROP TABLE Exam;
-- TB11
CREATE TABLE ExamQuestion(
ExamID int,
CONSTRAINT fk_ex FOREIGN KEY (ExamID) REFERENCES Exam(ExamID),
QuestionID int,
CONSTRAINT fk_quS FOREIGN KEY (QuestionID) REFERENCES Question(QuestionID)
);
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES('1', '1');
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES('2', '2');
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES('3', '3');
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES('4', '4');
INSERT INTO ExamQuestion(ExamID, QuestionID)
VALUES('5', '5');
SELECT * FROM ExamQuestion;
