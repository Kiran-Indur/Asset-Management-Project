-- SQL Portfolio Project: Asset Management System
-- File: queries.sql

-- ******************************************************
-- SCENARIO 3: REPORTING AND ANALYSIS QUERIES
-- ******************************************************

-- Task 6: Identify Employees with Old Assets (Requires JOINs and Date Filtering)
-- Lists employees using laptops acquired more than 18 months ago.
SELECT
    E.Emp_ID,
    E.First_Name,
    E.Last_Name,
    A.Asset_Tag,
    A.Acquisition_Date
FROM
    Employees E
JOIN
    AssetAllocation AA ON E.Emp_ID = AA.Employee_ID
JOIN
    AssetList A ON AA.Asset_Tag = A.Asset_Tag
WHERE
    A.AssetType_Code = 'LP' -- Focus on Laptops
    AND A.Acquisition_Date < DATEADD(month, -18, GETDATE());
    -- NOTE: Use DATEDIFF(month, A.Acquisition_Date, GETDATE()) > 18 for older SQL versions

-- Task 7: Asset Status Breakdown (GROUP BY and COUNT)
-- Provides a total count of assets by type and current status.
SELECT
    A.AssetType_Code,
    A.Asset_Status,
    COUNT(A.Asset_Tag) AS Total_Count
FROM
    AssetList A
GROUP BY
    A.AssetType_Code,
    A.Asset_Status
ORDER BY
    A.AssetType_Code,
    A.Asset_Status;

-- Task 4: Log Maintenance Example (DML - UPDATE)
-- Log maintenance completion for a batch of monitors.
UPDATE AssetList
SET Last_Maintenance_Date = GETDATE()
WHERE Asset_Tag BETWEEN 'MT001' AND 'MT010'
  AND AssetType_Code = 'MT';
  
-- Task 5: Retire and Dispose of Old Assets (DML - DELETE and UPDATE)
-- Retiring three old keyboards and clearing their allocation.
-- 5a. Remove Allocation Records
DELETE FROM AssetAllocation
WHERE Asset_Tag IN ('MK001', 'MK002', 'MK003');

-- 5b. Update Asset Status to Disposed
UPDATE AssetList
SET 
    Asset_Status = 'Disposed',
    Disposal_Date = GETDATE()
WHERE 
    Asset_Tag IN ('MK001', 'MK002', 'MK003');