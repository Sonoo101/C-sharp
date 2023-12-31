USE [LearningManagement_Local]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 8/8/2023 10:17:51 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](200) NULL,
	[Contact] [nvarchar](20) NULL,
	[Email] [nvarchar](300) NULL,
	[Qualification] [nvarchar](100) NULL,
	[Address] [nvarchar](500) NULL,
	[LoginId] [nvarchar](100) NULL,
	[Password] [nvarchar](100) NULL,
	[AccountStatus] [int] NULL,
	[ProfilePic] [nvarchar](200) NULL,
	[CreateDate] [datetime] NULL,
	[CreateBy] [int] NULL,
	[UpdateDate] [datetime] NULL,
	[UpdateBy] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[Student_Add]    Script Date: 8/8/2023 10:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Student_Add](
@Name nvarchar(200),
@Contact nvarchar(20),
@Email nvarchar(300),
@Qualification nvarchar(100),
@Address nvarchar(500),
@LoginId nvarchar(100),
@Password nvarchar(100),
@AccountStatus int,
@ProfilePic nvarchar(200),
@CreateDate datetime,
@CreateBy int
)
as
begin
insert into Student(Name, Contact, Email, Qualification, Address, LoginId, Password, AccountStatus, ProfilePic, CreateDate, CreateBy)
values(@Name, @Contact, @Email, @Qualification, @Address, @LoginId, @Password, @AccountStatus, @ProfilePic,  @CreateDate, @CreateBy)
select 'success' as status, 'Student Add Successfully' as message
end
GO
/****** Object:  StoredProcedure [dbo].[Student_Delete]    Script Date: 8/8/2023 10:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Student_Delete](@StudentId int) 
as delete Student
where StudentId = @StudentId
GO
/****** Object:  StoredProcedure [dbo].[Student_FindById]    Script Date: 8/8/2023 10:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Student_FindById](
@StudentId int
) as begin
select StudentId, Name, Contact, Email, Qualification, Address, LoginId, Password, AccountStatus, ProfilePic, CreateDate from Student
where StudentId = @StudentId
end
GO
/****** Object:  StoredProcedure [dbo].[Student_List]    Script Date: 8/8/2023 10:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[Student_List](
@StudentId int
) as begin
select StudentId, Name, Contact, Email, Qualification, Address, LoginId, Password, AccountStatus, ProfilePic, CreateDate from Student
end
GO
/****** Object:  StoredProcedure [dbo].[Student_Update]    Script Date: 8/8/2023 10:17:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[Student_Update](
@StudentId int,
@Name nvarchar(200),
@Contact nvarchar(20),
@Email nvarchar(300),
@Qualification nvarchar(100),
@Address nvarchar(500),
@LoginId nvarchar(100),
@Password nvarchar(100),
@AccountStatus int,
@ProfilePic nvarchar(200),
@UpdateDate datetime,
@UpdateBy int
)
as
begin
update Student
set  Name = @Name, Contact = @Contact, Email = @Email, Qualification = @Qualification, Address = @Address, 
LoginId = @LoginId, Password = @Password, AccountStatus = @AccountStatus, ProfilePic = @ProfilePic,
UpdateDate = @UpdateDate, UpdateBy = @UpdateBy
where StudentId = @StudentId
select 'success' as status, 'Student Update Successfully' as message
end
GO
