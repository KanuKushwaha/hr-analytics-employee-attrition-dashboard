CREATE TABLE hr_data (
    Age INT,
    Attrition VARCHAR(10),
    BusinessTravel VARCHAR(50),
    DailyRate INT,
    Department VARCHAR(50),
    DistanceFromHome INT,
    Education INT,
    EducationField VARCHAR(50),
    EmployeeNumber INT,
    EnvironmentSatisfaction INT,
    Gender VARCHAR(20),
    HourlyRate INT,
    JobInvolvement INT,
    JobLevel INT,
    JobRole VARCHAR(50),
    JobSatisfaction INT,
    MaritalStatus VARCHAR(20),
    MonthlyIncome INT,
    MonthlyRate INT,
    NumCompaniesWorked INT,
    Over18 VARCHAR(5),
    OverTime VARCHAR(10),
    PercentSalaryHike INT,
    PerformanceRating INT,
    RelationshipSatisfaction INT,
    StockOptionLevel INT,
    TotalWorkingYears INT,
    TrainingTimesLastYear INT,
    WorkLifeBalance INT,
    YearsAtCompany INT,
    YearsInCurrentRole INT,
    YearsSinceLastPromotion INT,
    YearsWithCurrManager INT
);

SELECT * FROM hr_data
LIMIT 10;

--TOTAL EMPLOYEES

SELECT COUNT(*) AS total_employees
FROM hr_data;


-- ATTRITION COUNT

SELECT Attrition,
       COUNT(*) AS employee_count
FROM hr_data
GROUP BY Attrition;

-- ATTRITION RATE

SELECT 
ROUND(
    (COUNT(CASE WHEN Attrition='Yes' THEN 1 END) * 100.0)
    / COUNT(*),
2
) AS attrition_rate
FROM hr_data;


-- AVERAGE AGE

SELECT ROUND(AVG(Age),2) AS average_age
FROM hr_data;


-- AVERAGE SALARY

SELECT ROUND(AVG(MonthlyIncome),2) AS average_salary
FROM hr_data;


-- GENDER DISTRIBUTION

SELECT Gender,
       COUNT(*) AS total_employees
FROM hr_data
GROUP BY Gender;


-- DEPARTMENT-WISE EMPLOYEES

SELECT Department,
       COUNT(*) AS total_employees
FROM hr_data
GROUP BY Department
ORDER BY total_employees DESC;


-- DEPARTMENT-WISE ATTRITION

SELECT Department,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition='Yes'
GROUP BY Department
ORDER BY attrition_count DESC;


--JOB ROLE-WISE ATTRITION

SELECT JobRole,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition='Yes'
GROUP BY JobRole
ORDER BY attrition_count DESC;



--OVERTIME IMPACT


SELECT OverTime,
       COUNT(*) AS employees_left
FROM hr_data
WHERE Attrition='Yes'
GROUP BY OverTime;


--MARITAL STATUS ANALYSIS


SELECT MaritalStatus,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition='Yes'
GROUP BY MaritalStatus;


--EDUCATION FIELD ANALYSIS

SELECT EducationField,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition='Yes'
GROUP BY EducationField
ORDER BY attrition_count DESC;



--JOB SATISFACTION ANALYSIS


SELECT JobSatisfaction,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition='Yes'
GROUP BY JobSatisfaction
ORDER BY JobSatisfaction;


--WORK-LIFE BALANCE ANALYSIS

SELECT WorkLifeBalance,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition='Yes'
GROUP BY WorkLifeBalance
ORDER BY WorkLifeBalance;


--SALARY SLAB ANALYSIS


SELECT 
CASE
    WHEN MonthlyIncome < 5000 THEN 'Low Salary'
    WHEN MonthlyIncome BETWEEN 5000 AND 10000 THEN 'Medium Salary'
    ELSE 'High Salary'
END AS salary_slab,

COUNT(*) AS attrition_count

FROM hr_data

WHERE Attrition='Yes'

GROUP BY salary_slab;




--AGE GROUP ANALYSIS


SELECT
CASE
    WHEN Age BETWEEN 18 AND 25 THEN '18-25'
    WHEN Age BETWEEN 26 AND 35 THEN '26-35'
    WHEN Age BETWEEN 36 AND 45 THEN '36-45'
    ELSE '46+'
END AS age_group,

COUNT(*) AS attrition_count

FROM hr_data

WHERE Attrition='Yes'

GROUP BY age_group

ORDER BY attrition_count DESC;


--TOP 5 HIGHEST SALARY EMPLOYEES

SELECT EmployeeNumber,
       MonthlyIncome
FROM hr_data
ORDER BY MonthlyIncome DESC
LIMIT 5;


--EMPLOYEES WITH MOST EXPERIENCE

SELECT EmployeeNumber,
       TotalWorkingYears
FROM hr_data
ORDER BY TotalWorkingYears DESC
LIMIT 10;



--OVERTIME + JOB SATISFACTION


SELECT OverTime,
       JobSatisfaction,
       COUNT(*) AS employee_count
FROM hr_data
WHERE Attrition='Yes'
GROUP BY OverTime, JobSatisfaction
ORDER BY employee_count DESC;



--YEARS AT COMPANY ANALYSIS


SELECT YearsAtCompany,
       COUNT(*) AS attrition_count
FROM hr_data
WHERE Attrition='Yes'
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;







