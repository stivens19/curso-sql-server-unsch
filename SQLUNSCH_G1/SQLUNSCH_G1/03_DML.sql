USE AdventureWorks2022
GO
/* TABLAS TEMPORALES */
-- Crear Tabla temporal
--SELECT 
--     [DatabaseLogID]
--    , [PostTime]
--    , [DatabaseUser]
--    , [Event]
--    , [Schema]
--    , [Object]
--    , [TSQL]
--    , [XmlEvent]
--	INTO #TMPDBLOG
--FROM [DatabaseLog]
--WHERE [Event]='CREATE_TABLE'

SELECT
	*
FROM #TMPDBLOG

--DROP TABLE #TMPDBLOG
-- Mi primer Insert
--INSERT INTO #TMPDBLOG (
--    [PostTime]
--    , [DatabaseUser]
--    , [Event]
--    , [Schema]
--    , [Object]
--    , [TSQL]
--    , [XmlEvent]
--)
--VALUES (
--	GETDATE(),
--	'dbo',
--	'CREATE_TABLE',
--	'dbo',
--	'ErrorLog',
--	'CREATE TABLE [dbo].[ErrorLog](      [ErrorLogID] [int] IDENTITY (1, 1) NOT NULL,      [ErrorTime] [datetime] NOT NULL CONSTRAINT [DF_ErrorLog_ErrorTime] DEFAULT (GETDATE()),      [UserName] [sysname] NOT NULL,       [ErrorNumber] [int] NOT NULL,       [ErrorSeverity] [int] NULL,       [ErrorState] [int] NULL,       [ErrorProcedure] [nvarchar](126) NULL,       [ErrorLine] [int] NULL,       [ErrorMessage] [nvarchar](4000) NOT NULL  ) ON [PRIMARY]',
--	'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2023-05-08T12:07:29.243</PostTime><SPID>61</SPID><ServerName>SQL150</ServerName><LoginName>WEST\randolph</LoginName><UserName>dbo</UserName><DatabaseName>AdventureWorks2019</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>ErrorLog</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE [dbo].[ErrorLog](
--    [ErrorLogID] [int] IDENTITY (1, 1) NOT NULL,
--    [ErrorTime] [datetime] NOT NULL CONSTRAINT [DF_ErrorLog_ErrorTime] DEFAULT (GETDATE()),
--    [UserName] [sysname] NOT NULL, 
--    [ErrorNumber] [int] NOT NULL, 
--    [ErrorSeverity] [int] NULL, 
--    [ErrorState] [int] NULL, 
--    [ErrorProcedure] [nvarchar](126) NULL, 
--    [ErrorLine] [int] NULL, 
--    [ErrorMessage] [nvarchar](4000) NOT NULL
--) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>'
--)


-- Insert Select
--INSERT INTO #TMPDBLOG (
--    [PostTime], [DatabaseUser]
--    , [Event], [Schema]
--    , [Object]
--    , [TSQL]
--    , [XmlEvent]
--)
--SELECT 
--	GETDATE()
--    , [DatabaseUser]
--    , [Event]
--    , [Schema]
--    , [Object]
--    , [TSQL]
--    , [XmlEvent]
--FROM [DatabaseLog]
--WHERE [Event]='ALTER_TABLE'



--INSERT INTO #TMPDBLOG (
--    [PostTime]
--    , [DatabaseUser]
--    , [Event]
--    , [Schema]
--    , [Object]
--    , [TSQL]
--    , [XmlEvent]
--)
--SELECT
--	GETDATE(),
--	'dbo',
--	'CREATE_PROCEDURE',
--	'dbo',
--	'ErrorLog',
--	'CREATE TABLE [dbo].[ErrorLog](      [ErrorLogID] [int] IDENTITY (1, 1) NOT NULL,      [ErrorTime] [datetime] NOT NULL CONSTRAINT [DF_ErrorLog_ErrorTime] DEFAULT (GETDATE()),      [UserName] [sysname] NOT NULL,       [ErrorNumber] [int] NOT NULL,       [ErrorSeverity] [int] NULL,       [ErrorState] [int] NULL,       [ErrorProcedure] [nvarchar](126) NULL,       [ErrorLine] [int] NULL,       [ErrorMessage] [nvarchar](4000) NOT NULL  ) ON [PRIMARY]',
--	'<EVENT_INSTANCE><EventType>CREATE_TABLE</EventType><PostTime>2023-05-08T12:07:29.243</PostTime><SPID>61</SPID><ServerName>SQL150</ServerName><LoginName>WEST\randolph</LoginName><UserName>dbo</UserName><DatabaseName>AdventureWorks2019</DatabaseName><SchemaName>dbo</SchemaName><ObjectName>ErrorLog</ObjectName><ObjectType>TABLE</ObjectType><TSQLCommand><SetOptions ANSI_NULLS="ON" ANSI_NULL_DEFAULT="ON" ANSI_PADDING="ON" QUOTED_IDENTIFIER="ON" ENCRYPTED="FALSE" /><CommandText>CREATE TABLE [dbo].[ErrorLog](
--    [ErrorLogID] [int] IDENTITY (1, 1) NOT NULL,
--    [ErrorTime] [datetime] NOT NULL CONSTRAINT [DF_ErrorLog_ErrorTime] DEFAULT (GETDATE()),
--    [UserName] [sysname] NOT NULL, 
--    [ErrorNumber] [int] NOT NULL, 
--    [ErrorSeverity] [int] NULL, 
--    [ErrorState] [int] NULL, 
--    [ErrorProcedure] [nvarchar](126) NULL, 
--    [ErrorLine] [int] NULL, 
--    [ErrorMessage] [nvarchar](4000) NOT NULL
--) ON [PRIMARY]</CommandText></TSQLCommand></EVENT_INSTANCE>'

--INSERT INTO TABLA (
	--#COLUMNAS
--)
--SELECT 
	--COLUMNAS
--FROM #TEMPORAL


--=========================================================
--					UPDATE
--=========================================================
-- RECOMENDACION => Antes de un update realiza un select
SELECT 
	*
FROM #TMPDBLOG
--UPDATE #TMPDBLOG SET DatabaseUser='SES'
WHERE [Event] = 'ALTER_TABLE'
AND [Schema]='Production'

-- NIVEL DE RENDIMIENTO

--=========================================================
--					DELETE
--=========================================================
-- RECOMENDACION => Antes de un DELETE realiza un select

--DELETE FROM #TMPDBLOG
--OUTPUT deleted.*
--WHERE [Event]='ALTER_TABLE'


--SELECT*FROM #TMPDBLOG
--TRUNCATE TABLE #TMPDBLOG