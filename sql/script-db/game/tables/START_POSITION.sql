CREATE TABLE [START_POSITION](
	[ZoneID] [smallint] NOT NULL,
	[sKarusX] [smallint] NOT NULL,
	[sKarusZ] [smallint] NOT NULL,
	[sElmoradX] [smallint] NOT NULL,
	[sElmoradZ] [smallint] NOT NULL,
	[bRangeX] [tinyint] NOT NULL,
	[bRangeZ] [tinyint] NOT NULL,
	[sKarusGateX] [smallint] NOT NULL DEFAULT(0),
	[sKarusGateZ] [smallint] NOT NULL DEFAULT(0),
	[sElmoGateX] [smallint] NOT NULL DEFAULT(0),
	[sElmoGateZ] [smallint] NOT NULL DEFAULT(0)
)