CREATE TABLE [MAGIC_TYPE9](
	[iNum] [int] NOT NULL,
	[ValidGroup] [tinyint] NOT NULL DEFAULT(0),
	[NationChange] [tinyint] NOT NULL DEFAULT(0),
	[MonsterNum] [smallint] NOT NULL DEFAULT(0),
	[TargetChange] [tinyint] NOT NULL DEFAULT(0),
	[StateChange] [tinyint] NOT NULL DEFAULT(0),
	[Radius] [smallint] NOT NULL DEFAULT(0),
	[Hitrate] [smallint] NOT NULL DEFAULT(0),
	[Duration] [smallint] NOT NULL DEFAULT(0),
	[AddDamage] [smallint] NOT NULL DEFAULT(0),
	[Vision] [smallint] NOT NULL DEFAULT(0),
	[NeedItem] [int] NOT NULL DEFAULT(0)
)