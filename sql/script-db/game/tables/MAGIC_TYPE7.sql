CREATE TABLE [MAGIC_TYPE7](
	[nIndex] [int] NOT NULL,
	[byValidGroup] [tinyint] NOT NULL DEFAULT(0),
	[byNatoinChange] [tinyint] NOT NULL DEFAULT(0),
	[shMonsterNum] [smallint] NOT NULL DEFAULT(0),
	[byTargetChange] [tinyint] NOT NULL DEFAULT(0),
	[byStateChange] [tinyint] NOT NULL DEFAULT(0),
	[byRadius] [tinyint] NOT NULL DEFAULT(0),
	[shHitrate] [smallint] NOT NULL DEFAULT(0),
	[shDuration] [smallint] NOT NULL DEFAULT(0),
	[shDamage] [smallint] NOT NULL DEFAULT(0),
	[byVisoin] [tinyint] NOT NULL DEFAULT(0),
	[nNeedItem] [int] NOT NULL DEFAULT(0)
)