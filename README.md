# WED_BAJIJI_EXAM

# **🏥 Patient Management System - Phase 2:Business Process Modeling (Related to MIS).**

## Introduction

In this phase, I translated our business processes into a structured data model, ensuring data integrity, eliminating redundancy, and supporting real-world scenarios in patient management.

We have the key entities, their attributes, relationships, and the normalization steps taken to achieve an efficient and reliable database design.

## **🎲1. Define the Scope**

### **🔍 Business Process Being Modeled:**

Patient Appointment and Record Management Process

### **📌 Relevance to MIS:**

This process ensures that patient information (appointments, medical records, diagnoses) flows seamlessly between departments, supports timely decision-making, and ensures accurate, up-to-date data access for healthcare professionals.

## **🎯Objectives:**

**•**	Automate patient appointment scheduling.

**•**	Store and manage complete patient records.

**•**	Ensure availability of accurate information for doctors and administrative staff.

**•**	Support data-driven decisions in treatment and operations.

### **✅ Expected Outcomes:**

**•**	Reduced waiting time.

**•**	Improved diagnosis through historical data.

**•**	Enhanced collaboration across departments.\


## **🎲2. Identify Key Entities**

| **Entity**               |**Description**                               | **Role**                                                  |
|--------------------------|----------------------------------------------|-----------------------------------------------------------|
| **Patient**              | Individual receiving care                    | Requests appointments, provides personal/medical info     |
| **Receptionist**         | Front desk staff                             | Manages appointments, updates patient details             |
| **Doctor**               | Medical staff                                | Reviews patient records, adds diagnoses and prescriptions |
| **MIS Database**         | Central data store                           | Stores all patient records, appointments, diagnosis       |
| **System (App)**         | User interface                               | Allows staff and patients to interact with the system     |
| **Admin System Manager** | System manager                               | Manages access control and data quality                   |


## **🎲3, 4 & 5. UML/BPMN Diagram with Swimlanes**

<img width="383" alt="BPMN DIAGRAM" src="https://github.com/user-attachments/assets/280cc679-a0fe-4759-b41f-5773920d828f" />


## **🎲6. Explanation of the BPMN Diagram**

## **🧩 Main Components & Interactions:**


**•	Patient:** Initiates the process by providing personal and medical information.

**•	Receptionist:** Registers the patient and schedules an appointment.

**•	Doctor:** Accesses the patient’s record at appointment time and performs an examination.

**•	MIS Database:** Updates and stores all information—appointments, examinations, diagnoses.

**•	System:** Facilitates data entry, retrieval, and workflow transitions across actors.



## **🧠 How the Process Supports MIS Functions**

**•	Decision-Making:** Doctors have immediate access to patient history, improving diagnostic accuracy.

**•	Operational Efficiency:** Reduces paperwork and manual scheduling; automates routine tasks.

**•	Data Integrity:** Ensures up-to-date, secure, and centralized data storage.

**•	Monitoring & Evaluation:** Admins can review system logs and performance indicators.

_
## **⚙️📈Importance for Organizational Efficiency**
 

**•** 💼	Reduces administrative burden on staff.

**•**	🚫Eliminates double-entry errors.

**•**	🚀Speeds up patient handling and reporting.

**•**	🛡️Ensures traceability and accountability across all stages of the patient care process.


# **🏥 Patient Management System – Phase 3: Logical Model Design**

 **💡** Welcome to Phase 3 of our Oracle PL/SQL Database Project! 🎯  
In this phase, we focused on building a **Logical Data Model** aligned with our business process from **Phase 2** and problem statement in **Phase 1**.

## 🧠 Phase Objectives

✔️ Identify and define all entities and their attributes  
✔️ Set up relationships using **primary** and **foreign keys**  
✔️ Apply database constraints (NOT NULL, UNIQUE, CHECK, DEFAULT)  
✔️ Normalize the model to **Third Normal Form (3NF)**  
✔️ Ensure data integrity and support real-world scenarios  

