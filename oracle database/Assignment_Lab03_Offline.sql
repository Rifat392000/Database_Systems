--CSE302 Section:2 SUMMER2022
--LAB03(Online)
--Id: 2020-1-60-215
--Name : Md. Abdul Ahad Rifat

--1

select patientId, patientName, patientAge, patientContact
From  Patient 
Natural Join Visit 
Natural Join Doctor 
Where specialty='Heart';

--2

select patientId, patientName 
From  Patient 
Natural Join Visit 
Natural Join Doctor 
Where doctorName ='Alice Brown' And visitDate<'20 June 2022' ;

--3

select prescriptionId , generalFindings , advice , visitId 
From Prescription 
Natural Join Visit 
Natural Join Patient 
Where(patientAge>25);

--4

select patientId, patientName, patientAge, patientContact
From  Patient  
Natural Join Visit 
Natural Join Doctor 
Where doctorName ='Alice Brown'
MINUS
select patientId, patientName, patientAge, patientContact
From  Patient 
Natural Join Visit 
Natural Join Doctor 
Where doctorName ='Robin Steve' ;


--5

select DoctorId , doctorName , specialty
From Doctor 
Natural Join Visit 
MINUS
select DoctorId , doctorName , specialty
From Doctor 
Natural Join Visit 
Where visitDate ='20 June 2022';
