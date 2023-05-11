--TABLAS--
CREATE TABLE empresa(
	id int,
	ticker varchar(10),
	nombre varchar,
	pais varchar(20),
	capital_total numeric(100,2),
	industria varchar(100),
	sector varchar(100),
	IPO int,
	PRIMARY KEY(id),
	FOREIGN KEY(ticker) REFERENCES accion(ticker)
);

CREATE TABLE accion(
	ticker varchar(10),
	valor_actual int,
	variracion float,	
	volumen int,
	PRIMARY KEY(ticker)
);

CREATE TABLE cuenta(
	id int,
	nombre varchar(30),
	pais varchar(20),
	fecha_nacimiento date,
	ciudad varchar(20),
	telefono int,
	correo varchar(40),
	contraseña int,
	saldo int,
	divisa varchar(15),
	PRIMARY KEY(id)
);



COPY empresa FROM 'C:\Datos_Empresa - Hoja 1.csv' delimiter '|' csv header;


---ERROR:  la sintaxis de entrada no es válida para tipo integer: «1,A,Agilent Technologies Inc. Common Stock,United States,39417057005.00,Electrical Products,Industrials,1999»
--CONTEXT:  COPY empresa, línea 2, columna id: «1,A,Agilent Technologies Inc. Common Stock,United States,39417057005.00,Electrical Products,Industri...»---
