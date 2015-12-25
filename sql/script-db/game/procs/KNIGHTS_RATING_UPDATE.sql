CREATE PROCEDURE [KNIGHTS_RATING_UPDATE] 
AS
IF EXISTS (SELECT * FROM sysobjects where id = object_id(N'[dbo].[rating_temp]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
DROP TABLE [rating_temp]
CREATE TABLE [rating_temp] (
	[nRank] [int] IDENTITY (1, 1) NOT NULL,
	[shIndex] [smallint] NULL,
	[strName] [varchar] (21) NULL ,
	[nPoints] [int] NULL ,
)

INSERT INTO rating_temp SELECT IDNum, IDName, Points FROM KNIGHTS ORDER BY Points DESC

CREATE  INDEX [IX_rating_rank] ON [dbo].[rating_temp]([nRank]) ON [PRIMARY]
CREATE  INDEX [IX_rating_name] ON [dbo].[rating_temp]([strName]) ON [PRIMARY]

DELETE FROM KNIGHTS_RATING
INSERT INTO KNIGHTS_RATING SELECT * FROM rating_temp