## 🧱 Key Entities in the System

**-** 🧑‍ Patients 
**-** 🥼 Doctors   
**-**  📆 Appointments  
**-** 🗂️ MedicalRecords   
**-**  🏥 Departments
**-** 🔐 Users` (for login and access control) 


## **1. Entity-Relationship (ER) Model**

### **Patient**

| **Attribute**   | **Data Type**   | **Description**                   |
|-----------------|-----------------|-----------------------------------|
| patient_id (PK) | NUMBER          | Unique ID for each patient        |
| full_name       | VARCHAR2(100)   | Patient’s full name               |
| email           | VARCHAR2(100)   | Email address (must be unique)    |
| phone           | VARCHAR2(15)    | Phone number                      |
| age             | NUMBER          | Age of the patient                |
| gender          | VARCHAR2(10)    | Gender of the patient             |


### **🩺Doctor**

| **Attribute**   | **Data Type**   | **Description**            |
|-----------------|-----------------|----------------------------|
| doctor_id (PK)  | NUMBER          | Unique ID for each doctor  |
| full_name       | VARCHAR2(100)   | Doctor's full name         |
| specialization  | VARCHAR2(50)    | Area of specialization     |
| phone           | VARCHAR2(15)    | Contact number             |
| email           | VARCHAR2(100)   | Email address              |


### **📅Appointment**

| **Attribute**      | **Data Type**   | **Description**                      |
|--------------------|-----------------|--------------------------------------|
| appointment_id (PK)| NUMBER          | Unique ID for each appointment       |
| patient_id (FK)    | NUMBER          | Linked to Patient                    |
| doctor_id (FK)     | NUMBER          | Linked to Doctor                     |
| appointment_date   | DATE            | Date of the appointment              |
| status             | VARCHAR2(20)    | Scheduled / Completed / Canceled     |


### **📝Examination**

| **Attribute**       | **Data Type**      | **Description**               |
|---------------------|--------------------|-------------------------------|
| exam_id (PK)        | NUMBER             | Unique exam ID                |
| appointment_id (FK) | NUMBER             | Links to Appointment          |
| symptoms            | VARCHAR2(255)      | Patient-reported symptoms     |
| diagnosis           | VARCHAR2(255)      | Doctor's diagnosis            |
| prescribed_meds     | VARCHAR2(255)      | Medicines prescribed          |


### **💁‍♀️ / 💁‍♂️Receptionist**

|  **Attribute**      | **Data Type**   |  **Description**           |
|---------------------|-----------------|----------------------------|
| receptionist_id (PK)| NUMBER          | Unique ID for receptionist |
| full_name           | VARCHAR2(100)   | Receptionist name          |
| email               | VARCHAR2(100)   | Email address              |
| phone               | VARCHAR2(15)    | Phone number               |


### **🔐UserAccount (Optional – for Login Roles)**

| **Attribute**    |**Data Type**    | **Description**                       |
|------------------|-----------------|---------------------------------------|
| user_id (PK)     | NUMBER          | Unique ID                             |
| username         | VARCHAR2(50)    | Login username                        |
| password         | VARCHAR2(100)   | Encrypted password                    |
| role             | VARCHAR2(20)    | Patient, Doctor, Receptionist         |
| reference_id (FK)| NUMBER          | Links to respective entity ID         |


## **🔗2. Relationships & Constraints**
     
| **Relationship Description**              | **Type**| **Constraints**                            |
|-------------------------------------------|---------|--------------------------------------------|
| One patient can have many appointments    | 1:M     | patient_id in Appointment is a FK, NOT NULL|
| One doctor can handle many appointments   | 1:M     | doctor_id in Appointment is a FK, NOT NULL |
| One appointment results in one examination| 1:1     | appointment_id is UNIQUE in Examination    |
| Receptionist is optional                  | N/A     | For admin actions only                     |
| UserAccount links to entity               | 1:1     | Enforced via reference_id & role combo     |


## **Constraints Examples:**

**🚫- NOT NULL:** Required fields like patient_id, full_name

**🔑- UNIQUE:** email, username

**✅- CHECK:** gender IN ('Male','Female','Other'), status IN ('Scheduled', 'Completed', 'Canceled')


## **📊3. Normalization**

- 🧱 1NF: All attributes are atomic.
- 🎯 2NF: No partial dependencies.
- 🔗 3NF: No transitive dependencies.


  ## **🔁 Normalization Summary**

✔️ All tables have been normalized to **3NF** to:

**-** Reduce redundancy 🔄

**-** Maintain data integrity 🧩

**-** Support scalable and efficient querying ⚡


## **🌍4. Handling Real-World Scenarios**

**-** A patient registering but not booking an appointment yet.

**-** Doctors handling multiple patients.

**-** Canceling appointments without losing patient data.

**-** Logging all diagnosis & prescriptions per appointment.

## 📊 ER Diagram Preview

**![ER diagram](https://github.com/user-attachments/assets/7359b0ad-e5f1-4ebf-a365-e21e0b93facd)**


# **🏥 Patient Management System - Phase 4: Database (Pluggable Database) Creation and Naming.**

## **📘INTRODUCTION**

**.** This phase focuses on the initial setup of the Oracle PL/SQL environment by creating a dedicated pluggable database tailored to the project. It involves naming the database using a standardized format, assigning administrative privileges, and securing it with proper credentials. To ensure effective oversight, Oracle Enterprise Manager (OEM) is configured to monitor database activities, providing insights into performance and resource usage throughout the development process.

## SCREENSHOT OF CREATING PDB

**![PDB CREATION](https://github.com/user-attachments/assets/2ba5db50-411d-42d5-8b2d-329f903d8f17)**

## SCREENSHOT OF OEM CREATION

**![OEM CREATION](https://github.com/user-attachments/assets/ad8e476b-1047-4775-ba07-40714581a35d)**


# **🏥 Patient Management System -📦 Phase 5: Table Implementation and Data Insertion – Patient Management System**

## **📘 Phase Overview**

**.** This phase focuses on translating the logical data model into a physical Oracle database implementation. It ensures the reliability, accuracy, and structural integrity of data to support all operations and queries defined in the system’s objectives.

# **✅ Tasks and Deliverables**

# 1. 🧱 TABLE CREATION 

## QUERY TO CREATE  PATIENT TABLE

```sql
-- PATIENT table
CREATE TABLE Patient (
    patient_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    contact_info VARCHAR2(100),
    medical_history CLOB
);
```
## **📥 DATA INSERTION IN PATIENT TABLE**

```sql
-- Insert Patients
INSERT INTO Patient VALUES (101, 'Alice Mukamana', TO_DATE('1990-05-21', 'YYYY-MM-DD'), '0788123456', 'Allergic to penicillin');
INSERT INTO Patient VALUES (102, 'John Bizimana', TO_DATE('1985-11-12', 'YYYY-MM-DD'), '0788567890', NULL);
```
## **🎞TABLE PATIENT SCREENSHOT**

**![Patient Table](https://github.com/user-attachments/assets/b3f39c86-838e-48a9-b50f-f0ae51dc5701)**

## QUERY TO CREATE  DOCTOR TABLE

```sql
-- DOCTOR table
CREATE TABLE Doctor (
    doctor_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    specialty VARCHAR2(50),
    contact_info VARCHAR2(100),
    availability VARCHAR2(50)
);
```

## **📥DATA INSERTION IN DOCTOR TABLE**

```sql
-- Insert Doctors
INSERT INTO Doctor VALUES (201, 'Dr. Emmanuel Ndayisaba', 'Cardiology', '0788987654', 'Mon-Fri');
INSERT INTO Doctor VALUES (202, 'Dr. Grace Uwase', 'Pediatrics', '0788456123', 'Tue-Sat');
```
## **🎞TABLE DOCTOR SCREENSHOT**

**![Doctor Table](https://github.com/user-attachments/assets/b5916f8d-0a59-4d03-9566-cfa9ac90e53a)**

## QUERY TO CREATE DEPARTMENT TABLE

```sql
-- DEPARTMENT table
CREATE TABLE Department (
    department_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) UNIQUE NOT NULL
);
```

## **📥DATA INSERTION IN DEPARTMENT TABLE**

```sql
-- Insert Departments
INSERT INTO Department VALUES (1, 'Cardiology');
INSERT INTO Department VALUES (2, 'Pediatrics');
```

## **🎞TABLE APPOINTMENT SCREENSHOT**

**![Appointment Table](https://github.com/user-attachments/assets/a8c010c8-e0a4-414c-b665-3ce4f3fededf)**


## QUERY TO CREATE DEPARTMENT TABLE

```sql
-- APPOINTMENT table
CREATE TABLE Appointment (
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES Patient(patient_id),
    doctor_id NUMBER REFERENCES Doctor(doctor_id),
    appointment_date DATE NOT NULL,
    appointment_time VARCHAR2(10) NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))
);
```
## **📥 DATA INSERTION IN APPOINTMENT TABLE**

```sql
-- Insert Appointments
INSERT INTO Appointment VALUES (301, 101, 201, TO_DATE('2025-05-15', 'YYYY-MM-DD'), '10:00 AM', 'Scheduled');
INSERT INTO Appointment VALUES (302, 102, 202, TO_DATE('2025-05-16', 'YYYY-MM-DD'), '02:00 PM', 'Completed');
```
## **🎞TABLE APPOINTMENT SCREENSHOT**

**![Appointment Table](https://github.com/user-attachments/assets/b4b4dc5e-6a1b-4410-8eca-30adc3fc7f6b)**

```sql
-- APPOINTMENT table
CREATE TABLE Appointment (
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES Patient(patient_id),
    doctor_id NUMBER REFERENCES Doctor(doctor_id),
    appointment_date DATE NOT NULL,
    appointment_time VARCHAR2(10) NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))
);
```
## QUERY TO CREATE  MEDICAL_RECORD TABLE
```sql
-- MEDICAL_RECORD table
CREATE TABLE Medical_Record (
    record_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES Patient(patient_id),
    doctor_id NUMBER REFERENCES Doctor(doctor_id),
    diagnosis CLOB,
    lab_results CLOB,
    treatment_plan CLOB,
    record_date DATE DEFAULT SYSDATE
);
```
## **📥DATA INSERTION IN MEDICAL_RECORD TABLE**

```sql
-- Insert Medical Records
INSERT INTO Medical_Record VALUES (401, 101, 201, 'Hypertension', 'BP: 150/90', 'Lifestyle changes and medication', SYSDATE);
INSERT INTO Medical_Record VALUES (402, 102, 202, 'Fever and cough', 'Normal CBC', 'Paracetamol and rest', SYSDATE);
```
## **🎞TABLE MEDICAL_RECORD SCREENSHOT**

**![Medical record Table](https://github.com/user-attachments/assets/a738a47e-b26b-46c6-9380-8afcafef1d0c)**

## QUERY TO CREATE PRESCRIPTION TABLE

```sql
-- PRESCRIPTION table
CREATE TABLE Prescription (
    prescription_id NUMBER PRIMARY KEY,
    record_id NUMBER REFERENCES Medical_Record(record_id),
    medication_name VARCHAR2(100),
    dosage VARCHAR2(50),
    instructions CLOB
);
```

## **📥 DATA INSERTION IN PRESCRIPTION TABLE**

```sql
-- Insert Prescriptions
INSERT INTO Prescription VALUES (501, 401, 'Lisinopril', '10mg', 'Once daily');
INSERT INTO Prescription VALUES (502, 402, 'Paracetamol', '500mg', 'Three times a day after meals');
```

## **🎞TABLE  PRESCRIPTION SCREENSHOT**

**![Prescription Table](https://github.com/user-attachments/assets/09b44036-07a1-45de-90aa-3fe123012afa)**


## QUERY TO CREATE BILLING TABLE

```sql
-- BILLING table
CREATE TABLE Billing (
    billing_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES Patient(patient_id),
    appointment_id NUMBER REFERENCES Appointment(appointment_id),
    amount NUMBER(10, 2),
    status VARCHAR2(20) CHECK (status IN ('Paid', 'Pending', 'Insurance')),
    payment_date DATE
);
```

## **📥 DATA INSERTION IN BILLING TABLE**

```sql
-- Insert Billing
INSERT INTO Billing VALUES (601, 101, 301, 25000.00, 'Pending', NULL);
INSERT INTO Billing VALUES (602, 102, 302, 15000.00, 'Paid', TO_DATE('2025-05-12', 'YYYY-MM-DD'));
```
## **🎞TABLE  BILLING SCREENSHOT**

**![Billing Table](https://github.com/user-attachments/assets/fd413182-e095-4c51-a15d-83b3fdb633d8)**

## **2. 📥 Data Insertion**

**.** Realistic and meaningful sample data was inserted to simulate hospital operations.

This data covers typical scenarios such as:

**✔** Booking patient appointments

**✔** Storing medical records and prescriptions

**✔** Processing billing transactions

**✔** Associating doctors with departments

## **3. 🔐 Data Integrity**
To ensure high data quality and operational support:

**Primary Keys:** Defined on all major entities (e.g., patient_id, doctor_id, appointment_id)

**Foreign Keys:** Ensure referential integrity between related tables (e.g., appointment → patient, prescription → medical_record)

## **Constraints:**

**.** **NOT NUL** on mandatory fields (e.g., full_name, date_of_birth)

**.** **UNIQUE** on fields like department name

**.** **CHECK** constraints on status fields to restrict allowed values:

```sql
CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))
```

## 4. 🏗️ Physical Database Structure

## 🔹 a. Creating Tables with Appropriate Columns and Data Types

### 📊 Entity Table Overview

| **Entity**        | **Columns & Data Types (Examples)**                                                        |
|-------------------|--------------------------------------------------------------------------------------------|
| **Patient**       | `patient_id NUMBER`, `full_name VARCHAR2(100)`, `date_of_birth DATE`                       |
| **Doctor**        | `doctor_id NUMBER`, `specialty VARCHAR2(50)`, `availability VARCHAR2(50)`                  |
| **Appointment**   | `appointment_id NUMBER`, `appointment_date DATE`, `status VARCHAR2(20)`                    |
| **Billing**       | `amount NUMBER(10,2)`, `status VARCHAR2(20)`, `payment_date DATE`                          |
| **Medical_Record**| `CLOB` for long text fields such as `diagnosis`, `lab_results`, `treatments`, `notes`,..|



## **🔹 b. Defining Primary Keys and Foreign Keys**

All tables include primary keys and necessary foreign key constraints:

## **Primary Keys:**

**.** Patient(patient_id)

**.** Doctor(doctor_id)

**.** Appointment(appointment_id)

**.** Medical_Record(record_id)

**.** Prescription(prescription_id)

**.** Billing(billing_id)

**.** Department(department_id)

## **Foreign Keys:**

**✔** Appointment.patient_id → Patient.patient_id

**✔** Appointment.doctor_id → Doctor.doctor_id

**✔** Medical_Record.patient_id → Patient.patient_id

**✔** Medical_Record.doctor_id → Doctor.doctor_id

**✔** Prescription.record_id → Medical_Record.record_id

**✔** Billing.patient_id → Patient.patient_id

**✔** Billing.appointment_id → Appointment.appointment_id

The following physical structure was implemented:

✅ Tables with precise column definitions and relationships

✅ Primary key and foreign key constraints

✅ Indexes for efficient querying (recommended on foreign keys)

✅ Constraints to enforce data rules

## **🔹 c. Creating Indexes (where necessary)**
While Oracle automatically creates indexes on primary keys, if needed for performance, we can add indexes on foreign key columns manually:

```sql

