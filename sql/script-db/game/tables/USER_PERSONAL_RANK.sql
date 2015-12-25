CREATE TABLE [USER_PERSONAL_RANK](
	[nRank] [smallint] NOT NULL,
	[strPosition] [varchar](21) NULL,
	[nElmoUP] [smallint] NOT NULL DEFAULT(0),
	[strElmoUserID] [varchar](21) NULL,
	[nElmoLoyaltyMonthly] [int] NOT NULL DEFAULT(0),
	[nElmoCheck] [int] NOT NULL DEFAULT(0),
	[nKarusUP] [smallint] NOT NULL DEFAULT(0),
	[strKarusUserID] [varchar](21) NULL,
	[nKarusLoyaltyMonthly] [int] NOT NULL DEFAULT(0),
	[nKarusCheck] [int] NOT NULL DEFAULT(0),
	[nSalary] [int] NOT NULL DEFAULT(0),
	[UpdateDate] [smalldatetime] NULL
)