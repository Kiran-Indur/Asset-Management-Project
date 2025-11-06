-- SQL Portfolio Project: Asset Management System
-- File: sample_data.sql

-- Initial Department Data (Based on your usage)
INSERT INTO Department (Dept_Code, Dept_Name) VALUES
('DPHR', 'Human Resources'),
('DPFN', 'Finance'),
('DPSL', 'Sales'),
('DPIT', 'Information Technology'),
('DPMKT', 'Marketing'),
('DPRND', 'Research & Development');

-- Sample Asset Model Data
INSERT INTO AssetModel (Model_ID, Model_Name, Manufacturer) VALUES
('L01', 'Standard Laptop V1', 'TechCorp'),
('L02', 'Premium Laptop V2', 'TechCorp'),
('D01', 'Desktop Workstation', 'CompMan'),
('M01', '24 inch LED Monitor', 'DisplayPro'),
('K01', 'Ergonomic Keyboard', 'KeyCom'),
('H01', 'Noise Cancelling Headset', 'AudioNet');

-- ******************************************************
-- 1. SCENARIO RESOLUTION: INSERTING MISSING ASSETS (DT001-DT015)
-- The allocation phase failed because these assets were missing from the inventory.
-- This script was run to resolve the Foreign Key conflict.
-- ******************************************************
INSERT INTO AssetList (Asset_Tag, AssetType_Code, Asset_Name, Serial_Number, Acquisition_Date, Asset_Status, Model_ID) VALUES
-- Insert the 15 missing Desktop Computers
('DT001', 'DT', 'Standard Desktop', 'SNDT001A', '2023-11-01', 'Available', 'D01'),
-- ... (13 more desktop insertions DT002-DT014)
('DT015', 'DT', 'Standard Desktop', 'SNDT015E', '2023-11-01', 'Available', 'D01');

-- ******************************************************
-- 2. SCENARIO: NEW EMPLOYEE ONBOARDING (E121-E125)
-- Tasks 1 & 2: Insert New Assets and Employees
-- ******************************************************

-- Task 1: Insert New Laptops (LP121-LP125)
INSERT INTO AssetList (Asset_Tag, AssetType_Code, Asset_Name, Serial_Number, Acquisition_Date, Asset_Status, Model_ID) VALUES
('LP121', 'LP', 'Premium Laptop V2', 'SNLP121J8', '2025-11-06', 'Available', 'L02'),
-- ... (3 more laptop insertions)
('LP125', 'LP', 'Premium Laptop V2', 'SNLP125T6', '2025-11-06', 'Available', 'L02');

-- Task 2: Insert New Employees (E121-E125)
INSERT INTO Employees (Emp_ID, First_Name, Last_Name, Username, Email, Dept_Code) VALUES
('E121', 'Alice', 'Johnson', 'ajohnson1', 'alice.johnson@corp.com', 'DPHR'),
-- ... (3 more employee insertions)
('E125', 'Emily', 'Rodriguez', 'erodriguez', 'emily.rodriguez@corp.com', 'DPHR');

-- Task 3 (Part 1): Allocate Assets to New Employees
-- NOTE: This step assumes the FK data type conflict was resolved via DDL.
INSERT INTO AssetAllocation (Asset_Tag, Employee_ID, Allocation_Date, Allocation_Status) VALUES
('LP121', 'E121', GETDATE(), 'Allocated'),
-- ... (3 more allocation insertions)
('LP125', 'E125', GETDATE(), 'Allocated');

-- Task 3 (Part 2): Update Asset Status
UPDATE AssetList
SET Asset_Status = 'Allocated'
WHERE Asset_Tag IN ('LP121', 'LP122', 'LP123', 'LP124', 'LP125');