CREATE INDEX idx_appointment_patient ON Appointment(patient_id);
CREATE INDEX idx_appointment_doctor ON Appointment(doctor_id);
CREATE INDEX idx_billing_appointment ON Billing(appointment_id);
```

## SCREENSHOT(INDEX CREATION)

![INDEX CREATION](https://github.com/user-attachments/assets/cf0b9c60-53c0-4b67-ae49-3841e41b3da7)

## 🔹 d. Setting Constraints (NOT NULL, UNIQUE, CHECK)

**.** **NOT NULL:** Used for essential fields like full_name, date_of_birth, appointment_date.

**.** **UNIQUE:** Enforced on Department.name to prevent duplicates.

**.** **CHECK:**  Used for validation of column values:

```sql

CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))  -- For Appointment
CHECK (status IN ('Paid', 'Pending', 'Insurance'))          -- For Billing
```

## Testing & Verification

The inserted data was verified using basic SELECT queries and join operations to ensure:

Appointments are correctly linked to patients and doctors

Billing entries reflect actual appointments

Medical records and prescriptions are accurately stored and related





# **🏥 Patient Management System -📦 Phase 6: Database Interaction and Transactions – Implementation Guide**

## Introduction

This phase is about executing meaningful interactions with the database using PL/SQL procedures, functions, packages, DML/DDL commands, cursors, 
and exception handling.

## 🛠️ 1. Database Operations (DML and DDL)

✅ Example DDL Operations:

```sql

