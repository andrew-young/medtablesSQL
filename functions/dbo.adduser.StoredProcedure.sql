USE [question]
GO
/****** Object:  StoredProcedure [dbo].[adduser]    Script Date: 2023-06-27 2:43:18 PM ******/
DROP PROCEDURE [dbo].[adduser]
GO
/****** Object:  StoredProcedure [dbo].[adduser]    Script Date: 2023-06-27 2:43:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[adduser](@name varchar(50),@id int output )
	AS
BEGIN
	begin transaction
		if not exists(select * from dbo.getuser(@name))
		begin
			insert into users (name)
			values(@name)
			select @id=@@IDENTITY
		end
		else
		begin
			select @id=id from dbo.getuser(@name)
		end
	COMMIT transaction
end
GO
