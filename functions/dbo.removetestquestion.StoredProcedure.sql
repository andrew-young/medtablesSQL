USE [question]
GO
/****** Object:  StoredProcedure [dbo].[removetestquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[removetestquestion]
GO
/****** Object:  StoredProcedure [dbo].[removetestquestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[removetestquestion](@tid int)
	AS
BEGIN
	delete from question.dbo.testquestion
	where tid=@tid
END
GO
