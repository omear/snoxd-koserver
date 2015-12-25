CREATE TABLE [ACCOUNT_CHAR](
	[strAccountID] [varchar](21) NOT NULL,
	[bNation] [tinyint] NOT NULL,
	[bCharNum] [tinyint] NOT NULL DEFAULT(0),
	[strCharID1] [varchar](21) NULL,
	[strCharID2] [varchar](21) NULL,
	[strCharID3] [varchar](21) NULL
)
