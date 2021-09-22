use testing_system_assignment_1;

-- QUESTION 1

CREATE  OR REPLACE VIEW 	DSNV_VIEW AS
SELECT			D.`DepartmentID`,D.`DepartmentName`, A.`Email`, A.`Username`, A.`Fullname`, A.`PositionID`
FROM			`Account` A
INNER JOIN		`Department` D
ON				 A.`DepartmentID` = D.`DepartmentID`
WHERE			 D.`DepartmentID` = 5;

DROP  VIEW DSNV_VIEW;
SELECT * FROM DSNV_VIEW;

-- CTE   

WITH		     DSNV  AS (
SELECT 		     A.*, D.`DepartmentNAME`
FROM			`Account` A
INNER JOIN		`Department` D
ON				 A.`DepartmentID` = D.`DepartmentID`
WHERE			 D.`DepartmentID` = 5   
)
SELECT 			*
FROM			DSNV;

-- QUESTION 2

WITH			DSAC AS(
SELECT			COUNT(GA.`AccountID`) AS SL, GA.`AccountID`
FROM			`Group` G
JOIN			`GroupAccount` GA
ON				G.`GroupID` = GA.`GroupID`
GROUP BY		GA.`AccountID`
HAVING			COUNT(GA.`AccountID`) = (SELECT MAX(countM) FROM (SELECT COUNT(GA.`AccountID`) AS countM FROM `GroupAccount` GA GROUP BY GA.`AccountID`) AS countG)

)
SELECT		   *
FROM     	   DSAC;

WITH			DSAC AS
(
SELECT          COUNT(GA.`AccountID`) AS countM FROM `GroupAccount` GA GROUP BY GA.`AccountID`
)
SELECT			COUNT(GA.`AccountID`) AS SL, GA.`AccountID`
FROM			`Group` G
JOIN			`GroupAccount` GA
ON				G.`GroupID` = GA.`GroupID`
GROUP BY		GA.`AccountID`
HAVING			COUNT(GA.`AccountID`) = (SELECT MAX(countM) FROM DSAC
);


-- QUESTION 3

CREATE OR REPLACE VIEW 		findContenT AS
SELECT			*
FROM			`Question`
WHERE			CHAR_LENGTH(`Content`)> 300;
SELECT 			*
FROM			findContenT;
DELETE 			
FROM			findContenT;

-- QUESTION 4

CREATE OR REPLACE VIEW 		dsDE AS
WITH 			countG AS
(
SELECT COUNT(A. `DepartmentID`) AS countm FROM `Account` A  GROUP BY A. `DepartmentID`
)
SELECT		     D.`DepartmentID`, COUNT(A. `DepartmentID`) AS SLNV
FROM			 `Department` D
JOIN			 `Account` A 
ON				 D. `DepartmentID` = A. `DepartmentID`
GROUP BY		 A. `DepartmentID`
HAVING			 COUNT(A. `DepartmentID`) =  (SELECT MAX(countm) FROM countG );

SELECT * FROM dsDE;


-- QUESTION 5
CREATE OR REPLACE VIEW  DSCRE AS
SELECT			 A.`Fullname`,  Q.`CreatorID`, Q.`QuestionID`, SUBSTRING_INDEX(`Fullname`,' ',1) AS HO
FROM			 `Question`  Q
JOIN			 `Account` A
ON				  Q.`CreatorID` =  A.`AccountID`
WHERE			  SUBSTRING_INDEX(`Fullname`,' ',1) = 'NGUYỄN';

SELECT * FROM	DSCRE;


create view fg as
select * from DSCRE;






