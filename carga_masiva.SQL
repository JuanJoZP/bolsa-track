--TABLAS--
CREATE TABLE empresa(
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
	valor_actual varchar(20),
	variacion float,	
	volumen int,
	PRIMARY KEY(ticker)
);

CREATE TABLE cuenta(
	id int,
	nombre varchar(30),
	pais varchar(20),
	fecha_nacimiento date,
	telefono varchar(50),
	correo varchar(40),
	contraseña int,
	saldo int,
	divisa varchar(15),
	PRIMARY KEY(id)
);

CREATE TABLE tener(
	id int,
	ticker varchar(10),
	PRIMARY KEY(id),
	FOREIGN KEY(id) REFERENCES cuenta(id),
	FOREIGN KEY(ticker) REFERENCES accion(ticker)
	
);

CREATE TABLE movimiento(
	id int,
	id_cuenta int,
	cantidad int,
	precio int,
	fehca date,
	divisa varchar(15),
	PRIMARY KEY(id),
	FOREIGN KEY(id_cuenta) REFERENCES cuenta(id)
	
);

CREATE TABLE valor_historico(
	ticker varchar(10),
	variacion float,
	valor int,
	fecha date,
	PRIMARY KEY(ticker),
	FOREIGN KEY(ticker) REFERENCES accion(ticker)

);

--Carga Masiva--
COPY cuenta FROM 'C:\datos_estaticos\cuenta.csv' delimiter ',' csv header;
COPY accion FROM 'C:\datos_estaticos\accion.csv' delimiter ',' csv header;
COPY empresa FROM 'C:\datos_estaticos\empresa.csv' delimiter ',' csv header;
