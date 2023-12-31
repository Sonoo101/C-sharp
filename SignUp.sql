USE [LearningManagement_Local]
GO
/****** Object:  Table [dbo].[SignUp]    Script Date: 8/13/2023 1:30:17 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SignUp](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](50) NULL,
	[Name] [nvarchar](50) NULL,
	[MobileNumber] [int] NULL,
	[EmailId] [nvarchar](100) NULL,
	[Password] [nvarchar](200) NULL,
	[ConfirmPassword] [nvarchar](200) NULL,
	[CreateDate] [datetime] NULL,
	[CreatedBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SignUp_Add]    Script Date: 8/13/2023 1:30:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SignUp_Add](
@UserName nvarchar(50),
@Name nvarchar(50),
@MobileNumber int,
@EmailId nvarchar(100),
@Password nvarchar(200),
@ConfirmPassword nvarchar(200),
@CreateDate datetime,
@CreateBy int
)
as
begin
insert into SignUp(UserName, Name, MobileNumber, EmailId, Password, ConfirmPassword, CreateDate, CreatedBy)
values(@UserName, @Name, @MobileNumber, @EmailId, @Password, @ConfirmPassword, @CreateDate, @CreateBy)
--select 'success' as status, 'User Details Add Successfully' as message
end
GO
/****** Object:  StoredProcedure [dbo].[SignUp_Delete]    Script Date: 8/13/2023 1:30:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SignUp_Delete](@UserId int) 
as delete SignUp
where UserId = @UserId
select 'success' as status, 'User Deleted Successfully' as message
GO
/****** Object:  StoredProcedure [dbo].[SignUp_FindById]    Script Date: 8/13/2023 1:30:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SignUp_FindById](
@UserId int
) as begin
select UserId, UserName, Name, MobileNumber, EmailId, Password, CreateDate from SignUp
where UserId = @UserId
end
GO
/****** Object:  StoredProcedure [dbo].[SignUp_List]    Script Date: 8/13/2023 1:30:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[SignUp_List](
@UserId int
) as begin
select * from SignUp
end
GO
/****** Object:  StoredProcedure [dbo].[SignUp_Update]    Script Date: 8/13/2023 1:30:19 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SignUp_Update](
@UserId int,
@UserName nvarchar(50),
@Name nvarchar(50),
@MobileNumber int,
@EmailId nvarchar(100),
@Password nvarchar(200),
@ConfirmPassword nvarchar(200),
@UpdateDate datetime,
@UpdateBy int
)
as
begin
update SignUp
set UserName = @UserName, Name = @Name, MobileNumber = @MobileNumber, EmailId = @EmailId,
Password = @Password, ConfirmPassword = @ConfirmPassword, UpdateDate = @UpdateDate, UpdateBy = @UpdateBy
where UserId = @UserId
--select 'success' as status, 'Syllabus Update Successfully' as message
end
GO
