CREATE TABLE [WAREHOUSE](
	[strAccountID] [varchar](21) NOT NULL,
	[nMoney] [int] NOT NULL DEFAULT(0),
	[dwTime] [int] NOT NULL DEFAULT(0),
	[WarehouseData] [binary](1568) NULL,
	[strSerial] [binary](1568) NULL
)