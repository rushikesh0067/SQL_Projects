CREATE TABLE HOSPITAL(
Seria_No INT PRIMARY KEY,
Hospital_name VARCHAR(100) NOT NULL,
States VARCHAR(100) NOT NULL,
Department VARCHAR(100),
Doctors_Count INT NOT NULL,
Patients_Count INT NOT NULL,
Admission_Date	DATE,
Discharge_Date	DATE,
Medical_Expenses NUMERIC(10,2)
);

SELECT * FROM HOSPITAL;

--- Total Number Of Patients----
--Write an SQL query to find the total number of patients across all hospitals. --

SELECT SUM(patients_Count) as Total_Patients 
FROM HOSPITAL;

----Average Number of Doctors per Hospital 
--Retrieve the average count of doctors available in each hospital. --

SELECT HOSPITAL_NAME, AVG(DOCTORS_COUNT) AS AVG_DOCTORS FROM HOSPITAL
GROUP BY HOSPITAL_NAME
ORDER BY AVG_DOCTORS ASC;

--3. Top 3 Departments with the Highest Number of Patients 
--Find the top 3 hospital departments that have the highest number of patients.

SELECT HOSPITAL_NAME, STATES, DEPARTMENT , PATIENTS_COUNT FROM HOSPITAL
ORDER BY PATIENTS_COUNT DESC
LIMIT 3;

----5. Daily Average Medical Expenses 
-- Calculate the average medical expenses per day for each hospital. 

SELECT * FROM HOSPITAL;

SELECT HOSPITAL_NAME, AVG(MEDICAL_EXPENSES) AS AVG_EXPENSES
FROM HOSPITAL
GROUP BY HOSPITAL_NAME;

----6. Longest Hospital Stay 
--Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date. 

SELECT HOSPITAL_NAME, DEPARTMENT, STATES, ADMISSION_DATE, DISCHARGE_DATE,
(DISCHARGE_DATE - ADMISSION_DATE) AS TOTAL_DAY_STAY
FROM HOSPITAL
ORDER BY TOTAL_DAY_STAY DESC
LIMIT 1;

--7. Total Patients Treated Per City 
--Count the total number of patients treated in each city.

SELECT * FROM HOSPITAL;

SELECT STATES, SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS
FROM HOSPITAL
GROUP BY STATES
ORDER BY TOTAL_PATIENTS DESC;

---8. Average Length of Stay Per Department 
--Calculate the average number of days patients spend in each department. 

SELECT DEPARTMENT, AVG(DISCHARGE_DATE - ADMISSION_DATE) AS AVG_DAYS_STAY
FROM HOSPITAL
GROUP BY DEPARTMENT;

----9. Identify the Department with the Lowest Number of Patients 
---Find the department with the least number of patients.
SELECT * FROM HOSPITAL

SELECT DEPARTMENT, SUM(PATIENTS_COUNT) AS TOTAL_PATIENTS
FROM HOSPITAL
GROUP BY DEPARTMENT
ORDER BY TOTAL_PATIENTS ASC
LIMIT 1;

---10. Monthly Medical Expenses Report 
--Group the data by month and calculate the total medical expenses for each month.

SELECT DATE_TRUNC('month', DISCHARGE_DATE) AS MONTH,
SUM(MEDICAL_EXPENSES) AS TOTAL_MEDICAL_EXPENSES
FROM HOSPITAL
GROUP BY DATE_TRUNC('month', DISCHARGE_DATE)
ORDER BY MONTH;


-- THANK YOU FOR REACHING HERE :)