-- Altering a table to add a new column

ALTER TABLE Patient ADD emergency_contact VARCHAR2(20);

-- Dropping an unused column

ALTER TABLE Appointment DROP COLUMN comments;
```

✅ Example DML Operations:

```sql

-- Insert
INSERT INTO Department (department_id, name) VALUES (1, 'Cardiology');

-- Update
UPDATE Patient SET phone = '0788888888' WHERE patient_id = 101;

-- Delete
DELETE FROM Prescription WHERE prescription_id = 5;
```

## 2. 📌 Task Requirements

## 🧩 Define a Simple Problem Statement:

**>** "We want to analyze how many appointments each doctor has completed in a given time period and rank them using window functions."

This is useful for department heads to evaluate doctor performance.

## 👇 Grouping Opportunities:
We will group by doctor and use RANK() or DENSE_RANK() on the number of appointments completed.

## 3. ⚙️ Procedures and Functions
✅ Procedure: Fetch Appointments By Doctor (With Cursors)
```sql
CREATE OR REPLACE PROCEDURE get_doctor_appointments (
    p_doctor_id IN NUMBER
) IS
    CURSOR appt_cursor IS
        SELECT a.appointment_id, a.appointment_date, a.status
        FROM Appointment a
        WHERE a.doctor_id = p_doctor_id;
    
    appt_record appt_cursor%ROWTYPE;
