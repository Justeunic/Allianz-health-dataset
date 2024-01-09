Create database AllianzHealth;
use allianzhealth;
create table Branch(
BranchID int,
Branchname varchar (20) not null,
Branchaddress varchar (20) not null,
Contactinformation varchar (20) not null,
primary key(branchid)
);
create table staff(
StaffID int,
Firstname varchar (20) not null,
Lastname varchar (20) not null,
Staffrole varchar (20) not null,
Contactinformation varchar (20) not null,
primary key(staffid)
);
create table Patients(
PatientID int,
Firstname varchar (20) not null,
Lastname varchar (20) not null,
DateofBirth date not null,
Gender ENUM('M', 'F') not null,
ContactInformation varchar (20) not null,
primary key(patientid)
);

create table admission
(
AdmissionID int,
AdmissionDate datetime not null,
DischargeDate datetime not null,
Roomnumber varchar (20),
branchid int,
patientid int,
primary key(admissionid),
foreign key(branchid) references branch(branchid),
foreign key(patientID) references patients(patientID)
);
create table Diagnosis
(
DiagnosisID int,
Diagnosisname varchar (30)not null,
Diagnosisdesc varchar (100) not null,
primary key(DiagnosisID)
);
create table medication
(
MedicationID int,
Medicationname varchar (100) not null,
Dosage varchar (50) not null,
Drugdescr varchar (50) not null,
Branchid int,
primary key(medicationid),
foreign key(branchid) references branch(branchid)
);
create table Death
(
DeathID int,
DateofDeath datetime not null,
CauseofDeath datetime not null,
patientid int,
primary key(deathid),
foreign key(patientid) references patients(patientid)
);
create table Treatment
(
TreatmentID int,
PatientID int,
StaffID int,
DiagnosisID int,
MedicationID int,
BranchID int,
AdmissionID int,
TreatmentDate datetime not null,
Cost decimal (10,2),
Duration int,
primary key(treatmentid),
foreign key(patientid) references patients(patientid),
foreign key(staffid) references staff(staffid),
foreign key(diagnosisid) references diagnosis(diagnosisid),
foreign key(medicationid) references medication(medicationid),
foreign key(branchid) references branch(branchid),
foreign key(admissionid) references admission(admissionid)
);