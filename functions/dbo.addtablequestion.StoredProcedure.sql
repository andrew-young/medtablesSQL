USE [question]
GO
/****** Object:  StoredProcedure [dbo].[addtablequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[addtablequestion]
GO
/****** Object:  StoredProcedure [dbo].[addtablequestion]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






create procedure [dbo].[addtablequestion](@qid int , @randomrow bit, @randomcol bit, @dragrow bit, @dragcol bit, @swap bit )
	AS
BEGIN

	insert into question.dbo.tablequestion (qid,randomroworder ,randomcolumnorder ,dragrow ,dragcol,swap) 
	values(@qid,@randomrow,@randomcol ,@dragrow ,@dragcol, @swap)

	
end
GO
