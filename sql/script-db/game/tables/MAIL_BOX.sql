CREATE TABLE [MAIL_BOX](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dtSendDate] [datetime] NOT NULL DEFAULT(GETUTCDATE()),
	[dtReadDate] [datetime] NULL,
	[bStatus] [tinyint] NOT NULL DEFAULT(1),
	[strSenderID] [varchar](21) NOT NULL,
	[strRecipientID] [varchar](21) NOT NULL,
	[strSubject] [varchar](31) NOT NULL,
	[strMessage] [varchar](128) NOT NULL,
	[bType] [tinyint] NOT NULL DEFAULT(1),
	[nItemID] [int] NOT NULL DEFAULT(0),
	[sCount] [smallint] NOT NULL DEFAULT(0),
	[sDurability] [smallint] NOT NULL DEFAULT(0),
	[nSerialNum] [bigint] NOT NULL DEFAULT(0),
	[nCoins] [int] NOT NULL DEFAULT(0),
	[bDeleted] [bit] NOT NULL DEFAULT(0)
)