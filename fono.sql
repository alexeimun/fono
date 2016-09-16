/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 100113
 Source Host           : localhost
 Source Database       : fono

 Target Server Type    : MySQL
 Target Server Version : 100113
 File Encoding         : utf-8

 Date: 09/16/2016 16:28:24 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `t_encuentros`
-- ----------------------------
DROP TABLE IF EXISTS `t_encuentros`;
CREATE TABLE `t_encuentros` (
  `ID_ENCUENTRO` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_PACIENTE` bigint(20) DEFAULT NULL,
  `ID_EVALUADOR` bigint(20) DEFAULT NULL,
  `TIEMPO_REALIZACION` varchar(8) DEFAULT NULL,
  `FECHA_CREACION` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_ENCUENTRO`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_encuentros`
-- ----------------------------
BEGIN;
INSERT INTO `t_encuentros` VALUES ('1', '1', '2', '0:18', '2016-09-15 18:42:35');
COMMIT;

-- ----------------------------
--  Table structure for `t_evaluadores`
-- ----------------------------
DROP TABLE IF EXISTS `t_evaluadores`;
CREATE TABLE `t_evaluadores` (
  `ID_EVALUADOR` bigint(20) NOT NULL AUTO_INCREMENT,
  `NOMBRE_EVALUADOR` varchar(80) DEFAULT NULL,
  `CORREO` varchar(80) DEFAULT NULL,
  `CLAVE` varchar(50) DEFAULT NULL,
  `NUMERO_IDENTIFICACION` varchar(20) DEFAULT NULL,
  `TELEFONO` varchar(10) DEFAULT NULL,
  `TOKEN_ID` varchar(40) DEFAULT NULL,
  `SCOPE` bit(1) DEFAULT b'0',
  `FECHA_CREACION` datetime DEFAULT NULL,
  PRIMARY KEY (`ID_EVALUADOR`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_evaluadores`
-- ----------------------------
BEGIN;
INSERT INTO `t_evaluadores` VALUES ('1', 'Deivy Andres Velazco', 'admin', 'admin', null, null, 'b362d9a1945297ff771e88f5b6563efd', b'1', '2016-08-26 17:51:45'), ('2', 'Ralf Hutter', 'ralf', 'ralf', '87819289', '28186899', '03f9f14502760f7c8cd6f33c71fafc20', b'0', '2016-08-27 15:26:07');
COMMIT;

-- ----------------------------
--  Table structure for `t_imagenes`
-- ----------------------------
DROP TABLE IF EXISTS `t_imagenes`;
CREATE TABLE `t_imagenes` (
  `ID_IMAGEN` int(4) NOT NULL AUTO_INCREMENT,
  `TITULO_IMAGEN` varchar(70) DEFAULT NULL,
  `NOMBRE_IMAGEN` varchar(50) DEFAULT NULL,
  `CATEGORIA` varchar(50) DEFAULT NULL,
  `SUB_CATEGORIA` varchar(50) DEFAULT NULL,
  `ALTERNA` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_IMAGEN`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_imagenes`
-- ----------------------------
BEGIN;
INSERT INTO `t_imagenes` VALUES ('1', 'Estufa', 'estufa', 'Objetos Semiconcretos ', 'Cocina', ''), ('2', 'Olla', 'olla', 'Objetos Semiconcretos ', 'Cocina', ''), ('3', 'Cucharón', 'cucharon', 'Objetos Semiconcretos ', 'Cocina', ''), ('4', 'Perro', 'perro', 'Objetos Semiconcretos ', 'Animales', 'Domesticos'), ('5', 'Gato', 'gato', 'Objetos Semiconcretos ', 'Animales', 'Domesticos'), ('6', 'Vaca', 'vaca', 'Objetos Semiconcretos ', 'Animales', 'Campo'), ('7', 'León', 'leon', 'Objetos Semiconcretos ', 'Animales', 'Salvajes'), ('8', 'Jirafa', 'jirafa', 'Objetos Semiconcretos ', 'Animales', 'Salvajes'), ('9', 'Silla', 'sillas', 'Objetos Semiconcretos ', 'Muebles de la Casa', ''), ('10', 'Mesa', 'mesa', 'Objetos Semiconcretos ', 'Muebles de la Casa', ''), ('11', 'Cama', 'cama', 'Objetos Semiconcretos ', 'Muebles de la Casa', ''), ('12', 'Moto', 'moto', 'Objetos Semiconcretos ', 'Medios de transporte', ''), ('13', 'Carro', 'carro', 'Objetos Semiconcretos ', 'Medios de transporte', ''), ('14', 'Bicicleta', 'bicicleta', 'Objetos Semiconcretos ', 'Medios de transporte', ''), ('15', 'Banano', 'banano', 'Objetos Semiconcretos ', 'Frutas', ''), ('16', 'Manzana', 'manzana', 'Objetos Semiconcretos ', 'Frutas', ''), ('17', 'Uvas', 'uvas', 'Objetos Semiconcretos ', 'Frutas', ''), ('18', 'Jabón', 'jabon', 'Elementos de Aseo', 'Aseo', 'Aseo'), ('19', 'Champú', 'champoo', 'Elementos de Aseo', 'Aseo', 'Aseo'), ('20', 'Toalla', 'toalla', 'Elementos de Aseo', 'Aseo', 'Aseo'), ('21', 'Cremadental', 'cremadental', 'Elementos de Aseo', 'Aseo', 'Aseo'), ('22', 'Muñeca', 'muneca', 'Objetos Semiconcretos ', 'Otros', ''), ('23', 'Zapato', 'zapato', 'Objetos Semiconcretos ', 'Otros', ''), ('24', 'Pelota', 'pelota', 'Objetos Semiconcretos ', 'Otros', ''), ('25', 'Señor caminando', 'senorcaminando', 'Personas', 'Personas', ''), ('26', 'Señor comiendo', 'senorcomiendo', 'Personas', 'Personas', ''), ('27', 'Niño jugando', 'ninojugando', 'Personas', 'Personas', ''), ('28', 'Niño comiendo', 'ninocomiendo', 'Personas', 'Personas', ''), ('29', 'Señora corriendo', 'senoracorriendo', 'Personas', 'Personas', ''), ('30', 'Señora leyendo', 'senoraleyendo', 'Personas', 'Personas', ''), ('31', 'Niña leyendo', 'ninaleyendo', 'Personas', 'Personas', ''), ('32', 'Señora nadando', 'senoranadando', 'Personas', 'Personas', ''), ('33', 'Zapato negro', 'zapatonegro', 'Otros', 'Parejas', ''), ('34', 'Zapato blanco', 'zapatoblanco', 'Otros', 'Parejas', ''), ('35', 'Niño gordo', 'ninogordo', 'Personas', 'Parejas', ''), ('36', 'Niño flaco', 'ninoflaco', 'Personas', 'Parejas', ''), ('37', 'Niña', 'nina', 'Personas', 'Parejas', ''), ('38', 'Señora', 'senora', 'Personas', 'Parejas', ''), ('39', 'Cuaderno', 'cuaderno', 'Objetos Semiconcretos ', 'Otros', ''), ('40', 'Medias', 'medias', 'Objetos Semiconcretos ', 'Otros', ''), ('41', 'Reloj de pulso', 'relojdepulsera', 'Objetos Semiconcretos ', 'Otros', ''), ('42', 'Televisor', 'televisor', 'Objetos Semiconcretos ', 'Otros', ''), ('43', 'Bañarse', 'banarse', 'Objetos Semiconcretos ', 'Otros', ''), ('44', 'Ir a piscina', 'irapiscina', 'Objetos Semiconcretos ', 'Otros', ''), ('45', 'Abuela', 'abuela', 'Personas', 'Personas', ''), ('46', 'Señor del transporte', 'senordeltransporte', 'Personas', 'Personas', ''), ('47', 'Mucho Espagueti', 'muchoespagueti', 'Comida', 'Mucho', ''), ('48', 'Poco Espagueti', 'pocoespagueti', 'Comida', 'Poco', ''), ('49', 'Vaso lleno', 'vasolleno', 'Comida', 'Lleno', ''), ('50', 'Vaso vacío', 'vasovacio', 'Comida', 'Vacio', ''), ('51', 'Pastel todo', 'pasteltodo', 'Comida', 'Todo', ''), ('52', 'Pastel nada', 'pastelnada', 'Comida', 'Nada', ''), ('53', 'Niño más bombones', 'ninomasbombones', 'Personas', 'Mas', ''), ('54', 'Niño menos bombones', 'ninomenosbombones', 'Personas', 'Menos', ''), ('55', 'Niña desayuna', 'ninadesayuna', 'Personas', 'Personas', ''), ('56', 'Niña se cepilla', 'ninasecepillalosdientes', 'Personas', 'Personas', ''), ('57', 'Niño pela un banano', 'ninopelaunbanano', 'Personas', 'Personas', ''), ('58', 'Niño come banano', 'ninocomebanano', 'Personas', 'Personas', ''), ('59', 'Niño se pone medias', 'ninomedias', 'Personas', 'Personas', ''), ('60', 'Niño se pone zapatos', 'ninozapatos', 'Personas', 'Personas', ''), ('61', 'Mama compra mercado', 'mamacompramercado', 'Personas', 'Personas', ''), ('62', 'Mama cocina', 'mamacocina', 'Personas', 'Personas', ''), ('63', 'Papa, mama e hijos sentados comiendo', 'papamamaehijocomiendo', 'Personas', 'Personas', ''), ('64', 'Niño se baña', 'ninosebana', 'Personas', 'Personas', ''), ('65', 'Niño se pone pantalón', 'ninoseponepantalon', 'Personas', 'Personas', ''), ('66', 'Niño vestido se peina', 'ninovestidosepeina', 'Personas', 'Personas', ''), ('67', 'Niño va para el colegio', 'ninovaparaelcolegio', 'Personas', 'Personas', ''), ('68', 'Niño globo en mano', 'ninogloboenmano', 'Personas', 'Personas', ''), ('69', 'Niño infla globo pequeño', 'ninoinflaglobopequeno', 'Personas', 'Personas', ''), ('70', 'Niño infla globo mediano', 'ninoinflaglobomediano', 'Personas', 'Personas', ''), ('71', 'Niño infla globo grande', 'ninoinflaglobogrande', 'Personas', 'Personas', ''), ('72', 'Niño explota globo', 'ninoexplotaglobo', 'Personas', 'Personas', ''), ('73', 'Vaso roto en el piso', 'vasoroto', 'Objetos Semiconcretos ', 'Parejas', ''), ('74', 'Vaso sobre la mesa', 'vasosobremesa', 'Objetos Semiconcretos ', 'Parejas', ''), ('75', 'Casa incendiada', 'casaincendiada', 'Objetos Semiconcretos ', 'Parejas', ''), ('76', 'Casa inundada', 'casainundada', 'Objetos Semiconcretos ', 'Parejas', ''), ('77', 'Niño tropieza', 'ninotropieza', 'Personas', 'Parejas', ''), ('78', 'Niño camina', 'ninocamina', 'Personas', 'Parejas', ''), ('79', 'Niño lanzando pelota', 'ninolanzandopelota', 'Personas', 'Parejas', ''), ('80', 'Niño jugando pelota', 'ninojugandopelota', 'Personas', 'Parejas', ''), ('81', 'Niño bañandose', 'ninobanandose', 'Personas', 'Parejas', ''), ('82', 'Niño con saco', 'ninoconsaco', 'Personas', 'Parejas', ''), ('83', 'Niño con el médico', 'ninoconelmedico', 'Personas', 'Parejas', ''), ('84', 'Niño en el párque', 'ninoenelparque', 'Personas', 'Parejas', ''), ('85', 'Lavar el carro', 'lavarelcarro', 'Otros', 'Parejas', ''), ('86', 'Carro en el mecánico', 'carroconelmecanico', 'Otros', 'Parejas', ''), ('87', 'Coser pantalón', 'coserpantalon', 'Otros', 'Parejas', ''), ('88', 'Planchar pantalón', 'plancharpantalon', 'Otros', 'Parejas', ''), ('89', 'Pato', 'pato', 'Objetos Semiconcretos ', 'Animales', 'Campo'), ('90', 'Escoba', 'escoba', 'Elementos de aseo', 'Otros', null), ('91', 'Billete', 'billete', 'Otros', 'Otros', null), ('92', 'Tijeres', 'tijeras', 'Otros', 'Otros', null), ('93', 'Peinilla', 'peinilla', 'Otros', 'Otros', null), ('94', 'Señor dormido', 'senordormido', 'Personas', 'Personas', null), ('95', 'Zapato Negro Pequeño', 'zapatonegropequeno', 'Otros', 'Tamaño', null), ('96', 'Zapato Blanco Grande', 'zapatoblancogrande', 'Otros', 'Tamaño', null), ('97', 'Ver televisión', 'vertv', 'Personas', 'Personas', null), ('98', 'Caballo', 'caballo', 'Animales', 'Animales', 'Campo'), ('99', 'Pollito', 'pollito', 'Animales', 'Animales', 'Campo'), ('100', 'Descargar la cisterna del baño', 'bano', 'Otros', 'Otros', null), ('101', 'Lluvia', 'lluvia', 'Otros', 'Otros', null), ('102', 'Trueno', 'trueno', 'Otros', 'Otros', null), ('103', 'Avión', 'avion', 'Objetos semiconcretos', 'Medios de transporte', null), ('104', 'Llanto de bebé', 'llantodebebe', 'Otros', 'Otros', null), ('105', 'Estornudar', 'estornudar', 'Otros', 'Otros', null), ('106', 'Aplaudir', 'aplaudir', 'Otros', 'Otros', null), ('107', 'Reir', 'reir', 'Otros', 'Otros', null), ('108', 'Toser', 'toser', 'Otros', 'Otros', null);
COMMIT;

-- ----------------------------
--  Table structure for `t_pacientes`
-- ----------------------------
DROP TABLE IF EXISTS `t_pacientes`;
CREATE TABLE `t_pacientes` (
  `ID_PACIENTE` bigint(20) NOT NULL AUTO_INCREMENT,
  `NUMERO_IDENTIFICACION` varchar(20) DEFAULT NULL,
  `TIPO_IDENTIFICACION` varchar(20) DEFAULT NULL,
  `SEXO` bit(1) DEFAULT NULL,
  `NOMBRES_PACIENTE` varchar(80) DEFAULT NULL,
  `APELLIDOS_PACIENTE` varchar(80) DEFAULT NULL,
  `FECHA_NACIMIENTO` date DEFAULT NULL,
  `NOMBRE_ACUDIENTE` varchar(80) DEFAULT NULL,
  `DIRECCION_RESIDENCIA` varchar(100) DEFAULT NULL,
  `TELEFONO_RESIDENCIA` varchar(10) DEFAULT NULL,
  `FECHA_CREACION` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_PACIENTE`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_pacientes`
-- ----------------------------
BEGIN;
INSERT INTO `t_pacientes` VALUES ('1', '1876876', 'CC', b'0', 'Candulfo ', 'Agriera Morales', '2006-08-08', 'Julian Calderon Mercedez', 'cll 34-34', '2213456', '2016-08-26 17:55:07');
COMMIT;

-- ----------------------------
--  Table structure for `t_preguntas`
-- ----------------------------
DROP TABLE IF EXISTS `t_preguntas`;
CREATE TABLE `t_preguntas` (
  `ID_PREGUNTA` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_TIPO_APLICACION` int(1) DEFAULT NULL,
  `MATERIAL` varchar(400) DEFAULT NULL,
  `TITULO_PREGUNTA` varchar(100) DEFAULT NULL,
  `INSTRUCCION` varchar(400) DEFAULT NULL,
  `ORACIONES` varchar(300) DEFAULT NULL,
  `PALABRAS` varchar(300) DEFAULT NULL,
  `SITUACION` varchar(300) DEFAULT NULL,
  `CRITERIO_ACEPTACION` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`ID_PREGUNTA`),
  KEY `ID_TIPO_APLICACION` (`ID_TIPO_APLICACION`),
  CONSTRAINT `t_preguntas_ibfk_1` FOREIGN KEY (`ID_TIPO_APLICACION`) REFERENCES `t_tipo_aplicaciones` (`ID_TIPO_APLICACION`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_preguntas`
-- ----------------------------
BEGIN;
INSERT INTO `t_preguntas` VALUES ('1', '1', 'Objetos semiconcretos de la cocina (estufa, olla, cucharón).\nAnimales (perro, gato, pato, vaca, león, jirafa). Muebles\nde la casa (silla, mesa, cama). Medios de transporte\n(moto, carro, bicicleta). Frutas: (banano, manzana, uvas).\nElementos de aseo: (jabón, champú, toalla, crema dental).\nOtros (muñeca, zapato, pelota). Este material puede ser\nsustituido por láminas.', 'Identificación de objetos ', 'El material se presentará en grupos de dos, tres o cuatro\nelementos, dependiendo del nivel de desarrollo del usuario.\nMuéstrame…\nDónde está…\nPásame…', null, null, null, 'Se valida cualquier intento de identificación (señalamiento,\nmirada dirigida, acercamiento). Así como la respuesta\nverbal, independiente de las fallas articulatorias.'), ('2', '1', 'Objetos semiconcretos de la cocina (estufa, olla, cucharón).\nAnimales (perro, gato, pato, vaca, león, jirafa). Muebles\nde la casa (silla, mesa, cama). Medios de transporte\n(moto, carro, bicicleta). Frutas: (banano, manzana, uvas).\nElementos de aseo: (jabón, champú, toalla, crema dental).\nOtros (muñeca, zapato, pelota). Este material puede ser\nsustituido por láminas.', 'Nominación de objetos ', 'Dime qué es…', null, null, null, 'Se validan todas las producciones verbales, no verbales,\ngestos y movimientos que representen el objeto que esta\nnominando'), ('3', '1', 'Este material se empleará como apoyo visual de ser\nnecesario. Presentar láminas por parejas: tijeras', 'Identificación de las funciones de los objetos', '¿Qué necesito para cortar?\n¿Qué necesito para tomar la sopa?\n¿Qué necesito para peinarme?\n¿Qué necesito para comprar?', null, null, null, 'Se valida cualquier intento de identificación (producciones\nverbales, no verbales señalamiento, mirada dirigida,\nacercamiento).'), ('4', '1', 'Objetos semiconcretos de la cocina, animales domésticos\ny salvajes, muebles de la casa. Este materia', 'Categorización de objetos ', 'Ayúdame a organizar estos objetos / láminas.\nArma grupos con los objetos / láminas que tienes allí.', null, null, null, 'Se toma en cuenta la cantidad de variables por las cuales\nrealiza los grupos. Se validan las producciones verbales,\nno verbales y la manipulación.'), ('5', '1', 'Presentar láminas por parejas\nSeñor caminando - dormido\nNiño jugando - comiendo\nSeñora corriendo - leyendo\nNiña leyendo - nadando', 'Identificación de acciones', '¿Dónde está el señor caminando?\n¿Dónde está el niño jugando?\n¿Dónde está la señora corriendo?\n¿Dónde está la niña leyendo?', null, null, null, 'Se valida cualquier intento de identificación (señalamiento,\nmirada dirigida, acercamiento).'), ('6', '1', 'Caja con material semiconcreto u otros materiales del contexto inmediato.', 'Interés por el entorno físico', 'Observar si el usuario se interesa por abrir la caja, por el\r\nmaterial nuevo o si estando en un espacio libre entra una\r\npersona nueva y él reacciona, se da cuenta.', null, null, null, 'Se validan todas las producciones verbales, no verbales y\r\ngestos empleados para manifestar interés por personas,\r\nobjetos y acontecimientos del contexto.'), ('7', '1', '', 'Interés por el entorno social', 'Se evidencia interés por interactuar con pares y/o adultos;\r\nreconoce el nombre de sus compañeros, las reglas sociales.', null, null, null, 'Se validan todas las producciones verbales, no verbales\r\ny gestos.'), ('8', '1', '', 'Exploración del medio', 'Se evidencia en el desplazamiento para explorar el\r\nentorno, la manipulación de los objetos y la exploración\r\ncon la mirada.', null, null, null, 'Se validan todas las intenciones verbales, no verbales,\r\ngestos y movimientos con intención de explorar el medio.'), ('9', '1', '', 'Respuesta consistente al nombre propio.', 'Implica el reconocimiento de la palabra que lo nombra.\r\nSe deben tener en cuenta las variables.\r\nEjemplo: Pipe / Felipe', null, null, null, 'Se validan todas las reacciones, gestos, producciones y\r\naproximaciones verbales'), ('10', '1', '', 'Atención visual', 'Observar si el usuario sigue el movimiento de los objetos\r\ny personas estando en espacio abierto y cerrado.', null, null, null, 'Se validan todas las reacciones y gestos.'), ('11', '1', '» bloques lógicos\r\n» láminas con dibujos por parejas\r\nZapato negro pequeño - zapato blanco grande\r\nNiño gordo - niño flaco\r\nNiña - señora', 'Discriminación de rasgos distintivos.', 'Pásame (en relación con los bloques lógicos):\r\nSolo los grandes\r\nSolo los rojos\r\nAhora (apoyado en las láminas):\r\n¿Cuál de los dos zapatos es el pequeño? (R: el negro).\r\nSi no hay respuesta: Muéstrame', null, null, null, 'Se valida cualquier intento de identificación (producciones\r\nverbales, no verbales señalamiento, mirada dirigida,\r\nacercamiento).'), ('12', '1', 'Objetos en semiconcreto: silla, mesa, moto, muñeca.', 'Comprensión de órdenes simples. ', 'Seleccione la silla,\r\nSeleccione la mesa,\r\nSeleccione la moto,\r\nSeleccione la muñeca,\r\nSeleccione la puerta', null, null, null, 'Se valida solamente la ejecución.'), ('13', '1', 'Objetos en semiconcreto: carro, zapato, muñeca, silla, mesa,\r\nbanano, manzana, perro, gato, pato. (Tenga en cuenta los\r\nelementos que el usuario identificó en el punto 1).', 'Comprensión de órdenes complejas', 'Antes de pasar de una orden a otra, debe cambiar el orden\r\nde los objetos\r\nDame carro, zapato\r\nDame muñeca, silla, mesa\r\nPon la silla sobre la mesa\r\nToma el banano y la manzana guárdalos en la bolsa', null, null, null, 'Se valida solamente la ejecución.'), ('14', '1', 'Presentar láminas con tres opciones:\r\nCuaderno, medias, reloj de pulsera.\r\nVer TV, bañarse, ir a piscina\r\nAbuela, señora, señor del trasporte', 'Comprensión de preguntas.', '¿Qué hay en tu maleta?\n¿Qué hiciste anoche?\n¿Quién te trajo hoy?\n¿Dónde está… (persona, familiar)? Esta última pregunta no tiene apoyo visual', null, null, null, 'Se validan todas las producciones verbales, no verbales\r\ny gestos.'), ('15', '1', 'Láminas por parejas\r\nMucho - poco,\r\nLleno - vacío,\r\nTodo - nada,\r\nMás - menos', 'Noción de cantidad', 'Vamos a hablar sobre estos dibujos.\r\n-¿Cuánto espagueti hay en el plato (señalar poco)?\r\nSi no hay respuesta a la anterior pregunta:\r\n-¿Dónde hay mucho espagueti?\r\nAPLICACIÓN DE LA PRUEBA 9\r\n-A María le gusta el jugo ¿El vaso de María está? (Señalar\r\nel vaso lleno)\r\nSi no hay respuesta a la anterior pregunta:\r\n-¿Dónde está el vaso vacío?\r\n-Juan comió ponqué, ¿cuánto ponqué comió Juan?\r\n(señalar pl', null, null, null, 'Se validan todas las producciones verbales, no verbales\r\ny gestos.'), ('16', '1', 'Secuencias lógicas de 2 a 5 láminas', 'Noción de tiempo', 'Presentar las láminas en desorden\r\nEjemplos no evaluables\r\nLa niña desayuna, la niña se cepilla los dientes. Entonces:\r\nla niña desayuna y después se cepilla los dientes.\r\nEl niño pela un banano, el niño come banano. El niño\r\npela el banano antes de comerlo.\r\nAhora lo vas a hacer tú: (Entregar las láminas en desorden)\r\nEl niño se pone las medias, el niño se pone los zapatos\r\nLa mamá compra mercado', null, null, null, 'Se valida solamente la ejecución.'), ('17', '1', 'Presentar láminas por parejas\r\nVaso roto en piso - vaso sobre mesa\r\nCasa incendiada - casa inundada\r\nNiño tropieza - niño camina\r\nNiño lanzando pelota - niño jugando con pelota', 'Causa - Efecto', 'Apoyado en las láminas, formular las siguientes\r\ninstrucciones:', null, null, null, 'Se validan todas las producciones verbales, no verbales\r\ny gestos.'), ('18', '1', 'Rompecabezas (el número de fichas dependerá del nivel\r\nsensorial, de movilidad y desempeño)', 'Todo - parte', 'Arma el rompecabezas', null, null, null, 'Se valida solamente la ejecución'), ('19', '1', 'Presentar láminas con dos opciones de respuesta:\r\nNiño bañándose, niño con saco\r\nNiño con el médico, niño en el parque\r\nLavar el carro, carro con el mecánico\r\nCoser pantalón, planchar pantalón', 'Medio - Fin', 'Durante una interacción comunicativa preguntar:', null, null, null, 'Se validan todas las producciones verbales, no verbales\r\ny gestos.'), ('20', '1', 'Objetos: perro, gato, pato, silla mesa, pelota. Pueden ser\r\nreemplazados por láminas', 'Memoria visual a corto plazo', 'Se presentan los objetos o láminas en grupos de tres y se\r\ntapa uno. ¿Qué tapé?\r\nSe presentan grupos de tres objetos o láminas y sin que el\r\nusuario se dé cuenta se esconde uno. ¿Qué falta?', null, null, null, 'Se validan todas las producciones verbales, no verbales\r\ny gestos.'), ('21', '1', '', 'Memoria visual a largo plazo', 'Al iniciar la sesión se presentan 3 o 4 elementos y se\r\naclara que al terminar se le preguntará por éstos. Después\r\nde 30 minutos se realizan preguntas sobre los objetos. De\r\nser necesario emplee los objetos (agregando un objeto\r\nnuevo) o láminas para que señale los que le fueron\r\npresentados al iniciar la sesión', null, null, null, 'Se validan todas las producciones verbales, no verbales\r\ny gestos.'), ('22', '1', 'Series sonoras o melodías con aplausos, tambor u otro\r\ninstrumento.\r\nOnomatopeyas\r\nVaca, perro, gato,\r\nVaca, cerdo, pollito', 'Memoria auditiva a corto plazo', 'Vas a escuchar atentamente unos sonidos; cuando yo\r\ntermine vas a repetir o señalar los sonidos que recuerdes.', null, null, null, 'Se validan todas las producciones verbales, no verbales\r\ny gestos'), ('23', '1', 'Series sonoras o melodías con aplausos, tambor u otro\r\ninstrumento.\r\nOnomatopeyas\r\nVaca, perro, gato,\r\nVaca, cerdo, pollito', 'Memoria auditiva a largo plazo.', 'Luego de un plazo aproximado de 30 a 45 minutos,\r\npreguntar:\r\n¿Recuerdas los sonidos que escuchaste?', null, null, null, 'Se validan todas las producciones verbales, no verbales\r\ny gestos.'), ('24', '1', 'Series de dígitos\n2, 8\n8, 9, 6\n6, 7, 8, 3\n7, 2, 1, 3, 4', 'Imitación inmediata de estímulos verbales. ', 'Repite lo que te voy a decir, pon mucha atención pues no\nte lo puedo volver a decir.', 'El niño toma jugo\nEl gato es un animal pequeño\nLa jirafa tiene el cuello muy largo', '(combinar: X1 X2, X3, X4)\nSol, pan, tambor, cama, paloma, helado, camiseta,\nelefante.', null, 'Se valida solamente la ejecución.'), ('25', '1', '', 'Imitación inmediata de acciones', 'Mira muy bien lo que voy a hacer, cuando termine el\r\nmovimiento, hazlo igual que yo.\r\nAPLICACIÓN DE LA PRUEBA 12\r\nTocarse la oreja con una de las manos.\r\nCogerse el cabello.\r\nTocarse con el dedo índice la boca.\r\nPonerse la mano en la frente.', null, null, null, 'Se valida solamente la ejecución.'), ('26', '1', '', 'Imitación diferida de estímulos verbales.', 'Luego de un plazo aproximado de 30 a 45 minutos,\r\npreguntar:\r\n¿Recuerdas los números, onomatopeyas, palabras u\r\noraciones que escuchaste? (el evaluador selecciona el\r\nestímulo que se debe evocar)', null, null, null, 'Se valida solamente la ejecución.'), ('27', '1', '', 'Imitación diferida de acciones.', '¿Cómo haces para comer?\r\n¿Cómo te peinas?\r\n¿Cómo hace la mamá cuando se pone brava?\r\n¿Cómo (incluir una acción relevante realizada por un par o\r\nadulto significativo)?', null, null, null, 'Se valida solamente la ejecución.\r\nFORMA DE LENGUAJE.\r\nFonología.'), ('28', '2', 'Láminas de apoyo:\r\nPerro - gato, vaca - pollito, caballo - gato\r\nPueden ser sustituidos por objetos en semiconcreto', 'Identificación sonidos onomatopéyicos.', 'Vas a escuchar unos sonidos. Debes estar muy atento\r\nporque no los voy a repetir. Tú dime o señala qué suena.', null, null, null, 'Se valida cualquier intento de identificación (nominación,\r\nseñalamiento, mirada dirigida, acercamiento).'), ('29', '2', 'Láminas de apoyo:\r\nLluvia - moto, trueno - avión, descargar la cisterna del\r\nbaño - lluvia\r\nCD con sonidos del medio ambiente.', 'Identificación de sonidos ambientales.', 'Vas a escuchar unos sonidos. Debes estar muy atento\r\nporque no los voy a repetir. Tú dime o señala qué suena.', null, null, null, 'Se valida cualquier intento de identificación (nominación,\r\nseñalamiento, mirada dirigida, acercamiento).'), ('30', '2', 'Láminas de apoyo: estornudar - toser, llanto de bebé -\r\ntoser, risa - aplaudir.\r\nCD con sonidos producidos con el cuerpo.', 'Identificación sonidos del propio cuerpo.', 'Vas a escuchar unos sonidos. Debes estar muy atento\r\nporque no los voy a repetir. Tú dime o señala qué suena.', null, null, null, 'Se valida cualquier intento de identificación (nominación,\r\nseñalamiento, mirada dirigida, acercamiento).'), ('31', '2', 'Aplausos o tambor', 'Reproducción de ritmos.', 'Vas escuchar muy bien lo que voy a hacer, voy a aplaudir\r\nvaria veces y tú lo haces después. Tienes que estar muy\r\natento porque no lo voy a repetir:\r\nEjemplo:\r\n0 0\r\nRitmos:\r\n00\r\n0 00\r\n00 00\r\n0 00 0', null, null, null, 'Se valida solamente la ejecución. Tener en cuenta cantidad,\r\nvelocidad, intensidad. Realizar la respectiva anotación en\r\nobservaciones.\r\nFonética'), ('32', '2', 'Espejo.', 'Ejecución de praxias orofaciales. ', 'Observar labios, lengua, mandíbula, mejillas y velo durante\r\nla ejecución de movimientos de lateralización, elevación,\r\ndescenso, protrusión, retracción.\r\nAlgunos ejemplos:\r\n» Abrir y cerrar la boca\r\n» Sacar la lengua\r\n» Mover la lengua de derecha a izquierda / arriba - abajo\r\n» Dar un beso\r\n» Sonreír\r\n» Inflar mejillas', null, null, null, 'Se valida solamente la ejecución. Se sugiere realizar una\r\nanotación en las observaciones acerca del estado de los\r\nórganos fonoarticuladores –OFA–'), ('33', '2', '', 'Producciones orales.', 'Se observan las producciones de habla espontánea y dirigida.\nAPLICACIÓN DE LA PRUEBA 14\nPRODUCCIONES PRE LOCUTIVAS: producciones prelingüísticas\ngrito, llanto, sonidos guturales, balbuceo.\nAPROXIMACIONES VERBALES: incluye jerga, palabras\nque se aproximan al modelo adulto pero aún no son\ninteligibles.\nPALABRAS AISLADAS: corresponde a nombres, aquí\nse reconoce la generalización es decir la utilizaci', null, null, null, 'En este ítem se califica un aspecto de los cinco.\nRealizar en observaciones una anotación sobre la\ninteligibilidad del habla y la fluidez verbal.'), ('34', '3', null, 'Contacto visual. ', null, null, null, 'Con el interlocutor\nCon los objetos', 'El contacto visual constituye el requisito mínimo para\nlograr una interacción comunicativa efectiva.'), ('35', '3', null, 'Toma de turnos.', null, null, null, 'En conversación\nEn acción\n', 'Es importante tener en cuenta el periodo de latencia, es\ndecir el tiempo entre el estímulo y la respuesta'), ('36', '3', null, 'Iniciativa.', null, null, null, 'Comunicativa\nLúdica', 'Analiza los roles activos o pasivos dentro de la interacción\ny la acción.'), ('37', '3', null, 'Contextualización', null, null, null, 'En conversación\nEn acción', 'Se evidencia cuando el usuario realiza preguntas,\ncomentarios o aportes acorde con la situación, el contexto\ne interlocutor.'), ('38', '3', null, 'Atención intersubjetiva', null, null, null, 'En conversación\nEn acción', 'Se evidencia cuando el usuario está atento a lo que sucede\nen el contexto y con el par.'), ('39', '3', null, 'Normas de cortesía. ', null, null, null, 'En conversación\nEn acción', 'Reconocimiento del rol social; se relacionan con la noción\nde tiempo y la ejecución de rutinas.'), ('40', '3', null, 'Llama la atención. ', null, null, null, 'En conversación\nEn acción', 'Llama la atención de alguien o requiere la presencia de\notra persona para realizar una tarea. Solicita la atención\nde los demás llamándolos por su nombre, a través del\ncontacto visual, una producción oral, acercándose,\nseñalando, gritando, con pataleta. '), ('41', '3', null, 'Solicitud de acción, información y objetos.', null, null, null, 'En conversación\nEn acción, usted puede omitir información esencial para\nla realización de una tarea nueva o poco familiar para el\nniño, como un nuevo juego.', 'Se valida la solicitud a través de emisiones orales, gestos,\nseñalamientos, mirada alterna entre el objeto deseado y\nel adulto más próximo.'), ('42', '3', null, 'Satisfacción de necesidades', null, null, null, 'En conversación\nEn acción', 'Satisface necesidades físicas, cognitivas y afectivas. Lo\nhace a través de emisiones orales, gestos o señalamientos.'), ('43', '3', null, 'Responde preguntas', null, null, null, 'En conversación\nEn acción', 'Lo hace a través de emisiones orales, gestos o\nseñalamientos.'), ('44', '3', null, 'Afirma o niega.', null, null, null, 'En conversación\nEn acción', 'Lo hace a través de emisiones orales o gestos.'), ('45', '3', null, 'Informa', null, null, null, 'En conversación\nEn acción', 'Informa acerca de situaciones compartidas o no\ncompartidas con su interlocutor a través de emisiones\norales, deícticos o gestos.');
COMMIT;

-- ----------------------------
--  Table structure for `t_respuesta_evaluador`
-- ----------------------------
DROP TABLE IF EXISTS `t_respuesta_evaluador`;
CREATE TABLE `t_respuesta_evaluador` (
  `ID_RESPUESTA_EVALUADOR` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_PREGUNTA` bigint(20) DEFAULT NULL,
  `ID_ENCUENTRO` bigint(20) DEFAULT NULL,
  `RESPONDIO` bit(1) DEFAULT b'0',
  `AYUDA_INDEPENDIENTE` bit(1) DEFAULT NULL,
  `AUDITIVO_VISUAL` bit(1) DEFAULT NULL,
  `CONSISTENTE_INCONSISTENTE` bit(1) DEFAULT NULL,
  `VERBAL_NOVERBAL` bit(1) DEFAULT NULL,
  `OBSERVACIONES` varchar(500) DEFAULT NULL,
  `FECHA_CREACION` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_RESPUESTA_EVALUADOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_respuesta_pacientes`
-- ----------------------------
DROP TABLE IF EXISTS `t_respuesta_pacientes`;
CREATE TABLE `t_respuesta_pacientes` (
  `ID_RESPUESTA_PACIENTE` bigint(20) NOT NULL AUTO_INCREMENT,
  `ID_ENCUENTRO` bigint(20) DEFAULT NULL,
  `ID_PREGUNTA` bigint(20) DEFAULT NULL,
  `RESPUESTA` varchar(100) DEFAULT NULL,
  `TIEMPO_RESPUESTA` varchar(8) DEFAULT NULL,
  `FECHA_CREACION` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`ID_RESPUESTA_PACIENTE`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
--  Table structure for `t_tipo_aplicaciones`
-- ----------------------------
DROP TABLE IF EXISTS `t_tipo_aplicaciones`;
CREATE TABLE `t_tipo_aplicaciones` (
  `ID_TIPO_APLICACION` int(1) NOT NULL AUTO_INCREMENT,
  `NOMBRE_TIPO_APLICACION` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID_TIPO_APLICACION`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `t_tipo_aplicaciones`
-- ----------------------------
BEGIN;
INSERT INTO `t_tipo_aplicaciones` VALUES ('1', 'Contenido del lenguaje'), ('2', 'Forma del lenguaje'), ('3', 'Uso del lenguaje');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
