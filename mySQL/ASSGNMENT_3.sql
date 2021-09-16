-- Question 2
SELECT 		*
FROM		`Department`;

-- Question 3
SELECT 		`DepartmentID`	
FROM   	 	`Department`
WHERE   	`DepartmentName`  = 'SALE Department';

-- Question 4
SELECT 		*
FROM		`Account`
WHERE 		CHAR_LENGTH(`Fullname`) = (SELECT MAX(CHAR_LENGTH(`Fullname`)) FROM `Account`)
ORDER BY  `Fullname` desC;

-- QUESTION 5
WITH  		`temTable` AS  
(
SELECT 		*
FROM		`Account` WHERE `DepartmentID`  = 3
)
SELECT 		*
FROM 		`temTable`
WHERE 		CHAR_LENGTH(`Fullname`) = (SELECT MAX(CHAR_LENGTH(`Fullname`)) FROM `temTable` );

-- QUESTION 6
SELECT 		`GroupName`
FROM 		`Group`
WHERE		`CreateDate` < '2019-12-20';

-- QUESTION 7
SELECT 		*FROM  Testing_System_Assignment_1.Answer;
SELECT 		temQ.QuestionID, count(temQ.QuestionID) AS SL FROM `answer` AS `temQ`
GROUP BY 	temQ.QuestionID
HAVING 		count(temQ.QuestionID) >= 4;

-- Question 8  Lấy ra các mã đề thi có thời gian thi >= 60 phút và được tạo trước ngày 20/12/2019
SELECT 		`Code`
FROM		`Exam`
WHERE 		`Duration` > 60 AND `CreateDate` < '2019-12-20';

-- QUESTION 9
SELECT 		*
FROM		`Group`
ORDER BY	`CreateDate` DESC
LIMIT		5;

-- QUESTION 10 Đếm số nhân viên thuộc department có id = 2
SELECT		`DepartmentID`, COUNT(`DepartmentID`) AS SL 
FROM  		`Account`
WHERE		`DepartmentID` = 2	;

-- QUESTION 11
SELECT 		`Fullname` AS NV
FROM		`Account`
WHERE 		`Fullname` LIKE 'D%O';	

-- QUESTION 12
DELETE 		
FROM 		`Exam`
WHERE		`CreateDate` < '2019-12-20';

-- QUESTION 13 : Xóa tất cả các question có nội dung bắt đầu bằng từ "Question"
DELETE
FROM 		`Question`
WHERE		`Content` LIKE 'Question%';

-- QUESTION 14
UPDATE 		`Account`
SET 		`Fullname` = 'Nguyễn Bá Lộc', `Email` = 'loc.nguyenba@vti.com.vn'
WHERE		`AccountID` = 5;

SELECT *FROM `Account`;
-- QUESTION 14
UPDATE		  `GroupAccount`
SET 		  `AccountID` = 5
WHERE		  `GroupID` = 3	 ;

SELECT *FROM `GroupAccount`;










		





		
