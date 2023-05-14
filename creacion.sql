CREATE TABLE CORREO(
	correo varchar(40), 
	contraseña int,
	primary key(correo)
);


CREATE TABLE PAIS(
	id int,
	nombre varchar(40),
	primary key(id)
);


CREATE TABLE SECTOR(
	id int,
	nombre varchar(40),
	primary key(id)
);


CREATE TABLE EMPRESA(
	ticker varchar(15),
	nombre varchar,
	id_pais int,
	capital_total float,
	id_sector int,
	IPO int,
	primary key(ticker),
	foreign key(id_pais) references PAIS(id),
	foreign key(id_sector)references SECTOR(id)

);


CREATE TABLE ACCION(
	ticker varchar(15),
	valor_actual float NOT NULL,
	variacion float,
	volumen int,
  tipo int,
	primary key(ticker),
	foreign key(ticker) references EMPRESA(ticker)
);


CREATE TABLE DIVISA(
	codigo int,
	nombre_divisa varchar(40),
	primary key(codigo)
);


CREATE TABLE CUENTA(
	id int,
	nombre varchar(40) NOT NULL,
	pais varchar(40),
	fecha_nacimiento date,
	telefono varchar(20),
	correo_cuenta varchar(40),
	saldo float NOT NULL,
	codigo_divisa int NOT NULL,
	primary key(id),
	foreign key(codigo_divisa) references DIVISA(codigo),
	foreign key(correo_cuenta) references CORREO(correo)
);


CREATE TABLE MOVIMIENTO(
  id int,
  cantidad int NOT NULL,
  precio int NOT NULL,
  fecha date,
  divisa varchar(10),
  ticker_accion varchar(15) NOT NULL,
  id_cuenta_origen int NOT NULL,
  id_cuenta_destino int NOT NULL,
  primary key(id),
  foreign key(ticker_accion) references ACCION(ticker),
  foreign key(id_cuenta_origen) references CUENTA(id),
  foreign key(id_cuenta_destino) references CUENTA(id)
);


CREATE TABLE TENER(
	ticker varchar(15),
	id int,
	primary key(ticker,id),
	foreign key(id) references CUENTA(id),
	foreign key(ticker) references ACCION(ticker)
);


CREATE TABLE VALOR_HISTORICO(
	fecha date,
	valor int NOT NULL,
	variacion float NOT NULL,
	ticker varchar(15),
	primary key(ticker, fecha),
	foreign key(ticker) references ACCION(ticker)
);  