BEGIN
    OPEN appt_cursor;
    LOOP
        FETCH appt_cursor INTO appt_record;
        EXIT WHEN appt_cursor%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Appointment: ' || appt_record.appointment_id || 
                             ', Date: ' || appt_record.appointment_date || 
                             ', Status: ' || appt_record.status);
    END LOOP;
    CLOSE appt_cursor;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
END;
```
## ✅ Function: Count Appointments per Patient

```sql

CREATE OR REPLACE FUNCTION count_appointments (
    p_patient_id IN NUMBER
) RETURN NUMBER IS
    v_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Appointment
    WHERE patient_id = p_patient_id;
    RETURN v_count;
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        RETURN 0;
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
        RETURN -1;
END;
```

## 4. 📦 Apply Packages

## ✅ Package Specification:
```sql

CREATE OR REPLACE PACKAGE hospital_pkg IS
    PROCEDURE get_doctor_appointments(p_doctor_id IN NUMBER);
    FUNCTION count_appointments(p_patient_id IN NUMBER) RETURN NUMBER;
END hospital_pkg;

```
## ✅ Package Body:

```sql

CREATE OR REPLACE PACKAGE BODY hospital_pkg IS

    PROCEDURE get_doctor_appointments(p_doctor_id IN NUMBER) IS
        CURSOR appt_cursor IS
            SELECT appointment_id, appointment_date, status
            FROM Appointment
            WHERE doctor_id = p_doctor_id;

        appt_record appt_cursor%ROWTYPE;
    BEGIN
        OPEN appt_cursor;
        LOOP
            FETCH appt_cursor INTO appt_record;
            EXIT WHEN appt_cursor%NOTFOUND;
            DBMS_OUTPUT.PUT_LINE('Appointment: ' || appt_record.appointment_id || 
                                 ', Date: ' || appt_record.appointment_date || 
                                 ', Status: ' || appt_record.status);
        END LOOP;
        CLOSE appt_cursor;
    EXCEPTION
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
    END;

    FUNCTION count_appointments(p_patient_id IN NUMBER) RETURN NUMBER IS
        v_count NUMBER;
    BEGIN
        SELECT COUNT(*) INTO v_count
        FROM Appointment
        WHERE patient_id = p_patient_id;
        RETURN v_count;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
            RETURN 0;
        WHEN OTHERS THEN
            DBMS_OUTPUT.PUT_LINE('Error: ' || SQLERRM);
            RETURN -1;
    END;

