<<<<<<< HEAD
# 💾 SQL Portfolio Project: Asset Management Database

## 📝 Project Overview

This project simulates a real-world **IT Asset Management (ITAM)** database, demonstrating core SQL skills in schema design, data insertion, data integrity resolution, and advanced reporting.

The focus of this portfolio piece is not just successful data entry, but the **process of debugging and correcting schema/data integrity errors** commonly encountered in production environments.

### 💡 Key Problem Solved During Execution:

1.  **Missing Data Resolution:** Identified and inserted 15 missing Desktop Assets (`DT001` - `DT015`) which were blocking allocation phases.
2.  **Business Logic Correction:** Corrected a flawed allocation script that attempted to assign non-existent Headset tags (`HS091+`), mapping users to the correct existing inventory ($\text{HS061}$ - $\text{HS090}$).
3.  **Schema Integrity Fix (The Grand Finale):** Diagnosed and fixed a fundamental schema flaw involving a data type mismatch (`CHAR` vs. `VARCHAR`) and column reference error in a **Foreign Key constraint**, which required dropping, modifying data, and recreating the constraint.

## 🛠️ Technologies Used

* **Database Engine:** SQL Server 2022 (Transact-SQL / T-SQL)
* **Management Tool:** SQL Server Management Studio (SSMS)
* **Version Control:** Git / GitHub

## 💻 Setup Instructions

1.  **Create Database:** Create a new empty database named `AssetManagementDB` (or similar) in SQL Server.
2.  **Schema Creation:** Run the entire contents of the `schema.sql` file to create all required tables (`Employees`, `AssetList`, `AssetAllocation`, etc.).
3.  **Data Insertion:** Run the contents of the `sample_data.sql` file. This inserts initial data and executes the DML commands that solved the project's real-world scenarios.
4.  **Reporting:** Execute the queries found in `queries.sql` to generate reports and analyze asset status.

## 📊 Example Queries

The `queries.sql` file includes complex examples demonstrating:

* **JOINs and Date Functions:** Identifying older assets for proactive replacement planning.
* **Aggregation (GROUP BY/COUNT):** Providing a summary of asset inventory status.
* **DML:** Logging maintenance, retiring, and disposing of assets from the inventory.

## ⭐ Results

The final state of the database reflects a complete, accurate, and functional asset registry for over 125 employees, ready for audit and reporting. The successful resolution of the schema errors showcases expertise in maintaining database integrity.

## 📞 Contact Info

* **Name:** Kiran Indur
* **Email:** Kiran.indur@outlook.com
* **LinkedIn:** https://www.linkedin.com/in/kiran-indur-emergent-work/
=======
# Asset-Management-Project
SQL Server project simulating an IT Asset Management (ITAM) system. Demonstrates core T-SQL skills, schema design, and critical debugging techniques. Solved real-world data integrity issues including Foreign Key conflicts, data type mismatches, and correcting flawed business logic to ensure accurate asset allocation for 125+ employees.
>>>>>>> 913ae81927db8f64afb287bc9925d6ff7958330c
