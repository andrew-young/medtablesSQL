USE [question]
GO
/****** Object:  User [IIS APPPOOL\MedTables]    Script Date: 2023-06-27 2:44:45 PM ******/
CREATE USER [IIS APPPOOL\MedTables] FOR LOGIN [IIS APPPOOL\MedTables] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\MedTables]
GO
