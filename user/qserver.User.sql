USE [question]
GO
/****** Object:  User [qserver]    Script Date: 2023-06-27 2:44:45 PM ******/
CREATE USER [qserver] FOR LOGIN [qserver] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [qserver]
GO
