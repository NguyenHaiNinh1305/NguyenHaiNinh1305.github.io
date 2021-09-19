-- QUESTION 1

SELECT 			*
FROM			`Account`
INNER JOIN 		`Department`
ON				`Account`.`DepartmentID` = `Department`.`DepartmentID`;


-- QUESTION 2

SELECT 			*
FROM 			`Account`
WHERE			`CreateDate` < '2010-12-20';

-- QUESTION 3

SELECT 			 A.`PositionID`, A.`Username`, P.`PositionName`
FROM			`Account`  A
INNER JOIN		`Position` P
ON				A.`PositionID` = P.`PositionID`
WHERE			P.`PositionName` = 'DEV';

-- QUESTION 4

SELECT 			 D.`DepartmentName`, A.`DepartmentID`
FROM 			`Account` A
INNER JOIN		`Department` D
ON				`A`.`DepartmentID` = `D`.`DepartmentID`
GROUP BY		`A`.`DepartmentID`
HAVING			COUNT(`A`.`DepartmentID`) > 3;

-- QUESTION 5

SELECT 			E.`QuestionID`, E.`ExamID`, Q.`Content`, COUNT(E.`QuestionID`) AS SL
FROM 			`ExamQuestion` E
INNER JOIN		`Question` Q
ON 				Q.`QuestionID` = E.`QuestionID`
GROUP BY		E.`QuestionID`
HAVING			COUNT(E.`QuestionID`) = (SELECT MAX(countQues) AS maxCountq
										 FROM (SELECT COUNT(E.QuestionID) AS countQues 
                                         FROM Examquestion E
										 GROUP BY E.QuestionID) AS countG);
                                         
-- QUESTION 6	

SELECT 			CQ.`CategoryID`, CQ.`CategoryName`, Q.`Content`, COUNT(Q.`CategoryID`) AS Q 
FROM 			`Question` Q
INNER JOIN		`CategoryQuestion`	CQ	
ON				CQ.`CategoryID` = Q.`CategoryID`
GROUP BY		Q.`CategoryID`	;		

-- QUESTION 7	

SELECT			 Q.`QuestionID`, COUNT(E.`QuestionID`) AS ExAreAns
FROM 			`ExamQuestion` E
RIGHT JOIN		`Question` Q
ON				 Q.`QuestionID` = E.`QuestionID`
GROUP BY	     Q.`QuestionID`;

-- QUESTION 8

SELECT 			*, COUNT(A.`QuestionID`) AS SL
FROM			`Question`Q
LEFT JOIN		`Answer` A
ON				 Q.`QuestionID` = A.`QuestionID`
GROUP BY 		 A.`QuestionID`
HAVING 			 COUNT(A.`QuestionID`) =  (SELECT MAX(countQ) 
										  FROM (SELECT COUNT(A.`QuestionID`) AS countQ
                                          FROM `Answer` A 
                                          GROUP BY A.`QuestionID`) AS countG);
                                          
                                          
-- QUESTION 9     Thống kê số lượng account trong mỗi group       
SELECT			 G.`GroupID`, GA.`AccountID`, COUNT( G.`GroupID`) AS SL,  G.`GroupNAME`
FROM 			 `GroupAccount` GA
JOIN 			 `Group` G
ON				 G.`GroupID` = GA.`GroupID`
GROUP BY		 G.`GroupID`
ORDER BY 		 G.`GroupID`;

-- QUESTION 10

SELECT			 P.`PositionID`, P.`PositionNAME`, COUNT(A.`PositionID`) AS QTT
FROM			 `Position` P
JOIN			 `Account`  A
ON				  P.`PositionID` = A.`PositionID`
GROUP BY 		  A.`PositionID`
HAVING			  COUNT(A.`PositionID`) =  (SELECT MIN(countG) FROM
										   (SELECT COUNT(A.`PositionID`) AS countG
											FROM `Account` A GROUP BY A.`PositionID`) AS groupP);
										

-- Question 11

SELECT 			 D.DepartmentID,D.DepartmentName, P.PositionName, COUNT(P.`PositionName`)
FROM 			`Account` A
JOIN			`Department` D
ON				A.`DepartmentID` = D.`DepartmentID`
JOIN			`Position`    P
ON				A.`PositionID`  = P.`PositionID` 
GROUP BY		D.`DepartmentID`,  P.`PositionID`;  

