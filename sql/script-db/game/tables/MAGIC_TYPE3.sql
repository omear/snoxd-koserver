CREATE TABLE [MAGIC_TYPE3](
	[iNum] [int] NOT NULL,
	[DirectType] [tinyint] NOT NULL,
	[FirstDamage] [smallint] NOT NULL DEFAULT(0),
	[EndDamage] [smallint] NOT NULL DEFAULT(0),
	[TimeDamage] [smallint] NOT NULL DEFAULT(0),
	[Duration] [tinyint] NOT NULL,
	[Attribute] [tinyint] NOT NULL,
	[Radius] [tinyint] NOT NULL,
	[Angle] [smallint] NOT NULL DEFAULT(0)
)