END hospital_pkg;
```

## 5. 🧪 Testing Examples
```sql
-- Test the procedure
BEGIN
    hospital_pkg.get_doctor_appointments(2);
END;
/

-- Test the function
DECLARE
    total_appointments NUMBER;
BEGIN
    total_appointments := hospital_pkg.count_appointments(101);
    DBMS_OUTPUT.PUT_LINE('Total: ' || total_appointments);
END;
/
```


# **🏥 Patient Management System -📘 Phase 7: Advanced Database Programming and Auditing**

## **🎯 Objective**

This phase focuses on improving the functionality, automation, and security of the Patient Management System by using advanced PL/SQL techniques such as triggers, packages, functions, and auditing mechanisms.

## **📝 Problem Statement**

**>** Hospitals handle highly sensitive and time-critical data. To ensure accountability, prevent unauthorized manipulation, and enforce business rules, the system needs:

Automatic restrictions on when and how data can be modified.

Audit tracking of every action by users.

Modular code for reusable database logic.

## **🔐 Key Requirement:**
Block employees from performing any data manipulation (INSERT, UPDATE, DELETE) on weekdays (Monday to Friday) and public holidays for the upcoming month.

## **📌 Tasks and Deliverables**

## ✅ 1. Restriction Rule (Business Logic)
Manipulation Restriction:

No INSERT, UPDATE, DELETE on weekdays (Monday to Friday).

Block activity on public holidays.

Reference Holiday Table created to store holiday dates for the upcoming month.

## ✅ 2. Trigger Implementation

### 📂 holiday_dates Table

```sql

