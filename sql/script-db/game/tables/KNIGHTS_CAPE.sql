CREATE TABLE [KNIGHTS_CAPE](
	[sCapeIndex] [smallint] NOT NULL,
	[strName] [varchar](30) NULL,
	[nBuyPrice] [int] NOT NULL DEFAULT(0),
	[nDuration] [int] NOT NULL DEFAULT(0),
	[byGrade] [tinyint] NOT NULL,
)