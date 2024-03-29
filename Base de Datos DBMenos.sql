USE [master]
GO
/****** Object:  Database [JAlmarazDBMenos]    Script Date: 31/03/2022 05:23:48 p. m. ******/
CREATE DATABASE [JAlmarazDBMenos]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'JAlmarazDBMenos', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JAlmarazDBMenos.mdf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'JAlmarazDBMenos_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\JAlmarazDBMenos_log.ldf' , SIZE = 1040KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [JAlmarazDBMenos] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [JAlmarazDBMenos].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [JAlmarazDBMenos] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET ARITHABORT OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [JAlmarazDBMenos] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [JAlmarazDBMenos] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [JAlmarazDBMenos] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET  ENABLE_BROKER 
GO
ALTER DATABASE [JAlmarazDBMenos] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [JAlmarazDBMenos] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET RECOVERY FULL 
GO
ALTER DATABASE [JAlmarazDBMenos] SET  MULTI_USER 
GO
ALTER DATABASE [JAlmarazDBMenos] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [JAlmarazDBMenos] SET DB_CHAINING OFF 
GO
ALTER DATABASE [JAlmarazDBMenos] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [JAlmarazDBMenos] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'JAlmarazDBMenos', N'ON'
GO
USE [JAlmarazDBMenos]
GO
/****** Object:  StoredProcedure [dbo].[ClienteGetAll]    Script Date: 31/03/2022 05:23:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClienteGetAll]
AS
SELECT [IdCliente]
      ,[Nombre]
      ,[Telefono]
      ,[Ultimo_pago]
      ,[Fecha_Creacion]
  FROM [dbo].[Clientes]

GO
/****** Object:  StoredProcedure [dbo].[ClientesAdd]    Script Date: 31/03/2022 05:23:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ClientesAdd]
@Nombre VARCHAR(50),
@Telefono INT,
@Ultimo_Pago DATE
AS
INSERT INTO [dbo].[Clientes]
           ([Nombre]
           ,[Telefono]
           ,[Ultimo_pago]
           ,[Fecha_Creacion])
     VALUES
           (@Nombre
           ,@Telefono
           ,@Ultimo_pago
           ,GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[PagoAdd]    Script Date: 31/03/2022 05:23:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[PagoAdd]
@IdCliente INT,
@Monto FLOAT
AS
INSERT INTO [dbo].[Pagos]
           ([IdCliente]
           ,[Monto]
           ,[Fecha_Pago])
     VALUES
           (@IdCliente
           ,@Monto
           ,GETDATE())

GO
/****** Object:  StoredProcedure [dbo].[PagosGetByIdCliente]    Script Date: 31/03/2022 05:23:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PagosGetByIdCliente]
@IdCliente INT
AS
SELECT C.IdCliente, C.Nombre, C.Telefono, P.IdPago, P.Monto, P.Fecha_Pago FROM Clientes C
INNER JOIN Pagos P ON C.IdCliente = P.IdCliente
WHERE C.IdCliente = @IdCliente

GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 31/03/2022 05:23:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Clientes](
	[IdCliente] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Telefono] [int] NULL,
	[Ultimo_pago] [date] NULL,
	[Fecha_Creacion] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Pagos]    Script Date: 31/03/2022 05:23:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pagos](
	[IdPago] [int] IDENTITY(1,1) NOT NULL,
	[IdCliente] [int] NULL,
	[Monto] [float] NULL,
	[Fecha_Pago] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Pagos]  WITH CHECK ADD FOREIGN KEY([IdCliente])
REFERENCES [dbo].[Clientes] ([IdCliente])
GO
USE [master]
GO
ALTER DATABASE [JAlmarazDBMenos] SET  READ_WRITE 
GO
