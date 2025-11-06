-- SQL Portfolio Project: Asset Management System
-- File: schema.sql

-- 1. Employee Table
CREATE TABLE Employees (
    Emp_ID CHAR(5) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Username VARCHAR(50) UNIQUE NOT NULL,
    Email VARCHAR(100) UNIQUE NOT NULL,
    Dept_Code CHAR(4) NOT NULL
    -- NOTE: Assuming a FK constraint to a Department table exists here
);

-- 2. Asset Type Table
CREATE TABLE AssetType (
    AssetType_Code CHAR(2) PRIMARY KEY,
    Type_Name VARCHAR(50) NOT NULL
);

-- 3. Asset Model Table
CREATE TABLE AssetModel (
    Model_ID CHAR(3) PRIMARY KEY,
    Model_Name VARCHAR(50) NOT NULL,
    Manufacturer VARCHAR(50) NOT NULL
);

-- 4. Asset List (Inventory) Table
CREATE TABLE AssetList (
    Asset_Tag VARCHAR(10) PRIMARY KEY,
    AssetType_Code CHAR(2) NOT NULL,
    Asset_Name VARCHAR(100) NOT NULL,
    Serial_Number VARCHAR(50) UNIQUE NOT NULL,
    Acquisition_Date DATE NOT NULL,
    Asset_Status VARCHAR(20) NOT NULL CHECK (Asset_Status IN ('Allocated', 'Available', 'Disposed')),
    Model_ID CHAR(3),
    Last_Maintenance_Date DATE NULL,
    Disposal_Date DATE NULL,
    
    FOREIGN KEY (AssetType_Code) REFERENCES AssetType(AssetType_Code),
    FOREIGN KEY (Model_ID) REFERENCES AssetModel(Model_ID)
);

-- 5. Asset Allocation Table (Linking Assets to Employees)
CREATE TABLE AssetAllocation (
    Allocation_ID INT PRIMARY KEY IDENTITY(1,1),
    Asset_Tag VARCHAR(10) NOT NULL UNIQUE,
    Employee_ID CHAR(5) NOT NULL,
    Allocation_Date DATE NOT NULL,
    Return_Date DATE NULL,
    Allocation_Status VARCHAR(20) NOT NULL CHECK (Allocation_Status IN ('Allocated', 'Returned')),
    Notes VARCHAR(255) NULL,
    
    -- CORRECTED FOREIGN KEY: This FK caused a data type and constraint error during the project.
    -- The fix involved dropping the old FK, changing the data type of Employee_ID to CHAR(5),
    -- and recreating the constraint to correctly point to Employees(Emp_ID).
    FOREIGN KEY (Employee_ID) REFERENCES Employees(Emp_ID),
    FOREIGN KEY (Asset_Tag) REFERENCES AssetList(Asset_Tag)
);