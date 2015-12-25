CREATE TABLE [RENTAL_ITEM_LIST](
	[nRentalIndex] [int] NOT NULL,
	[nItemIndex] [int] NOT NULL,
	[sDurability] [smallint] NOT NULL DEFAULT(0),
	[nSerialNumber] [bigint] NOT NULL DEFAULT(0),
	[byRegType] [tinyint] NOT NULL DEFAULT(0),
	[byItemType] [tinyint] NOT NULL,
	[byClass] [tinyint] NOT NULL,
	[sRentalTime] [smallint] NOT NULL,
	[nRentalMoney] [int] NOT NULL,
	[strLenderCharID] [varchar](21) NOT NULL,
	[strLenderAcID] [varchar](21) NOT NULL,
	[strBorrowerCharID] [varchar](21) NULL,
	[strBorrowerAcID] [varchar](21) NULL,
	[timeLender] [smalldatetime] NULL,
	[timeRegister] [smalldatetime] NOT NULL DEFAULT(GETUTCDATE())
)