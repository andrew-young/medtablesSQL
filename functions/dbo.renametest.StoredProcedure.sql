USE [question]
GO
/****** Object:  StoredProcedure [dbo].[renametest]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[renametest]
GO
/****** Object:  StoredProcedure [dbo].[renametest]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create procedure [dbo].[renametest] (@tid int,@name varchar(100))
	AS
BEGIN
	update question.dbo.test
	set name=@name
	where tid=@tid
END
GO
