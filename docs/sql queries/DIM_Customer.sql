-- Cleansed DIM_Customer Table --
SELECT
	c.[CustomerKey] AS [Customer Key],
      --,[GeographyKey]
      --,[CustomerAlternateKey]
      --,[Title]
    c.[FirstName] AS [First Name],
     -- ,[MiddleName]
    c.[LastName] AS [Last Name],
	c.FirstName + ' ' +c.LastName AS [Full Name],
      --,[NameStyle]
    --c.[BirthDate]
	YEAR(GETDATE()) - YEAR(c.[BirthDate]) AS [Age],
    c.[MaritalStatus] AS [Marital Status],
      --,[Suffix]
      --,[Gender]
	CASE 
		WHEN c.Gender = 'M' THEN 'Male' 
		WHEN c.Gender = 'F' THEN 'Female' 
		ELSE 'Unknown'  -- Optional: Add this in case there's an unexpected value
    END AS Gender,
      --,[EmailAddress]
    c.[YearlyIncome] AS [Yearly Income],
    c.[TotalChildren] AS [Total Children],
     -- ,[NumberChildrenAtHome]
     -- ,[EnglishEducation]
     -- ,[SpanishEducation]
     -- ,[FrenchEducation]
     -- ,[EnglishOccupation]
     -- ,[SpanishOccupation]
     -- ,[FrenchOccupation]
     -- ,[HouseOwnerFlag]
     -- ,[NumberCarsOwned]
     -- ,[AddressLine1]
     -- ,[AddressLine2]
     -- ,[Phone]
    c.[DateFirstPurchase] AS [DateFirstPurchase],
    c.[CommuteDistance] AS [DistanceFromStore],
	g.City AS [Customer City]
  FROM [AdventureWorksDW2022].[dbo].[DimCustomer] as c
  LEFT JOIN dbo.DimGeography AS g
  ON g.GeographyKey = c.GeographyKey
  ORDER BY CustomerKey ASC