-- Question 12    
SELECT            Q.`CreatorID`, T.`TypeName`, A.`QuestionID`, A.`Content`, Q.`Content`, AC.`FullnaME`, CA.CATEGORYNAME
FROM 			 `Question` Q
JOIN			 `Answer` A
ON				 A.`QuestionID` = Q.`QuestionID`
JOIN		     `TypeQuestion` T
ON				 Q.`TypeID` = T.`TypeID`
JOIN			 `Account` AC
ON				 AC.`AccountID` = Q.`CreatorID`
JOIN			 `CategoryQuestion` CA 
ON				 CA.`CategoryID` = Q.`CategoryID`
ORDER BY		 Q.`QUESTIONID`;

-- Question 13

SELECT			Q.`TypeID`, T.`TypeNAME`, COUNT( Q.`TypeID`) AS SL
FROM 			`TypeQuestion` T
LEFT JOIN		`Question` Q	
ON				 Q.`TypeID` = T.`TypeID`  
GROUP BY		 Q.`TypeID`
HAVING			 COUNT( Q.`TypeID`);

-- Question 14

SELECT   		 G.`GroupID`, GA.`AccountID`
FROM			`Group`   G
LEFT JOIN		`GroupAccount` GA
ON				G.`GroupID` =  GA.`GroupID`
WHERE		    GA.`AccountID` IS NULL;

-- Question 16

SELECT			Q.`QuestionID`, A.`AnswerID`
FROM			`Question` 	Q
LEFT JOIN		`Answer` A
ON				 Q.`QuestionID` = A.`QuestionID`
WHERE			 A.`AnswerID`	   IS NULL;  

-- Question 17

-- A 
SELECT			 A.`AccountID`, A. `Fullname`
FROM			`Account` A
LEFT JOIN		`GroupAccount` G
ON   			 G.`AccountID` = A.`AccountID`
WHERE			 G.`GroupID` = 1;

-- B
SELECT			 A.`AccountID`, A. `Fullname`
FROM			`Account` A
LEFT JOIN		`GroupAccount` G
ON   			 G.`AccountID` = A.`AccountID`
WHERE			 G.`GroupID` = 2;

-- C 

SELECT			 A.`AccountID`, A. `Fullname`
FROM			`Account` A
LEFT JOIN		`GroupAccount` G
ON   			 G.`AccountID` = A.`AccountID`
WHERE			 G.`GroupID` = 1
UNION
SELECT			 A.`AccountID`, A. `Fullname`
FROM			`Account` A
LEFT JOIN		`GroupAccount` G
ON   			 G.`AccountID` = A.`AccountID`
WHERE			 G.`GroupID` = 2;


-- Question 18

-- A

SELECT			 G.`GroupID`
FROM			 `Group` G
LEFT JOIN		`GroupAccount` GA
ON   			 G.`GroupID` = GA.`GroupID`
GROUP BY		 GA.`AccountID`
HAVING			 COUNT(GA.`AccountID`) >= 5 ;

-- B

SELECT			 G.`GroupID`, GA.`AccountID`
FROM			 `Group` G
LEFT JOIN		`GroupAccount` GA
ON   			 G.`GroupID` = GA.`GroupID`
GROUP BY		 GA.`AccountID`
HAVING			 COUNT(GA.`AccountID`) < 7 ;

-- C 
SELECT			 G.`GroupID`,  GA.`AccountID`
FROM			 `Group` G
LEFT JOIN		`GroupAccount` GA
ON   			 G.`GroupID` = GA.`GroupID`
GROUP BY		 GA.`AccountID`
HAVING			 COUNT(GA.`AccountID`) >= 5 
UNION
SELECT			 G.`GroupID`
FROM			 `Group` G
LEFT JOIN		`GroupAccount` GA
ON   			 G.`GroupID` = GA.`GroupID`
GROUP BY		 GA.`AccountID`
HAVING			 COUNT(GA.`AccountID`) < 7 ;



    




                                        

                                        