CREATE TABLE holiday_dates (
    holiday_date DATE PRIMARY KEY,
    description VARCHAR2(100)
);
```

### 🗓 Sample Holiday Entries

```sql

INSERT INTO holiday_dates VALUES (TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'National Heroes Day');
INSERT INTO holiday_dates VALUES (TO_DATE('2025-06-15', 'YYYY-MM-DD'), 'Medical Staff Appreciation Day');
```

## 🔁 Restriction Trigger on patients Table

```sql

CREATE OR REPLACE TRIGGER restrict_weekday_holiday_activity
BEFORE INSERT OR UPDATE OR DELETE ON patients
FOR EACH ROW
DECLARE
    v_today DATE := SYSDATE;
    v_day VARCHAR2(10);
    v_is_holiday NUMBER;
BEGIN
    SELECT TO_CHAR(v_today, 'DY') INTO v_day FROM dual;

    IF v_day IN ('MON', 'TUE', 'WED', 'THU', 'FRI') THEN
        RAISE_APPLICATION_ERROR(-20001, 'Modifications are not allowed on weekdays.');
    END IF;

    SELECT COUNT(*) INTO v_is_holiday
    FROM holiday_dates
    WHERE holiday_date = TRUNC(v_today);

    IF v_is_holiday > 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Modifications are not allowed on public holidays.');
    END IF;
