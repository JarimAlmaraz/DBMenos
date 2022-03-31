
INSERT INTO Clientes (Nombre, Telefono, Ultimo_pago, Fecha_Creacion)
VALUES ('Juan Pérez', 12345, '2020-10-15', '2020-09-01 11:00:00'),
		('John Smith', 564321, '2022-10-15', '2020-08-15 11:00:00')

INSERT INTO Pagos (IdCliente, Monto, Fecha_Pago)
VALUES (1, 200, '2021-09-01 11:00:00'),
	   (2, 300, '2021-08-15 11:00:00'),
	   (1, 110, '2021-10-16 11:20:00'),
	   (2, 87.50, '2021-09-17 19:30:00')

