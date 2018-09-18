create database tienda1;
-- usar base de datos tienda
use tienda1;
-- -----------------------------------------------------
-- Table `tienda1`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS categoria(
  idcategoria INT(10) UNSIGNED NOT NULL AUTO_INCREMENT primary key,
  categoria VARCHAR(50) NOT NULL DEFAULT ''
  )ENGINE =  InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8 ;


-- -----------------------------------------------------
-- Table `tienda1`.`pais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pais (
  Idpais INT(11) NOT NULL AUTO_INCREMENT primary key,
  pais VARCHAR(45) NULL DEFAULT NULL
)ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `tienda1`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS cliente (
  idcliente INT(10) UNSIGNED NOT NULL AUTO_INCREMENT primary key,
  apellidos VARCHAR(30) NOT NULL,
  nombres VARCHAR(50) NOT NULL DEFAULT '',
  email VARCHAR(60) NOT NULL,
  Idpais INT(11) NOT NULL references pais
 )ENGINE = InnoDB
AUTO_INCREMENT = 1;


-- -----------------------------------------------------
-- Table `tienda1`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS empleado (
  idempleado INT(11) NOT NULL AUTO_INCREMENT primary key,
  nombre VARCHAR(45) NULL DEFAULT NULL,
  apepaterno VARCHAR(45) NULL DEFAULT NULL,
  apematerno VARCHAR(45) NULL DEFAULT NULL,
  cargo VARCHAR(45) NULL DEFAULT NULL
  )ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `tienda1`.`articulos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS articulo(
  idarticulo INT(10) UNSIGNED NOT NULL AUTO_INCREMENT primary key,
  idcategoria INT(11) NOT NULL DEFAULT '0',
  nombre VARCHAR(50) NOT NULL DEFAULT '',
  descripcion TEXT NOT NULL,
  precio FLOAT NOT NULL DEFAULT '0',
  foto longblob not null
  )ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `tienda1`.`pedido_encabezado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pedido_encabezado(
  idpedido INT(11) UNSIGNED NOT NULL primary key,
  fecha DATE NOT NULL,
  total DOUBLE NOT NULL,
  idempleado INT(11) NOT NULL references empleado,
  idcliente INT(10) UNSIGNED NOT NULL references cliente
  )ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `tienda1`.`pedido_detalle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS pedido_detalle (
  iddetalle INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  idarticulo INT(10) UNSIGNED NOT null references articulo,
  idpedido INT(11) UNSIGNED NOT NULL references pedido_encabezado,
  precio FLOAT NOT NULL DEFAULT '0',
  cantidad INT(11) NOT NULL DEFAULT '0',
  subtotal FLOAT NOT NULL,
  PRIMARY KEY (iddetalle, idarticulo, idpedido)
  )ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- -----------------------------------------------------
-- Table `tienda1`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuario (
  idusuario INT(11) NOT NULL AUTO_INCREMENT primary key,
  usuario VARCHAR(12) CHARACTER SET 'latin1' NOT NULL DEFAULT '',
  password VARCHAR(255) CHARACTER SET 'latin1' NOT NULL DEFAULT '',
  estado CHAR(2) CHARACTER SET 'latin1' NOT NULL DEFAULT '',
  idempleado INT(11) NOT NULL
  )ENGINE = InnoDB
  AUTO_INCREMENT = 1;
  
  -------------------------------------------------
  -- regitros
  --------------------------------------------------
  
INSERT INTO pais VALUES (1, 'Peru');
INSERT INTO pais VALUES (2, 'Colombia');
INSERT INTO pais VALUES (3, 'Chile');
INSERT INTO pais VALUES (4, 'Bolivia');
INSERT INTO pais VALUES (5, 'Ecuador');


INSERT INTO categoria VALUES (1, 'Implementos de Futbol');
INSERT INTO categoria VALUES (2, 'Implementos de Pesca');
INSERT INTO categoria VALUES (3, 'Implementos de Natacion');
INSERT INTO categoria VALUES (4, 'Implementos de Voley');


INSERT INTO cliente VALUES (1, 'Mendoza Diaz', 'Angelica', 'ang@hotmail.com', 5);
INSERT INTO cliente VALUES (2, 'Ruiz  Villar', 'Jose', 'jos@hormail.com', 3);

INSERT INTO pedido_encabezado VALUES (1, '2006-05-26', 500, 3, 2);
INSERT INTO pedido_encabezado VALUES (2, '2015-06-18', 280, 3, 1);


INSERT INTO pedido_detalle VALUES (1, 4, 1, 250, 2, 500);
INSERT INTO pedido_detalle VALUES (2, 1, 2, 120, 1, 120);
INSERT INTO pedido_detalle VALUES (3, 2, 2, 160, 1, 160);


INSERT INTO articulo VALUES (1, 1,'Polo', 'Polo Adidas color blanci cuello v', 120, '1.jpg');
INSERT INTO articulo VALUES (2, 1,'Zapatilas', 'Zapatillas  adidas color blanco', 160, '2.jp');
INSERT INTO articulo VALUES (3, 1,'Zapatillas', 'zapatila tigre color ngero y blanco', 90, '3.jpg');
INSERT INTO articulo VALUES (4, 1,'Buso', 'buso nike color negro', 250, '4.jpg');
INSERT INTO articulo VALUES (5, 2,'GUANTES DE PESCA', 'Guantes de pesca spinning Hart excelentes acabados diseñados por pescadores. Exterior en lycra elastica mayor confort con el detalle de que  pueden utilizarse como toalla para secar el sudor del rostro. Guantes de pesca spinning zona de muñequera con malla ventilada de secado rapido y cierrre de velcro. Palma de amara para un mejor agarre con orificios de ventilacion', 85, '5.jpg');
INSERT INTO articulo VALUES (6, 2,'GORRA DE PESCA', 'Gorra HART PEAK de visera con  de proteccion solar trasero. Tira ajustable elastica en nuca y malla transpirable lateral', 120, '6.jpg');
INSERT INTO articulo VALUES (7, 2,'CHAQUETAS', '(Impermeabilidad 6.000 mm; transpirabilidad 3.000 gr/m2 24 horas) Â· Clasica chaqueta de wading todoterreno construida con materiales de primera calidad, proporcionando un buen confort termico en cualquier circunstancia ', 320, '7.jpg');
INSERT INTO articulo VALUES (8, 4,'Mizuno Volleyball Shoes', 'Zapatillas Mizuno para Voley (botÃ­n)', 130, '8.jpg');






  