END;
```

## ✅ 3. Auditing System

## 🧾 audit_log Table

```sql

CREATE TABLE audit_log (
    audit_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    user_id VARCHAR2(50),
    action_date TIMESTAMP DEFAULT SYSTIMESTAMP,
    operation_type VARCHAR2(20),
    status VARCHAR2(10)
);
```


## ✅ 4. PL/SQL Function for Audit Logging

```sql

CREATE OR REPLACE FUNCTION log_audit(
    p_user_id VARCHAR2,
    p_operation_type VARCHAR2,
    p_status VARCHAR2
) RETURN NUMBER IS
BEGIN
    INSERT INTO audit_log (user_id, operation_type, status)
    VALUES (p_user_id, p_operation_type, p_status);
    RETURN 1;
END;
```

## ✅ 5. Package for Reusable Audit Logging

## 📦 Package Specification

```sql
CREATE OR REPLACE PACKAGE audit_pkg AS
    PROCEDURE log_action(p_user_id VARCHAR2, p_operation_type VARCHAR2, p_status VARCHAR2);
END;
```

## 📦 Package Body

```sql

CREATE OR REPLACE PACKAGE BODY audit_pkg AS
    PROCEDURE log_action(p_user_id VARCHAR2, p_operation_type VARCHAR2, p_status VARCHAR2) IS
    BEGIN
        INSERT INTO audit_log (user_id, operation_type, status)
        VALUES (p_user_id, p_operation_type, p_status);
    END;
END;
```

## **🔐 Security and Integrity Benefits**

| **Feature**            | **Purpose**                                                            |
| ---------------------- | ---------------------------------------------------------------------- |
| **Triggers**           | Automatically restrict unsafe modifications during specific timeframes |
| **Holiday Validation** | Prevents tampering during official holidays                            |
| **Audit Logging**      | Captures all sensitive operations with user traceability               |
| **PL/SQL Package**     | Promotes modular, reusable audit handling logic                        |


## Feature	Purpose

Triggers	Automatically restrict unsafe modifications during specific timeframes
Holiday Validation	Prevents tampering during official holidays
Audit Logging	Captures all sensitive operations with user traceability
PL/SQL Package	Promotes modular, reusable audit handling logic

## **✅ Testing Summary**

✅ Functional Highlights

**.** 🔒 Attempted manipulation on a weekday → Blocked with an error via trigger.

**.🛑** Manipulation on a holiday → Prevented using holiday validation trigger logic.

**.** 📋 Audit entries generated on each action → Logged in the audit_log table with user ID, operation, and status.

**.** 🧪 audit_pkg.log_action() → Successfully tested independently to verify modular functionality.


## **📚 Conclusion**

This phase reinforces:

🔐 Secure and Audit-Ready System

**🛂** Controlled Access
Only authorized data manipulations are allowed — weekday and holiday restrictions are strictly enforced.

**👁️** Transparent Monitoring
Every sensitive action is tracked and stored in the audit log, ensuring accountability.

**⚙️** Automated Rule Enforcement
Rules are enforced automatically using robust PL/SQL triggers, functions, and packages.

**✅** Result:

Through PL/SQL triggers, functions, and packages, the system is now audit-ready and significantly more secure — aligning with best practices and real-world healthcare deployment standards.
