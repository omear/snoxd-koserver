
CREATE TABLE [MAGIC](
	[MagicNum] [int] NOT NULL,
	[EnName] [varchar](200) NULL,
	[KrName] [varchar](200) NULL,
	[Description] [varchar](200) NULL,
	[BeforeAction] [tinyint] NOT NULL,
	[TargetAction] [tinyint] NOT NULL,
	[SelfEffect] [tinyint] NOT NULL,
	[FlyingEffect] [smallint] NOT NULL,
	[TargetEffect] [smallint] NOT NULL,
	[Moral] [tinyint] NOT NULL,
	[SkillLevel] [smallint] NOT NULL,
	[Skill] [smallint] NOT NULL,
	[Msp] [smallint] NOT NULL,
	[HP] [smallint] NOT NULL,
	[ItemGroup] [tinyint] NOT NULL,
	[UseItem] [int] NOT NULL,
	[CastTime] [smallint] NOT NULL,
	[ReCastTime] [smallint] NOT NULL,
	[SuccessRate] [smallint] NOT NULL,
	[Type1] [tinyint] NOT NULL,
	[Type2] [tinyint] NOT NULL,
	[Range] [smallint] NOT NULL,
	[Etc] [tinyint] NOT NULL
) 
