CREATE TABLE CORREO(
	correo varchar(40), 
	contraseña int,
	primary key(correo)
);


CREATE TABLE MOVIMIENTO(
	id int,
	cantidad int,
	precio int,
	fecha date,
	divisa varchar(15),
  ticker_accion int,
  id_cuenta_origen int,
  id_cuenta_destino int,
	primary key(id),
	foreign key(ticker_accion) references ACCION(ticker),
  foreign key(id_cuenta_origen) references CUENTA(id),
  foreign key(id_cuenta_destino) references CUENTA(id)
	
);


CREATE TABLE DIVISA(
	codigo varchar(5),
	nombre_divisa varchar(20),
	primary key(codigo)
);


CREATE TABLE CUENTA(
	id int,
	nombre varchar(30),
	pais varchar(20),
	fecha_nacimiento date,
	telefono int,
	correo_cuenta varchar(40),
	saldo int,
	codigo_divisa varchar(15),
	primary key(id),
	foreign key(codigo_divisa) references DIVISA(codigo),
	foreign key(correo_cuenta) references CORREO(correo)
);


CREATE TABLE PAIS(
	id int,
	nombre varchar(20),
	primary key(id)
);


CREATE TABLE INDUSTRIA(
	id int,
	nombre varchar(20),
	primary key(id)
);


CREATE TABLE SECTOR(
	id int,
	nombre varchar(20),
	id_industria int,
	foreign key(id_industria) references INDUSTRIA(id)
);


CREATE TABLE EMPRESA(
	ticker int,
	nombre varchar(30),
	id_pais int,
	capital_total int,
	id_industria int,
	IPO int,
	primary key(ticker),
	foreign key(id_pais) references PAIS(id),
	foreign key(id_industria)references INDUSTRIA(id)

);


CREATE TABLE TENER(
	ticker int,
	id int,
	primary key(ticker,id),
	foreign key(id) references CUENTA(id),
	foreign key(ticker) references EMPRESA(ticker)
);


CREATE TABLE ACCION(
	ticker int,
	valor_actual int,
	variacion float,
	volumen int,
	primary key(ticker),
	foreign key(ticker) references EMPRESA(ticker)
);


CREATE TABLE VALOR_HISTORICO(
	fecha date,
	valor int,
	variacion float,
	ticker int,
	foreign key(ticker) references EMPRESA(ticker)
);




