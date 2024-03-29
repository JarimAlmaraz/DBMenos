USE [JAlmarazDBMenos]
GO
/****** Object:  StoredProcedure [dbo].[ClienteGetAll]    Script Date: 31/03/2022 05:23:13 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[ClientesAdd]    Script Date: 31/03/2022 05:23:13 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[PagoAdd]    Script Date: 31/03/2022 05:23:13 p. m. ******/
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
/****** Object:  StoredProcedure [dbo].[PagosGetByIdCliente]    Script Date: 31/03/2022 05:23:13 p. m. ******/
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
