CREATE TABLE [ZONE_INFO](
	[ServerNo] [tinyint] NOT NULL,
	[ZoneNo] [smallint] NOT NULL,
	[strZoneName] [varchar](50) NOT NULL,
	[InitX] [int] NOT NULL DEFAULT(0),
	[InitZ] [int] NOT NULL DEFAULT(0),
	[InitY] [int] NOT NULL DEFAULT(0),
	[Type] [tinyint] NOT NULL DEFAULT(0),
	[RoomEvent] [tinyint] NOT NULL DEFAULT(0)
)