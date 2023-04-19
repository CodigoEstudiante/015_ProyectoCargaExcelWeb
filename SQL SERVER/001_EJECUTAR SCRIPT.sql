
USE master

GO

CREATE DATABASE DBCARGA

GO

USE DBCARGA

GO

CREATE TABLE INFORMACION(
Data1 varchar(50),
Data2 varchar(50),
Data3 varchar(50),
Data4 varchar(50)
)

GO

CREATE TYPE [dbo].[EstructuraCarga] AS TABLE(
	[data1] [varchar](max) NULL,
	[data2] [varchar](max) NULL,
	[data3] [varchar](max) NULL,
	[data4] [varchar](max) NULL
)
GO


CREATE procedure usp_cargarInformacion(
@EstructuraCarga EstructuraCarga READONLY,                                      
@Resultado int output
)
as
begin
	
	BEGIN TRY

		INSERT INTO INFORMACION(Data1,Data2,Data3,Data4)
		select data1,data2,data3,data4 from @EstructuraCarga

		SET @Resultado = 1

	END TRY
	BEGIN CATCH
		SET @Resultado = 0
	END CATCH
end

GO

SELECT * FROM INFORMACION