-- HR Analytics Project 
use hr_project;

-- Total employees 
select count(employeenumber) from hr1 a
inner join hr2 b on a.employeenumber=b.employee_id;

-- SUM OF ATTRITION COUNT BY GENDER
select Gender,count(attrition)as AttritionCount,
sum(case when attrition="yes" then 1 end)/count(attrition)*100 as Attrition  from hr1
group by gender;

-- Attrition Count: 
select count(case when attrition= "Yes" then 1 end) as AttritionCount from Hr1;

-- Avg Attrition by All Department
select department, count(case when attrition = "yes" then 1 end) as AttritionCount,
Count(*) as TotalEmployees,
count(case when attrition = "yes" then 1 end)/count(*) * 100 as attritionrate
from hr1 a
inner join hr2 b on a.EmployeeNumber=b.employee_id
group by Department;

-- Average of totalworkingyear by each department
select department,
avg(totalworkingyears) as TotalWorkingYears from hr1 a
inner join hr2 b on a.employeenumber=b.employee_id
group by department; 

-- Attrition count vs YearsSinceLastPromotion

select sum(case when Attrition="Yes" then 1 end) as attrition ,
count(YearsSinceLastPromotion) from hr1 a
inner join hr2 b on a.EmployeeNumber=b.employee_id
group by YearsSinceLastPromotion
order by YearsSinceLastPromotion desc;


-- Attrition by job level
select JobLevel,
count(case when attrition="yes" then 1 end) as Attritioncount,
count(*) as TotalEmployees,
count(case when attrition = "yes" then 1 end) / count(*) *100 as Attritionrate
from hr1 a
inner join hr2 b on a.EmployeeNumber=b.Employee_ID
group by JobLevel
order by attritionrate desc;

-- JobRole Vs WorklifeBalance

select Jobrole, sum(worklifebalance) as WorkLifeBalance
from hr1 a
inner join hr2 b on a.EmployeeNumber=b.Employee_ID
group by jobrole;

-- Average Hourly rate of Male Research Scientist

select avg(hourlyrate) as JobMaleRS
from hr1 where gender="male" and JobRole="Research Scientist";

-- Attrition rate Vs Monthly income stats
select Attrition, sum(monthlyincome),count(*) as TotalEMPLOYEE
from hr1 a 
inner join hr2 b on a.EmployeeNumber=b.Employee_ID
group by attrition;
