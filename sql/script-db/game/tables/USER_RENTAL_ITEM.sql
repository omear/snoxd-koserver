CREATE TABLE [USER_RENTAL_ITEM](
	[strUserID] [varchar](21) NULL,
	[strAccountID] [varchar](21) NULL,
	[byRentalType] [tinyint] NULL,
	[byRegType] [tinyint] NOT NULL DEFAULT(0),
	[nRentalIndex] [int] NOT NULL,
	[nItemIndex] [int] NOT NULL,
	[sDurability] [smallint] NOT NULL DEFAULT(0),
	[nSerialNumber] [bigint] NOT NULL DEFAULT(0),
	[nRentalMoney] [int] NOT NULL,
	[sRentalTime] [smallint] NOT NULL DEFAULT(0),
	[sDuringTime] [smallint] NOT NULL DEFAULT(0),
	[timeRental] [smalldatetime] NULL,
	[timeRegister] [smalldatetime] NOT NULL DEFAULT(GETUTCDATE())
)