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

![ER diagram](https://github.com/user-attachments/assets/7359b0ad-e5f1-4ebf-a365-e21e0b93facd)


# **🏥 Patient Management System - Phase 4: Database (Pluggable Database) Creation and Naming.**



# **🏥 Patient Management System -📦 Phase 5: Table Implementation and Data Insertion – Patient Management System**
📘 Phase Overview
This phase focuses on translating the logical data model into a physical Oracle database implementation. It ensures the reliability, accuracy, and structural integrity of data to support all operations and queries defined in the system’s objectives.

# **✅ Tasks and Deliverables**
## 1. 🧱 Table Creation
The logical design has been implemented by creating all necessary tables in Oracle SQL.

Tables align with the system's core entities such as:

Patient

Doctor

Appointment

Medical_Record

Prescription

Billing

Department

Each table is structured with appropriate column names and data types (e.g., VARCHAR2, NUMBER, DATE, CLOB).

## 2. 📥 Data Insertion
Realistic and meaningful sample data was inserted to simulate hospital operations.

This data covers typical scenarios such as:

Booking patient appointments

Storing medical records and prescriptions

Processing billing transactions

Associating doctors with departments

## 3. 🔐 Data Integrity
To ensure high data quality and operational support:

Primary Keys: Defined on all major entities (e.g., patient_id, doctor_id, appointment_id)

Foreign Keys: Ensure referential integrity between related tables (e.g., appointment → patient, prescription → medical_record)

## Constraints:

**NOT NUL** on mandatory fields (e.g., full_name, date_of_birth)

**UNIQUE** on fields like department name

**CHECK** constraints on status fields to restrict allowed values:

```sql
CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))
```

## 4. 🏗️ Physical Database Structure

The following physical structure was implemented:

✅ Tables with precise column definitions and relationships

✅ Primary key and foreign key constraints

✅ Indexes for efficient querying (recommended on foreign keys)

✅ Constraints to enforce data rules

## Testing & Verification

The inserted data was verified using basic SELECT queries and join operations to ensure:

Appointments are correctly linked to patients and doctors

Billing entries reflect actual appointments

Medical records and prescriptions are accurately stored and related





# ✅ PHASE VI: Database Interaction and Transactions – Implementation Guide
This phase is about executing meaningful interactions with the database using PL/SQL procedures, functions, packages, DML/DDL commands, cursors, and exception handling.

## 1. 🔧 Database Operations (DML and DDL)
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
"We want to analyze how many appointments each doctor has completed in a given time period and rank them using window functions."

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


