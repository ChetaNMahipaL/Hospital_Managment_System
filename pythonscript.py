import subprocess as sp
import pymysql
import pymysql.cursors

#laptop password abh!7704

def option1_doc():
    tmp = sp.call('clear', shell=True)

    try:
        row = {}
        print("Enter new doctor's details: ")
        row["Doctor_ID"] = int(input("Doctor ID: "))
        name = (input("Name (Fname Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Lname"] = name[1]
        row["DOB"] = input("Birth Date (YYYY-MM-DD): ")
        row["Gender"] = input("Gender: ")
        row["Mobile"] = int(input("Mobile: "))
        row["Salary"] = int(input("Salary: "))
        row["Av_Days"] = input("Available Days: ")
        row["Works_For"] = input("Works_For: ")
        row["Supervisor_Id"] = int(input("Supervisor_Id: "))

        #multivalued attributes
        deg={}
        deg["Degree"] = input("Degrees (comma separated): ")

        exp={}
        exp["Expertise"] = input("Expertise (comma separated): ")

        query = "INSERT INTO Doctor(Doctor_ID, Fname, Lname, DOB, Gender, Mobile, Salary, Av_Day, Works_For, Supervisor_ID) VALUES('%d', '%s', '%s', '%s', '%s', '%d', '%d', '%s', '%s', '%d')" % (
            row["Doctor_ID"], row["Fname"], row["Lname"], row["DOB"], row["Gender"], row["Mobile"], row["Salary"], row["Av_Days"], row["Works_For"], row["Supervisor_Id"])

        # print(query)
        cur.execute(query)
        con.commit()

        #inserting into multivalued attributes
        #break deg{} and exp{} into multiple values and insert each of them into the respective tables
        deg = deg["Degree"].split(',')
        exp = exp["Expertise"].split(',')
        for i in range(len(deg)):
            deg[i] = deg[i].strip()
            query = "INSERT INTO Doc_Degree(Doctor_ID, Degree) VALUES('%d', '%s')" % (
                row["Doctor_ID"], deg[i])
            
            cur.execute(query)
            con.commit()
            
        for i in range(len(exp)):
            exp[i] = exp[i].strip()
            query = "INSERT INTO Doc_Expert(Doctor_ID, Expertise) VALUES('%d', '%s')" % (
                row["Doctor_ID"], exp[i])     

            cur.execute(query)
            con.commit()    
        # query = "INSERT INTO Doc_Degree(Doctor_ID, Degree) VALUES('%d', '%s')" % (
        #     row["Doctor_ID"], deg["Degree"])
        
        # cur.execute(query)
        # con.commit()
        # query = "INSERT INTO Doc_Expert(Doctor_ID, Expertise) VALUES('%d', '%s')" % (
        #     row["Doctor_ID"], exp["Expertise"])     

        # cur.execute(query)
        # con.commit() 

        query = "Update Department SET Medic_cnt = Medic_cnt + 1 WHERE Name = '%s'" % (
            row["Works_For"])

        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("Error", e)

    return

def option1_pat():
    tmp = sp.call('clear', shell=True)

    try:
        row = {}
        print("Enter new patient's details: ")
        row["Patient_ID"] = int(input("Patient ID: "))
        name = (input("Name (Fname Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Lname"] = name[1]
        row["DOB"] = input("Birth Date (YYYY-MM-DD): ")
        row["Gender"] = input("Gender: ")
        row["Mobile"] = int(input("Mobile: "))
        row["Room_No"] = int(input("Room Number: "))
        row["Bill_Status"] = int(input("Status of Bill: "))
        row["Ailment"] = input("Ailment: ")
        dependent = (input("Name (Dep_Fname Dep_Lname): ")).split(' ')
        row["Dep_Fname"] = dependent[0]
        row["Dep_Lname"] =dependent[1]
        row["Dep_DOB"] = input("Dependent's Birth Date (YYYY-MM-DD): ")
        row["Dep_Gender"] = input("Dependent's gender: ")
        row["Dep_Mobile"] = int(input("Dependent's mobile: "))
        query = "INSERT INTO Patient(Patient_ID, Fname, Lname, DOB, Gender, Mobile, Room_No, Bill_Status) VALUES('%d', '%s', '%s', '%s', '%s', '%d', '%d', '%d')" % (
            row["Patient_ID"], row["Fname"], row["Lname"], row["DOB"], row["Gender"], row["Mobile"], row["Room_No"], row["Bill_Status"])

        # print(query)
        cur.execute(query)
        con.commit()

        query = "INSERT INTO Patient_Ailment(Patient_ID, Ailment) VALUES('%d', '%s')" % (
            row["Patient_ID"], row["Ailment"])
        
        cur.execute(query)
        con.commit()

        query = "INSERT INTO Dependents(Fname, Lname, DOB, Gender, Mobile, Dependent_of) VALUES('%s', '%s', '%s', '%s', '%d', '%d')" % (
            row["Dep_Fname"], row["Dep_Lname"], row["Dep_DOB"], row["Dep_Gender"], row["Dep_Mobile"], row["Patient_ID"])

        # print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("Error", e)

    return

def option1_dir():
    tmp = sp.call('clear', shell=True)

    try:
        row = {}
        print("Enter new director's details: ")
        row["Employee_ID"] = int(input("Employee_ID: "))
        name = (input("Name (Fname Lname): ")).split(' ')
        row["Fname"] = name[0]
        row["Lname"] = name[1]
        row["DOB"] = input("Birth Date (YYYY-MM-DD): ")
        row["Gender"] = input("Gender: ")
        row["Mobile"] = int(input("Mobile: "))
        row["Addr"] = input("Address: ")
        row["Position"] = input("Position: ")
        row["Salary"] = int(input("Salary: "))
        row["Assesses"] = input("Department Assessed: ")

        query = "INSERT INTO Director(Employee_ID, Fname, Lname, DOB, Gender, Mobile, Addr, Position, Salary, Assesses) VALUES('%d', '%s', '%s', '%s', '%s', '%d', '%s', '%s', '%d', '%s')" % (
            row["Employee_ID"], row["Fname"], row["Lname"], row["DOB"], row["Gender"], row["Mobile"], row["Addr"], row["Position"], row["Salary"], row["Assesses"])

        # print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("Error", e)

    return

def option1_eq():
    tmp = sp.call('clear', shell=True)

    try:
        row = {}
        print("Enter new equipment's details: ")
        row["Generic_Name"] = input("Generic Name: ")
        row["Model"] = input("Model: ")
        row["Price"] = int(input("Price: "))
        row["Procurement_Date"] = input("Procurement_Date (YYYY-MM-DD): ")
        row["Procured_By"] = input("Procured By: ")

        query = "INSERT INTO Equipment(Generic_Name, Model, Price, Procurement_Date, Procured_By) VALUES('%s', '%s', '%d', '%s', '%s')" % (
            row["Generic_Name"], row["Model"], row["Price"], row["Procurement_Date"], row["Procured_By"])

        # print(query)
        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("Error", e)

    return

def option1_treat():
    tmp = sp.call('clear', shell=True)
    try:
        row={}
        print("Enter new treatment's details: ")
        row["T_ID"] = int(input("Treatment ID: "))
        row["Fee"] = int(input("Fee: "))
        row["Medicines"] = input("Medicines: ")
        row["Visit_Time"] = input("Visit Time: ")
        row["Visit_Date"] = input("Visit Date (YYYY-MM-DD): ")
        row["P_ID"] = int(input("Patient ID: "))
        row["D_ID"] = int(input("Doctor ID: "))
        row["Gen_Name"] = input("Generic Name of Equipment: ")
        row["Model"] = input("Model of Equipment: ")

        query = "INSERT INTO Treatment(Treatment_ID, Fee, Medicines, Visit_Time, Visit_Date) VALUES('%d', '%d', '%s', '%s', '%s')" % (
            row["T_ID"], row["Fee"], row["Medicines"], row["Visit_Time"], row["Visit_Date"])

        # print(query)
        cur.execute(query)
        con.commit()

        query = "INSERT INTO Treats(P_ID, D_ID, T_ID) VALUES('%d', '%d', '%d')" % (
            row["P_ID"], row["D_ID"], row["T_ID"])

        cur.execute(query)
        con.commit()

        query = "INSERT INTO Utilizes(Gen_Name, Model, T_ID, Doc_ID) VALUES('%s', '%s', %d, %d)" % (
            row["Gen_Name"], row["Model"], row["T_ID"], row["D_ID"])

        cur.execute(query)
        con.commit()

        print("Inserted Into Database")

    except Exception as e:
        con.rollback()
        print("Failed to insert into database")
        print("Error", e)


def option3_dir():
    tmp = sp.call('clear', shell=True)

    try:
        row = {}
        print("Enter director's Id: ")
        row["Employee_ID"] = int(input("Employee_ID: "))

        query = "DELETE FROM Director WHERE Employee_ID = ('%d')" % (
            row["Employee_ID"])

        # print(query)
        cur.execute(query)
        con.commit() 

        print("Deleted From Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print("Error", e)

    return

def option3_nur():
    tmp = sp.call('clear', shell=True)

    try:
        row = {}
        print("Enter Attendant's Id: ")
        row["Staff_ID"] = int(input("Staff_ID: "))

        query = "DELETE FROM Attendant WHERE Staff_ID = ('%d')" % (
            row["Staff_ID"])

        # print(query)
        cur.execute(query)
        con.commit() 

        print("Deleted From Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print("Error", e)

    return

def option3_doc():
    tmp = sp.call('clear', shell=True)

    try:
        row = {}
        print("Enter doctor's Id: ")
        row["Doctor_ID"] = int(input("Doctor ID: "))

        query = "SELECT Works_For FROM Doctor WHERE Doctor_ID = ('%d')" % (
            row["Doctor_ID"])
        cur.execute(query)
        result = cur.fetchone()

        query = "DELETE FROM Doctor WHERE Doctor_ID = ('%d')" % (
            row["Doctor_ID"])

        # print(query)
        cur.execute(query)
        con.commit() 

        query = "Update Department SET Medic_cnt = Medic_cnt - 1 WHERE Name = '%s'" % (
            result["Works_For"])

        cur.execute(query)
        con.commit()

        print("Deleted From Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print("Error", e)

    return

def option3_eq():
    tmp = sp.call('clear', shell=True)

    try:
        row = {}
        print("Enter equipment's generic name: ")
        row["Generic_Name"] = input("Generic Name: ")
        row["Model"] = input("Model: ")

        query = "DELETE FROM Equipment WHERE Generic_Name = ('%s') AND Model = ('%s')" % (
            row["Generic_Name"], row["Model"])

        # print(query)
        cur.execute(query)
        con.commit() 

        print("Deleted From Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print("Error", e)

    return

def analysis_count():
    try:
        start_date = input("Enter the start date (YYYY-MM-DD): ")
        end_date = input("Enter the end date (YYYY-MM-DD): ")

        query_analysis = f"SELECT COUNT(*) AS TreatmentCount " \
                         f"FROM Treatment " \
                         f"WHERE Visit_Date BETWEEN '{start_date}' AND '{end_date}'"

        cur.execute(query_analysis)
        result = cur.fetchone()

        if result:
            treatment_count = result['TreatmentCount']
            print(f"Number of treatments administered between {start_date} and {end_date}: {treatment_count}")
        else:
            print(f"No treatments found between {start_date} and {end_date}")

    except Exception as e:
        print("Failed to perform analysis on treatments")
        print("Error:", e)
        con.rollback()

def analysis_k_patients():
    try:
        k = int(input("Enter the value of 'k': "))
        
        query_analysis = f"SELECT P.Fname, P.Lname, COUNT(T.T_ID) AS VisitsCount " \
                         f"FROM Patient P " \
                         f"JOIN Treats T ON P.Patient_ID = T.P_ID " \
                         f"GROUP BY P.Patient_ID " \
                         f"HAVING VisitsCount > {k}"

        cur.execute(query_analysis)
        results = cur.fetchall()

        if results:
            print(f"Patients who have made visits to the hospital exceeding {k} times:")
            for result in results:
                print(f"Name: {result['Fname']} {result['Lname']}, Visits Count: {result['VisitsCount']}")
        else:
            print(f"No patients found with visits exceeding {k} times")

    except Exception as e:
        print("Failed to perform analysis on patients")
        print("Error:", e)
        con.rollback()

def projection_av_day():
    try:
        query_projection = "SELECT Fname, Lname, Av_Day FROM Doctor"
        cur.execute(query_projection)
        results = cur.fetchall()

        if results:
            print("Projection of Available Days for each Doctor:")
            for result in results:
                print(f"Name: {result['Fname']} {result['Lname']}")
                print(f"Av_Day: {result['Av_Day']}")
                print()
        else:
            print("No data found for the projection")

    except Exception as e:
        print("Failed to retrieve doctor data")
        print("Error:", e)
        con.rollback()

def projection_department_equipment():
    try:
        query_projection = "SELECT D.Name, E.Generic_Name, E.Model FROM Department D JOIN Equipment E ON D.Name = E.Procured_By ORDER BY D.Name"
        cur.execute(query_projection)
        results = cur.fetchall()

        if results:
            current_department = None
            print("Projection of Generic_Name and Model of equipment categorized by their respective Departments:")
            for result in results:
                if result['Name'] != current_department:
                    if current_department is not None:
                        print()  
                    current_department = result['Name']
                    print(f"Department: {current_department}")
                print(f"Generic_Name: {result['Generic_Name']}, Model: {result['Model']}")
        else:
            print("No data found for the projection")

    except Exception as e:
        print("Failed to retrieve doctor data")
        print("Error:", e)
        con.rollback()

def print_doctors_by_available_day():
    try:
        input_day = input("Enter the Day: ")

        query_doctors = f"SELECT Fname, Lname FROM Doctor WHERE FIND_IN_SET('{input_day}', Av_Day)"
        cur.execute(query_doctors)
        doctors = cur.fetchall()

        if doctors:
            print(f"Doctors available on {input_day}:")
            for doctor in doctors:
                print(f"{doctor['Fname']} {doctor['Lname']}")
        else:
            print(f"No doctors available on {input_day}")

    except Exception as e:
        print("Failed to retrieve doctor data")
        print("Error:", e)
        con.rollback()

def print_patients_by_age_range():
    try:
        query_under_10 = "SELECT Fname, Lname FROM Patient WHERE TIMESTAMPDIFF(YEAR, DOB, CURDATE()) < 10"
        cur.execute(query_under_10)
        patients_under_10 = cur.fetchall()

        if patients_under_10:
            print("Patients under the age 10:")
            for patient in patients_under_10:
                print(f"{patient['Fname']} {patient['Lname']}")
        else:
            print("No patients found under the age of 10")

        query_above_60 = "SELECT Fname, Lname FROM Patient WHERE TIMESTAMPDIFF(YEAR, DOB, CURDATE()) > 60"
        cur.execute(query_above_60)
        patients_above_60 = cur.fetchall()

        if patients_above_60:
            print("\nPatients above the age 60:")
            for patient in patients_above_60:
                print(f"{patient['Fname']} {patient['Lname']}")
        else:
            print("No patients found above the age of 60")

    except Exception as e:
        print("Failed to retrieve patient data")
        print("Error:", e)
        con.rollback()

def retrieve_treatments():
    try:
        patient_name = input("Enter patient name (FName LName): ")

        query_patient_id = f"SELECT P_ID FROM Treats T JOIN Patient P ON P.Patient_ID=T.P_ID WHERE P.Fname='{patient_name.split()[0]}' AND P.Lname='{patient_name.split()[1]}'"
        cur.execute(query_patient_id)
        patient_id_result = cur.fetchone()

        if patient_id_result:
            patient_id = patient_id_result["P_ID"]

            query_treat_ids = f"SELECT T_ID FROM Treats WHERE P_ID={patient_id}"
            cur.execute(query_treat_ids)
            treat_ids_result = cur.fetchall()

            if treat_ids_result:
                print(f"Treatments for patient {patient_name}:")
                for treat_id_result in treat_ids_result:
                    treat_id = treat_id_result["T_ID"]

                    query_medicines = f"SELECT Medicines FROM Treatment T JOIN Treats T2 ON T.Treatment_ID=T2.T_ID WHERE T2.T_ID={treat_id}"
                    cur.execute(query_medicines)
                    medicines = cur.fetchall()

                    if medicines:
                        for medicine in medicines:
                            print(medicine["Medicines"])
                    else:
                        print(f"No medicines found for T_ID: {treat_id}")
            else:
                print("No treats found for the patient")
        else:
            print("Patient not found")

    except Exception as e:
        print("Failed to retrieve data from the database")
        print("Error:", e)
        con.rollback()


def retrieve_total_salary_of_doctors_by_department():
    try:
        department_name = input("Enter Department Name: ")
        
        query = f"""
            SELECT D.Name AS Department_Name, SUM(D2.Salary) AS Total_Salary
            FROM Department D
            JOIN Doctor D2 ON D.Name = D2.Works_For
            WHERE D.Name = '{department_name}'
            GROUP BY D.Name
        """
        
        cur.execute(query)
        result = cur.fetchone()

        if result:
            print(f"\nTotal Salary of Doctors in {department_name}: {result['Total_Salary']}")
        else:
            print(f"No doctors found for {department_name}")
    
    except Exception as e:
        print("Failed to retrieve data from the database")
        print("Error:", e)
        con.rollback()


def retrieve_doctor_information_by_patient():
    try:
        patient_name = input("Enter Patient Name (FName LName): ")
        patient_query = f"SELECT Patient_ID FROM Patient WHERE Fname='{patient_name.split()[0]}' AND Lname='{patient_name.split()[1]}'"
        
        cur.execute(patient_query)
        result = cur.fetchone()

        if result:
            patient_id = result['Patient_ID']
            doctor_query = f"SELECT D.Fname AS Doctor_FName, D.Lname AS Doctor_LName FROM Doctor D JOIN Treats T ON D.Doctor_ID = T.D_ID WHERE T.P_ID = {patient_id}"
            cur.execute(doctor_query)
            doctor_results = cur.fetchall()

            if doctor_results:
                print(f"\nDoctors treating {patient_name}:")
                for doctor in doctor_results:
                    print(f"{doctor['Doctor_FName']} {doctor['Doctor_LName']}")
            else:
                print(f"No treating doctors found for {patient_name}")

        else:
            print(f"Patient with name {patient_name} not found.")

    except Exception as e:
        print("Failed to retrieve data from the database")
        print("Error:", e)
        con.rollback()

def retrieve_total_amount_of_equipment_by_department():
    try:
        department_name = input("Enter Department Name: ")
        
        query = f"""
            SELECT D.Name AS Department_Name, SUM(E.Price) AS Total_Amount
            FROM Department D
            JOIN Equipment E ON D.Name = E.Procured_By
            WHERE D.Name = '{department_name}'
            GROUP BY D.Name
        """
        
        cur.execute(query)
        result = cur.fetchone()

        if result:
            print(f"\nTotal Amount of Equipment Procured by {department_name}: {result['Total_Amount']}")
        else:
            print(f"No equipment found for {department_name}")

    except Exception as e:
        print("Failed to retrieve data from the database")
        print("Error:", e)
        con.rollback()

def option4_aggregates():
    print("1. Retrieve Total Salary of Doctors in a Department")
    print("2. Retrieve Total Amount of Equipment with a Department")

    sub_option = int(input("Enter sub-option: "))

    if sub_option == 1:
        retrieve_total_salary_of_doctors_by_department()

    elif sub_option == 2:
        retrieve_total_amount_of_equipment_by_department()

    else:
        print("Invalid sub-option")

def option4_search():
    print("1. Retrieve List of Doctor Names consulted by a Patient")
    print("2. Retrieve List of Treatments administered to a Patient")
    print("3. Retrieve List of Patients under the age of 10 and above the age of 60")
    print("4. Retrieve List of Doctors that are available on a particular day")

    sub_option = int(input("Enter sub-option: "))

    if sub_option == 1:
        retrieve_doctor_information_by_patient()

    elif sub_option == 2:
        retrieve_treatments()

    elif sub_option == 3:
        print_patients_by_age_range()

    elif sub_option == 4:
        print_doctors_by_available_day()

    else:
        print("Invalid sub-option")

def option4_projection():
    print("1. Retrieve Inventory of Equipment categorized by their respective Departments.")
    print("2. Retrieve Available Days for each Doctor")

    sub_option = int(input("Enter sub-option: "))

    if sub_option == 1:
        projection_department_equipment()

    elif sub_option == 2:
        projection_av_day()

    else:
        print("Invalid sub-option")

def option4_analysis():
    print("1. Retrieve List of Patients who have made visits to the Hospital exceeding k times.")
    print("2. Retrieve the number of Treatments administered between a specified start date and an end date.")

    sub_option = int(input("Enter sub-option: "))

    if sub_option == 1:
        analysis_k_patients()

    elif sub_option == 2:
        analysis_count()

    else:
        print("Invalid sub-option")

def option1():
    tmp = sp.call('clear', shell=True)
    
    print("1.Doctor")
    print("2.Patient")
    print("3.Director")
    print("4.Equipment")
    print("5.Treatment")

    choice = int(input("Enter choice: "))

    if choice == 1:
        option1_doc()

    elif choice == 2:
        option1_pat()

    elif choice == 3:
        option1_dir()

    elif choice == 4:
        option1_eq()

    elif choice == 5:
        option1_treat()

    else:
        print("Invalid Option")

def option2():
    """
    Function to implement option 1
    """
    # print("Not implemented")
    print("1.Update salary of a doctor")
    print("2.Update Department Manager of a department")

    choice = int(input("Enter choice: "))
    if choice == 1:
        try:
            row = {}
            print("Enter doctor's Id: ")
            row["Doctor_ID"] = int(input("Doctor ID: "))
            row["Salary"] = int(input("Updated Salary: "))

            query = "UPDATE Doctor SET Salary = ('%d') WHERE Doctor_ID = ('%d')" % (
                row["Salary"], row["Doctor_ID"])

            # print(query)
            cur.execute(query)
            con.commit() 

            print("Updated Database")

        except Exception as e:
            con.rollback()
            print("Failed to update database")
            print("Error", e)

    elif choice == 2:  
        try:
            row = {}
            print("Enter department's name: ")
            row["Name"] = input("Name: ")
            row["Managed_By"] = int(input("Manager ID: "))

            query = "UPDATE Department SET Managed_By = ('%d') WHERE Name = ('%s')" % (
                row["Managed_By"], row["Name"])

            # print(query)
            cur.execute(query)
            con.commit() 

            print("Updated Database")

        except Exception as e:
            con.rollback()
            print("Failed to update database")
            print("Error", e)        


def option3():
    print("1.Doctor")
    print("2.Attendant")
    print("3.Director")
    print("4.Equipment")

    choice = int(input("Enter choice: "))

    if choice == 1:
        option3_doc()

    elif choice == 2:
        option3_nur()

    elif choice == 3:
        option3_dir()

    elif choice == 4:
        option3_eq()


    else:
        print("Invalid Option")


def option4():
    print("1. Aggregates")
    print("2. Search")
    print("3. Projection")
    print("4. Analysis")

    choice = int(input("Enter choice: "))

    if choice == 1:
        option4_aggregates()

    elif choice == 2:
        option4_search()

    elif choice == 3:
        option4_projection()

    elif choice == 4:
        option4_analysis()

    else:
        print("Invalid Option")


# def hireAnEmployee():
#     """
#     This is a sample function implemented for the refrence.
#     This example is related to the Employee Database.
#     In addition to taking input, you are required to handle domain errors as well
#     For example: the SSN should be only 9 characters long
#     Sex should be only M or F
#     If you choose to take Super_SSN, you need to make sure the foreign key constraint is satisfied
#     HINT: Instead of handling all these errors yourself, you can make use of except clause to print the error returned to you by MySQL
#     """
#     try:
#         # Takes emplyee details as input
#         row = {}
#         print("Enter new employee's details: ")
#         name = (input("Name (Fname Minit Lname): ")).split(' ')
#         row["Fname"] = name[0]
#         row["Minit"] = name[1]
#         row["Lname"] = name[2]
#         row["Ssn"] = input("SSN: ")
#         row["Bdate"] = input("Birth Date (YYYY-MM-DD): ")
#         row["Address"] = input("Address: ")
#         row["Sex"] = input("Sex: ")
#         row["Salary"] = float(input("Salary: "))
#         row["Dno"] = int(input("Dno: "))

#         query = "INSERT INTO EMPLOYEE(Fname, Minit, Lname, Ssn, Bdate, Address, Sex, Salary, Dno) VALUES('%s', '%c', '%s', '%s', '%s', '%s', '%c', %f, %d)" % (
#             row["Fname"], row["Minit"], row["Lname"], row["Ssn"], row["Bdate"], row["Address"], row["Sex"], row["Salary"], row["Dno"])

#         print(query)
#         cur.execute(query)
#         con.commit()

#         print("Inserted Into Database")

#     except Exception as e:
#         con.rollback()
#         print("Failed to insert into database")
#         print(">>>>>>>>>>>>>", e)

#     return


def dispatch(ch):
    """
    Function that maps helper functions to option entered
    """

    if(ch == 1):
        option1()
    elif(ch == 2):
        option2()
    elif(ch == 3):
        option3()
    elif(ch == 4):
        option4()
    else:
        print("Error: Invalid Option")


# Global
while(1):
    tmp = sp.call('clear', shell=True)
    
    # Can be skipped if you want to hardcode username and password
    # username = input("Username: ")
    # password = input("Password: ")

    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server 
        con = pymysql.connect(host='localhost',
                              port=3306,
                              user="root",
                              password="abh!nav",
                              db='Hospital',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp = sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp = input("Enter any key to CONTINUE>")

        with con.cursor() as cur:
            while(1):
                tmp = sp.call('clear', shell=True)
                # Hospital Mini-world
                print("1. Option 1: Insert")  # Insert
                print("2. Option 2: Update")  # Update
                print("3. Option 3: Delete")  # Delete
                print("4. Option 4: Retrievals")  # Retrievals
                print("5. Logout")
                ch = int(input("Enter choice> "))
                tmp = sp.call('clear', shell=True)
                if ch == 5:
                    exit()
                else:
                    dispatch(ch)
                    tmp = input("Enter any key to CONTINUE>")

    except Exception as e:
        tmp = sp.call('clear', shell=True)
        print(e)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database")
        tmp = input("Enter any key to CONTINUE>")