-- CREATION OF PDB AND USER

CREATE PLUGGABLE DATABASE tues_26596_bajiji_patient_management_db
   2 ADMIN USER bajiji IDENTIFIED BY bajiji
   3 FILE_NAME_CONVERT=('C:\ORACLE21\ORADATA\ORCL\PDBseed\','C:\ORACLE21\ORADATA\ORC\tues_26596_bajiji_patient_management_db');
   
   Pluggable database created.



alter pluggable database tues_26596_bajiji_patient_management OPEN;
pluggable database altered.


SQL> alter pluggable database tues_26596_bajiji_patient_management save state;

Pluggable database altered.


SQL> alter session set container =tues_26596_bajiji_patient_management_db;




SQL> create user bajiji identified by bajiji;


 SQL> grant all privileges to bajiji;

-- QUERIES TO CREATE DATABASE TABLE

CREATE TABLE Patient (
    patient_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    date_of_birth DATE NOT NULL,
    contact_info VARCHAR2(100),
    medical_history CLOB
);


Insert Patients
INSERT INTO Patient VALUES (101, 'Alice Mukamana', TO_DATE('1990-05-21', 'YYYY-MM-DD'), '0788123456', 'Allergic to penicillin');
INSERT INTO Patient VALUES (102, 'John Bizimana', TO_DATE('1985-11-12', 'YYYY-MM-DD'), '0788567890', NULL);


CREATE TABLE Doctor (
    doctor_id NUMBER PRIMARY KEY,
    full_name VARCHAR2(100) NOT NULL,
    specialty VARCHAR2(50),
    contact_info VARCHAR2(100),
    availability VARCHAR2(50)
);



INSERT INTO Doctor VALUES (201, 'Dr. Emmanuel Ndayisaba', 'Cardiology', '0788987654', 'Mon-Fri');
INSERT INTO Doctor VALUES (202, 'Dr. Grace Uwase', 'Pediatrics', '0788456123', 'Tue-Sat');



CREATE TABLE Department (
    department_id NUMBER PRIMARY KEY,
    name VARCHAR2(100) UNIQUE NOT NULL
);



INSERT INTO Department VALUES (1, 'Cardiology');
INSERT INTO Department VALUES (2, 'Pediatrics');




CREATE TABLE Appointment (
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES Patient(patient_id),
    doctor_id NUMBER REFERENCES Doctor(doctor_id),
    appointment_date DATE NOT NULL,
    appointment_time VARCHAR2(10) NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))
);



INSERT INTO Appointment VALUES (301, 101, 201, TO_DATE('2025-05-15', 'YYYY-MM-DD'), '10:00 AM', 'Scheduled');
INSERT INTO Appointment VALUES (302, 102, 202, TO_DATE('2025-05-16', 'YYYY-MM-DD'), '02:00 PM', 'Completed');




CREATE TABLE Appointment (
    appointment_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES Patient(patient_id),
    doctor_id NUMBER REFERENCES Doctor(doctor_id),
    appointment_date DATE NOT NULL,
    appointment_time VARCHAR2(10) NOT NULL,
    status VARCHAR2(20) CHECK (status IN ('Scheduled', 'Completed', 'Cancelled'))
);



CREATE TABLE Medical_Record (
    record_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES Patient(patient_id),
    doctor_id NUMBER REFERENCES Doctor(doctor_id),
    diagnosis CLOB,
    lab_results CLOB,
    treatment_plan CLOB,
    record_date DATE DEFAULT SYSDATE
);





INSERT INTO Medical_Record VALUES (401, 101, 201, 'Hypertension', 'BP: 150/90', 'Lifestyle changes and medication', SYSDATE);
INSERT INTO Medical_Record VALUES (402, 102, 202, 'Fever and cough', 'Normal CBC', 'Paracetamol and rest', SYSDATE);



CREATE TABLE Prescription (
    prescription_id NUMBER PRIMARY KEY,
    record_id NUMBER REFERENCES Medical_Record(record_id),
    medication_name VARCHAR2(100),
    dosage VARCHAR2(50),
    instructions CLOB
);




INSERT INTO Prescription VALUES (501, 401, 'Lisinopril', '10mg', 'Once daily');
INSERT INTO Prescription VALUES (502, 402, 'Paracetamol', '500mg', 'Three times a day after meals');



CREATE TABLE Billing (
    billing_id NUMBER PRIMARY KEY,
    patient_id NUMBER REFERENCES Patient(patient_id),
    appointment_id NUMBER REFERENCES Appointment(appointment_id),
    amount NUMBER(10, 2),
    status VARCHAR2(20) CHECK (status IN ('Paid', 'Pending', 'Insurance')),
    payment_date DATE
);




INSERT INTO Billing VALUES (601, 101, 301, 25000.00, 'Pending', NULL);
INSERT INTO Billing VALUES (602, 102, 302, 15000.00, 'Paid', TO_DATE('2025-05-12', 'YYYY-MM-DD'));

-- QUERIES TO CREATE INDEX

CREATE INDEX idx_appointment_patient ON Appointment(patient_id);
CREATE INDEX idx_appointment_doctor ON Appointment(doctor_id);
CREATE INDEX idx_billing_appointment ON Billing(appointment_id);


ALTER TABLE Patient ADD emergency_contact VARCHAR2(20);


INSERT INTO Department (department_id, name) VALUES (1, 'Cardiology');


UPDATE Patient SET phone = '0788888888' WHERE patient_id = 101;

DELETE FROM Prescription WHERE prescription_id = 5;

-- QUERIES TO CREATE PROCEDURE

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


-- QUERIES TO CREATE FUNCTIONS

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

-- QUERIES TO CREATE PACKAGE

CREATE OR REPLACE PACKAGE hospital_pkg IS
    PROCEDURE get_doctor_appointments(p_doctor_id IN NUMBER);
    FUNCTION count_appointments(p_patient_id IN NUMBER) RETURN NUMBER;
END hospital_pkg;






-- QUERIES TO CREATE PACKAGE BODY

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



-- QUERRY TO TEST A PACKAGE
BEGIN
    hospital_pkg.get_doctor_appointments(2);
END;




DECLARE
    total_appointments NUMBER;
BEGIN
    total_appointments := hospital_pkg.count_appointments(101);
    DBMS_OUTPUT.PUT_LINE('Total: ' || total_appointments);
END;
/



CREATE TABLE holiday_dates (
    holiday_date DATE PRIMARY KEY,
    description VARCHAR2(100)
);


INSERT INTO holiday_dates VALUES (TO_DATE('2025-06-01', 'YYYY-MM-DD'), 'National Heroes Day');
INSERT INTO holiday_dates VALUES (TO_DATE('2025-06-15', 'YYYY-MM-DD'), 'Medical Staff Appreciation Day');


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






CREATE TABLE audit_log (
    audit_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    user_id VARCHAR2(50),
    action_date TIMESTAMP DEFAULT SYSTIMESTAMP,
    operation_type VARCHAR2(20),
    status VARCHAR2(10)
);



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







CREATE OR REPLACE PACKAGE BODY audit_pkg AS
    PROCEDURE log_action(p_user_id VARCHAR2, p_operation_type VARCHAR2, p_status VARCHAR2) IS
    BEGIN
        INSERT INTO audit_log (user_id, operation_type, status)
        VALUES (p_user_id, p_operation_type, p_status);
    END;
END;


COMMIT;



ROLLBACK;

