CREATE TABLE [dbo].[TB_USER](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[strAccountID] [varchar](21) NOT NULL,
	[strPasswd] [varchar](32) NOT NULL,
	[strSocNo] [varchar](20) NULL,
	[strSealPassword] varchar(8) NOT NULL DEFAULT('00000000'),
	[strAuthority] [tinyint] NOT NULL DEFAULT (1),
	[CreateDate] [datetime] NOT NULL DEFAULT (GETUTCDATE())
)
