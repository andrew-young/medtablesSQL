USE [question]
GO
/****** Object:  StoredProcedure [dbo].[removetest]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[removetest]
GO
/****** Object:  StoredProcedure [dbo].[removetest]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[removetest](@tid int)
	AS
BEGIN
	delete from question.dbo.test
	where tid=@tid

	delete from question.dbo.testquestion
	where tid=@tid
end
GO
