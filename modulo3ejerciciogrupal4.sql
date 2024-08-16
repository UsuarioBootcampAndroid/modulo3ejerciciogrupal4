CREATE USER userusragain IDENTIFIED BY '123456';
GRANT ALL PRIVILEGES ON * . * TO 'userusragain';
CREATE SCHEMA `userusragainchema` ;
CREATE TABLE usuario(
	id_usuario INT UNSIGNED NOT NULL PRIMARY KEY,
    nombre VARCHAR(200),
    apellido VARCHAR(200),
    contraseña VARCHAR(200),
    zona_horaria TIMESTAMP, 
    genero INTEGER,
    telefono VARCHAR(15)
);
CREATE TABLE registro(
	id_ingreso INT UNSIGNED NOT NULL PRIMARY KEY,
    id_usuario INT UNSIGNED NOT NULL,
    fecha_hora_ingreso DATETIME
);
CREATE TABLE contacto(
	id_contacto INT UNSIGNED NOT NULL PRIMARY KEY,
    id_usuario INT UNSIGNED NOT NULL,
    telefono VARCHAR(15),
    correo_electronico VARCHAR(200)
);
/* Si un usuario tiene muchos registros posibles, y un usuario tiene uno o más contactos 
 * se tiene las siguientes alteraciones en las tablas cuestión de relacionarlas según el 
 * supuesto de partida
 */
ALTER TABLE registro ADD CONSTRAINT fk_registro_usuario FOREIGN KEY (id_ingreso) REFERENCES usuario (id_usuario);
ALTER TABLE contacto ADD CONSTRAINT fk_contacto_usuario FOREIGN KEY (id_contacto) REFERENCES usuario (id_usuario);
SELECT NOW();
SELECT CURRENT_TIMESTAMP; /* SELECT CURRENT_TIMESTAMP();*/
SELECT TIMEDIFF(NOW(), UTC_TIMESTAMP); /*-04:00:00*/
SET time_zone = '-02:00';
SELECT TIMEDIFF(NOW(), UTC_TIMESTAMP);/*-02:00:00*/
SELECT * FROM usuario;
INSERT INTO usuario VALUES (1, 'Usuario 001', 'Usuario 001', '12345678', CURRENT_TIMESTAMP, 1, '+56987654321');
INSERT INTO usuario VALUES (2, 'Usuario 002', 'Usuario 002', '12345678', CURRENT_TIMESTAMP, 1, '+56987654321');
INSERT INTO usuario VALUES (3, 'Usuario 003', 'Usuario 003', '12345678', CURRENT_TIMESTAMP, 2, '+56987654321');
INSERT INTO usuario VALUES (4, 'Usuario 004', 'Usuario 004', '12345678', CURRENT_TIMESTAMP, 2, '+56987654321');
INSERT INTO usuario VALUES (5, 'Usuario 005', 'Usuario 005', '12345678', CURRENT_TIMESTAMP, 1, '+56987654321');
INSERT INTO usuario VALUES (6, 'Usuario 006', 'Usuario 006', '12345678', CURRENT_TIMESTAMP, 1, '+56987654321');
INSERT INTO usuario VALUES (7, 'Usuario 007', 'Usuario 007', '12345678', CURRENT_TIMESTAMP, 2, '+56987654321');
INSERT INTO usuario VALUES (8, 'Usuario 008', 'Usuario 008', '12345678', CURRENT_TIMESTAMP, 1, '+56987654321');
SELECT * FROM registro;
INSERT INTO registro VALUES (1, 1, NOW());
INSERT INTO registro VALUES (2, 2, NOW());
INSERT INTO registro VALUES (3, 3, NOW());
INSERT INTO registro VALUES (4, 4, NOW());
INSERT INTO registro VALUES (5, 5, NOW());
INSERT INTO registro VALUES (6, 6, NOW());
INSERT INTO registro VALUES (7, 7, NOW());
INSERT INTO registro VALUES (8, 8, NOW());
SELECT * FROM contacto;
INSERT INTO contacto VALUES (1, 1, '+56987654321', 'correo@correo.com');
INSERT INTO contacto VALUES (2, 2, '+56987654321', 'correo@correo.com');
INSERT INTO contacto VALUES (3, 3, '+56987654321', 'correo@correo.com');
INSERT INTO contacto VALUES (4, 4, '+56987654321', 'correo@correo.com');
INSERT INTO contacto VALUES (5, 5, '+56987654321', 'correo@correo.com');
INSERT INTO contacto VALUES (6, 6, '+56987654321', 'correo@correo.com');
INSERT INTO contacto VALUES (7, 7, '+56987654321', 'correo@correo.com');
INSERT INTO contacto VALUES (8, 8, '+56987654321', 'correo@correo.com');