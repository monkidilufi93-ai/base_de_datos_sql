-- Habilita trabajo con llaves foráneas
PRAGMA foreign_keys = ON; 

-- Tabla prestamos
CREATE TABLE IF NOT EXISTS prestamo(
  id_prestamo INTEGER PRIMARY KEY,
  fecha TEXT NOT NULL,
  cuota REAL,
  plazo TEXT NOT NULL,
  monto REAL NOT NULL
);

-- Tabla cliente
CREATE TABLE IF NOT EXISTS cliente(
  id_cliente INTEGER PRIMARY KEY,
  nombre TEXT NOT NULL,
  apellido TEXT NOT NULL,
  nacionalidad TEXT NOT NULL
);

-- Tabla prestamo - cliente
CREATE TABLE IF NOT EXISTS prestamo_cliente(
  prestamo_id INTEGER NOT NULL,
  cliente_id INTEGER NOT NULL,
  FOREIGN KEY(prestamo_id) REFERENCES prestamo(id_prestamo),
  FOREIGN KEY(cliente_id) REFERENCES cliente(id_cliente),
  PRIMARY KEY(prestamo_id, cliente_id)
);

-- Insertar prestamo (tendrá id_prestamo = 1)
INSERT INTO prestamo(monto, plazo, cuota, fecha)
VALUES(10000, 'seis meses', 6, '01-11-2027');

-- Insertar clientes (tendrán id_cliente 1, 2, 3 y 4)
INSERT INTO cliente(id_cliente, nombre, apellido, nacionalidad)
VALUES(1, 'Pedro', 'Martinez', 'Dominicana');

INSERT INTO cliente(nombre, apellido, nacionalidad)
VALUES('Ramon', 'Ozuna Vilorio', 'Haitiana');

INSERT INTO cliente(nombre, apellido, nacionalidad)
VALUES('Mario', 'Alcantara', 'Estadounidense');

INSERT INTO cliente(nombre, apellido, nacionalidad)
VALUES('Miguel', 'Alvarez Medina', 'Dominicana');

-- Insertar prestamo / cliente (usando el prestamo 1 y cliente 3)
INSERT INTO prestamo_cliente(prestamo_id, cliente_id)
VALUES(1, 3);

-- Consultar prestamo y cliente con INNER JOIN
SELECT 
  cliente.nombre, 
  cliente.apellido, 
  prestamo.monto AS monto_prestamo
FROM prestamo_cliente
  INNER JOIN cliente ON 
    prestamo_cliente.cliente_id = cliente.id_cliente
  INNER JOIN prestamo ON 
    prestamo_cliente.prestamo_id = prestamo.id_prestamo;


