-- MySQL dump 10.13  Distrib 5.5.52, for debian-linux-gnu (x86_64)
--
-- Host: sdfhrty5yhbbher44yt4564gdrtyyywq4.cznwvy0gql2p.us-east-1.rds.amazonaws.com    Database: gyj
-- ------------------------------------------------------
-- Server version	5.5.53-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `almacen_puntas`
--

DROP TABLE IF EXISTS `almacen_puntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacen_puntas` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla ALMACEN_PUNTAS',
  `diametro_mm` decimal(6,2) NOT NULL COMMENT 'Es el diametro de la barra de acero. Este atributo está dado en milímetros',
  `resistencia_mpa` decimal(6,0) NOT NULL COMMENT 'Es la resistencia del acero. Este atributo está dado en megapascales',
  `longitud_m` decimal(6,0) NOT NULL COMMENT 'Longitud de la barra en metros',
  `cantidad` int(11) NOT NULL COMMENT 'Indica la cantidad de unidades de ese tipo de barra',
  `punta_largos_rollo` enum('P','L','R') COLLATE latin1_spanish_ci NOT NULL DEFAULT 'P' COMMENT 'Indica si la barra es una punta, largo o rollo. Punta: es la barra reutilizable. Largo: es la barra estandar completa. Rollo para barras de gran longitud',
  `fecha_comprometida` date DEFAULT NULL,
  `colada` varchar(45) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `proveedor` varchar(45) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacen_puntas`
--

LOCK TABLES `almacen_puntas` WRITE;
/*!40000 ALTER TABLE `almacen_puntas` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacen_puntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacenaje`
--

DROP TABLE IF EXISTS `almacenaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacenaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla ALMACENAJE',
  `cantidad` int(11) NOT NULL COMMENT 'Indica la cantidad de unidades que se almacenan de la línea de producción ya producida',
  `fecha_almacenaje` datetime NOT NULL COMMENT 'Almacena la fecha en que ingresa o sale del almacén la línea de producción correspondiente',
  `linea_produccion_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla LINEA_PRODUCCION, que indica a que línea de producción corresponde el almacenaje',
  `almacenista_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla ALMACENISTA, que indica el ID de la persona realizó ese almacenaje',
  PRIMARY KEY (`id`),
  KEY `fk_almacenaje_linea_produccion1` (`linea_produccion_id`),
  KEY `fk_almacenaje_almacenista_id` (`almacenista_id`),
  CONSTRAINT `fk_almacenaje_almacenista_id` FOREIGN KEY (`almacenista_id`) REFERENCES `almacenista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_almacenaje_linea_produccion1` FOREIGN KEY (`linea_produccion_id`) REFERENCES `linea_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenaje`
--

LOCK TABLES `almacenaje` WRITE;
/*!40000 ALTER TABLE `almacenaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacenaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `almacenista`
--

DROP TABLE IF EXISTS `almacenista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `almacenista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Atributo identificador de la tabla ALMACENISTA. Almacena el nombre(s) de la persona que realiza el almacenaje',
  `contrasena` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena la contraseña encriptada del almacenista. Los permisos de este usuario se controlan por aplicación',
  `email` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena el email del almacenista. Este será usado en caso que el usuario necesite recuperar la contraseña',
  `centro_operacion_id` int(11) NOT NULL COMMENT 'Almacena los permisos del usuario. Los permisos de este usuario se controlan por aplicación',
  PRIMARY KEY (`nombre`,`centro_operacion_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `centrooperacion7_idx` (`centro_operacion_id`),
  CONSTRAINT `centrooperacion7` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `almacenista`
--

LOCK TABLES `almacenista` WRITE;
/*!40000 ALTER TABLE `almacenista` DISABLE KEYS */;
/*!40000 ALTER TABLE `almacenista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor`
--

DROP TABLE IF EXISTS `auditor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `contrasena` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`,`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor`
--

LOCK TABLES `auditor` WRITE;
/*!40000 ALTER TABLE `auditor` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditor_centrooperacion`
--

DROP TABLE IF EXISTS `auditor_centrooperacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auditor_centrooperacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auditor_id` int(11) NOT NULL,
  `centro_operacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kf_auditor_idx` (`auditor_id`),
  KEY `kf_dentrooperacion_idx` (`centro_operacion_id`),
  CONSTRAINT `kf_auditor` FOREIGN KEY (`auditor_id`) REFERENCES `auditor` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `kf_centrooperacion` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditor_centrooperacion`
--

LOCK TABLES `auditor_centrooperacion` WRITE;
/*!40000 ALTER TABLE `auditor_centrooperacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `auditor_centrooperacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barra`
--

DROP TABLE IF EXISTS `barra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomenclatura` varchar(20) COLLATE latin1_spanish_ci NOT NULL,
  `nomenclaturas_alternas` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `diametro_mm` decimal(6,2) DEFAULT NULL,
  `fy_mpa` decimal(6,2) DEFAULT NULL,
  `peso_kg_m` decimal(6,2) DEFAULT NULL,
  `gancho_90_omision_m` decimal(8,4) DEFAULT NULL,
  `gancho_135_omision_m` decimal(8,4) DEFAULT NULL,
  `gancho_180_omision_m` decimal(8,4) DEFAULT NULL,
  `layer_borde` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `layer_relleno` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `area_mm2` decimal(8,4) DEFAULT NULL,
  `gancho_columna_coronacion_m` decimal(8,4) DEFAULT NULL,
  `gancho_columna_arranque_m` decimal(8,4) DEFAULT NULL,
  `traslapo_superior_vigas_m` decimal(8,4) DEFAULT NULL,
  `traslapo_inferior_vigas_m` decimal(8,4) DEFAULT NULL,
  `traslapo_columnas_m` decimal(8,4) DEFAULT NULL,
  `minimo_gancho_90_recomendado_m` decimal(8,4) DEFAULT NULL,
  `minimo_gancho_135_recomendado_m` decimal(8,4) DEFAULT NULL,
  `minimo_gancho_180_recomendado_m` decimal(8,4) DEFAULT NULL,
  `minima_dimension_recomendada_m` decimal(8,4) DEFAULT NULL,
  `minimorum_gancho_90_m` decimal(8,4) DEFAULT NULL,
  `minimorum_gancho_135_m` decimal(8,4) DEFAULT NULL,
  `minimorum_gancho_180_m` decimal(8,4) DEFAULT NULL,
  `minimorum_dimension_m` decimal(8,4) DEFAULT NULL,
  `longitud_maxima_comercial_m` decimal(8,4) DEFAULT NULL,
  `ganancia_metalica_90_m` decimal(8,4) DEFAULT NULL,
  `perdida_metalica_180_m` decimal(8,4) DEFAULT NULL,
  `longitud_chatarra_m` decimal(8,4) DEFAULT NULL,
  `longitud_reutilizable_m` decimal(8,4) DEFAULT NULL,
  `delta_longitud_almacen_m` decimal(8,4) DEFAULT NULL,
  `longitud_transporte_normal_m` decimal(8,4) DEFAULT NULL,
  `maxima_dimension_estribo_m` decimal(8,4) DEFAULT NULL,
  `minimo_diametro_circulos_m` decimal(8,4) DEFAULT NULL,
  `maximo_diametro_circulos_m` decimal(8,4) DEFAULT NULL,
  `maxima_longitud_espiral_m` decimal(8,4) DEFAULT NULL,
  `programar_en_estribadora` tinyint(1) DEFAULT NULL,
  `solo_en_longitudes_estandar` tinyint(1) DEFAULT NULL,
  `solo_en_longitudes_rectas` tinyint(1) DEFAULT NULL,
  `solo_en_paquetes` tinyint(1) DEFAULT NULL,
  `peso_paquete` decimal(5,1) DEFAULT NULL,
  `solo_bajo_pedido` tinyint(1) DEFAULT NULL,
  `unir_cizalla_y_estandar` tinyint(1) DEFAULT NULL,
  `unir_chipas_y_paquetes` tinyint(1) DEFAULT NULL,
  `unir_dobladora_y_chipa` tinyint(1) DEFAULT NULL,
  `unir_dobladora_y_cizalla` tinyint(1) DEFAULT NULL,
  `producto_de_trefilacion` tinyint(1) DEFAULT NULL,
  `referencia_figurado` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `referencia_chipa_paquete` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `unidad_venta_longitud_estandar` enum('unidad','peso') COLLATE latin1_spanish_ci DEFAULT NULL,
  `texto_longitudes_items_estandar` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomenclatura` (`nomenclatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barra`
--

LOCK TABLES `barra` WRITE;
/*!40000 ALTER TABLE `barra` DISABLE KEYS */;
/*!40000 ALTER TABLE `barra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barra_comentario`
--

DROP TABLE IF EXISTS `barra_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `barra_comentario` (
  `comentario_1` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `comentario_2` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fy_general_mpa` decimal(6,2) DEFAULT NULL,
  `modulo_elasticidad_mpa` decimal(6,2) DEFAULT NULL,
  `version_general` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `version_particular` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `para_grafiles_de_mallas` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barra_comentario`
--

LOCK TABLES `barra_comentario` WRITE;
/*!40000 ALTER TABLE `barra_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `barra_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario_centro_produccion`
--

DROP TABLE IF EXISTS `calendario_centro_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendario_centro_produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centro_produccion_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horas_trabajo_dia` decimal(6,3) NOT NULL DEFAULT '0.000',
  `comentario` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_centro_produccionx` (`centro_produccion_id`),
  CONSTRAINT `fk_centro_produccionx` FOREIGN KEY (`centro_produccion_id`) REFERENCES `centro_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario_centro_produccion`
--

LOCK TABLES `calendario_centro_produccion` WRITE;
/*!40000 ALTER TABLE `calendario_centro_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `calendario_centro_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camion`
--

DROP TABLE IF EXISTS `camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `camion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla CAMION',
  `placa` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `longitud_maxima_m` decimal(6,0) NOT NULL COMMENT 'Contiene la lóngitúd máxima del camión. Este atributo está dado en metros',
  `ancho_maximo_m` decimal(6,0) NOT NULL,
  `altura_maxima_m` decimal(6,0) NOT NULL,
  `peso_maximo_ton` decimal(6,0) NOT NULL COMMENT 'Contiene la capacidad máxima del camión. Este atributo está dado en toneladas',
  `volumen_maximo_m3` decimal(6,2) NOT NULL COMMENT 'Contiene la capacidad máxima del camión. Este atributo está dado en metros cúbicos',
  `conductor_encargado` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena el nombre(s) del conductor encargado de transportar la cartilla producida',
  `telefono_movil` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena el número de teléfono del conductor encargado de transportar la cartilla producida',
  PRIMARY KEY (`id`),
  UNIQUE KEY `placa_UNIQUE` (`placa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camion`
--

LOCK TABLES `camion` WRITE;
/*!40000 ALTER TABLE `camion` DISABLE KEYS */;
/*!40000 ALTER TABLE `camion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cancelacion`
--

DROP TABLE IF EXISTS `cancelacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cancelacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla CANCELACION',
  `cantidad` int(11) NOT NULL COMMENT 'Indica la cantidad de unidades que se cancelan de la línea de producción. La cancelación se puede dar en cualquier punto de toda la producción',
  `fecha_cancelacion` date NOT NULL COMMENT 'Almacena la fecha en que se realiza la cancelación',
  `cancelador` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena el nombre(s) de la persona que realiza la cancelación',
  `nota` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Guarda una nota o breve descripción de la cancelación',
  `linea_produccion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cancelacion_linea_produccion1` (`linea_produccion_id`),
  CONSTRAINT `fk_cancelacion_linea_produccion1` FOREIGN KEY (`linea_produccion_id`) REFERENCES `linea_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancelacion`
--

LOCK TABLES `cancelacion` WRITE;
/*!40000 ALTER TABLE `cancelacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `cancelacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cartilla`
--

DROP TABLE IF EXISTS `cartilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cartilla` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla CARTILLA',
  `codigo_nimbus` varchar(15) COLLATE latin1_spanish_ci NOT NULL,
  `referencia_cliente` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Es una referencia dada por el cliente que identifica la cartilla para el control interno del cliente',
  `cabecera_principal` varchar(80) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Identifica el contenido o descripción principal de la cartilla',
  `cabecera_secundaria` varchar(80) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Identifica el contenido o descripción secundario de la cartilla',
  `peso_total_norma_kg` decimal(10,2) NOT NULL COMMENT 'Contiene el peso aproximado en Kilogramos de toda la cartilla a producir',
  `documento_del_negocio` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `direccion_entrega` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Guarda la dirección de entrega de la cartilla ya producida',
  `ciudad_entrega` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Guarda la ciudad de entrega de la cartilla ya producida',
  `persona_contacto` varchar(80) COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Nombre de la persona de contacto para la cartilla enviada',
  `email` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Es un correo electrónico con el cual se envía información de seguimiento a la persona que envió o solicitó la cartilla. (Servidor de correo DDS)',
  `nota` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL COMMENT 'Guarda las anotaciones sobre la cartilla y las notas sobre el estado que se le dió. Aunque no es un campo obligatorio algunos estados requieren que siempre se hagan notas, esta dependencia se manejará por aplicación.',
  `obra_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla OBRA que indica a que obra pertenece la cartilla',
  `estado_cartilla_id` int(11) NOT NULL COMMENT 'Indica el estado en que se encuentra la cartilla',
  `representante_id` int(11) DEFAULT NULL,
  `recepcionista_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartilla_obra1` (`obra_id`),
  KEY `fk_cartilla_estado_cartilla1` (`estado_cartilla_id`),
  KEY `fk_cartilla_representante1` (`representante_id`),
  KEY `fk_cartilla_estado1` (`estado_cartilla_id`),
  KEY `fk_cartilla_obra` (`obra_id`),
  KEY `fk_cartilla_recepcionista1` (`recepcionista_id`),
  KEY `fk_cartilla_recepcionista` (`recepcionista_id`),
  CONSTRAINT `fk_cartilla_estado1` FOREIGN KEY (`estado_cartilla_id`) REFERENCES `estado_cartilla` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartilla_obra` FOREIGN KEY (`obra_id`) REFERENCES `obra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartilla_recepcionista` FOREIGN KEY (`recepcionista_id`) REFERENCES `recepcionista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartilla_representante1` FOREIGN KEY (`representante_id`) REFERENCES `representante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cartilla`
--

LOCK TABLES `cartilla` WRITE;
/*!40000 ALTER TABLE `cartilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `cartilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `causa_paros`
--

DROP TABLE IF EXISTS `causa_paros`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `causa_paros` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definicion` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `causa_paros`
--

LOCK TABLES `causa_paros` WRITE;
/*!40000 ALTER TABLE `causa_paros` DISABLE KEYS */;
/*!40000 ALTER TABLE `causa_paros` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_operacion`
--

DROP TABLE IF EXISTS `centro_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla CENTRO_OPERACION',
  `codigo` varchar(45) COLLATE latin1_spanish_ci DEFAULT ' ',
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Contiene el nombre del centro de operación',
  `secuencia_pedido` int(11) NOT NULL DEFAULT '0',
  `ciudad_region_id` int(11) NOT NULL,
  `telefono` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Contiene el teléfono del centro de operación',
  `direccion` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Contiene la dirección del centro de operación',
  `persona_contacto` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Contiene el nombre de la persona de contacto o encargada del centro de operación',
  `requiere_codigo_aprobacion` tinyint(4) NOT NULL,
  `dias_almacenamiento_y_cargue` int(11) NOT NULL DEFAULT '1',
  `directorio_subida_erp` varchar(200) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `estructura_erp` text COLLATE latin1_spanish_ci,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  KEY `ciudad_region_cdo` (`ciudad_region_id`),
  CONSTRAINT `ciudad_region_cdo` FOREIGN KEY (`ciudad_region_id`) REFERENCES `ciudad_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_operacion`
--

LOCK TABLES `centro_operacion` WRITE;
/*!40000 ALTER TABLE `centro_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_operacion_ciudad_region`
--

DROP TABLE IF EXISTS `centro_operacion_ciudad_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_operacion_ciudad_region` (
  `centro_operacion_id` int(11) NOT NULL,
  `ciudad_region_abastecida_id` int(11) NOT NULL,
  `prioridad_en_la_region` int(11) DEFAULT NULL,
  `dias_de_transporte` int(11) DEFAULT NULL,
  PRIMARY KEY (`centro_operacion_id`,`ciudad_region_abastecida_id`),
  KEY `fk_centro_operacion` (`centro_operacion_id`),
  KEY `fk_ciudad_region` (`ciudad_region_abastecida_id`),
  CONSTRAINT `fk_centro_operacion` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ciudad_region` FOREIGN KEY (`ciudad_region_abastecida_id`) REFERENCES `ciudad_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_operacion_ciudad_region`
--

LOCK TABLES `centro_operacion_ciudad_region` WRITE;
/*!40000 ALTER TABLE `centro_operacion_ciudad_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_operacion_ciudad_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `centro_produccion`
--

DROP TABLE IF EXISTS `centro_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `centro_produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla CENTRO_PRODUCCION',
  `nombre_descripcion` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Indica el nombre o la descripción de una persona, máquina o incluso un tercero que se encarga de realizar la producción',
  `centro_operacion_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla CENTRO_OPERACION que indica a que centro de operación pertenece o está asosiado el centro de producción',
  `color_suave` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `color_fuerte` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `alimentacion_en_rollo` tinyint(4) NOT NULL DEFAULT '0',
  `horas_omision_dias_laborables` decimal(5,2) NOT NULL DEFAULT '8.00',
  `capacidad_instalada_kg_dia` decimal(6,1) NOT NULL DEFAULT '6500.0',
  `rectangulo_posicion_relativa` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`nombre_descripcion`,`centro_operacion_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_centro_produccion_centro_operacion1` (`centro_operacion_id`),
  CONSTRAINT `fk_centro_produccion_centro_operacion1` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `centro_produccion`
--

LOCK TABLES `centro_produccion` WRITE;
/*!40000 ALTER TABLE `centro_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `centro_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ciudad_region`
--

DROP TABLE IF EXISTS `ciudad_region`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ciudad_region` (
  `id` int(11) NOT NULL,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre_UNIQUE` (`nombre`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ciudad_region`
--

LOCK TABLES `ciudad_region` WRITE;
/*!40000 ALTER TABLE `ciudad_region` DISABLE KEYS */;
/*!40000 ALTER TABLE `ciudad_region` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cliente` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `documento` varchar(20) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Puede estar compuesto por el número de NIT o por alguna identificación de la compañía. Es la persona o compañía que solicita acero a un figurador a través del DL NET para sus obras.',
  `nombre` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Guarda el nombre de la compañía.',
  `direccion_oficina` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Dirección de la compañía.',
  PRIMARY KEY (`documento`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_negociaciones_centro_operacion`
--

DROP TABLE IF EXISTS `control_negociaciones_centro_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `control_negociaciones_centro_operacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correo_control_id` int(11) NOT NULL,
  `centro_operacion_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cooreo123_idx` (`correo_control_id`),
  CONSTRAINT `fk_cooreo123` FOREIGN KEY (`correo_control_id`) REFERENCES `correos_control_negociaciones` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_negociaciones_centro_operacion`
--

LOCK TABLES `control_negociaciones_centro_operacion` WRITE;
/*!40000 ALTER TABLE `control_negociaciones_centro_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_negociaciones_centro_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correos_control_atrasos`
--

DROP TABLE IF EXISTS `correos_control_atrasos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correos_control_atrasos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(150) COLLATE latin1_spanish_ci NOT NULL,
  `atraso_entrega` tinyint(4) DEFAULT NULL,
  `atraso_programacion` tinyint(4) DEFAULT NULL,
  `id_centro_operacion` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_00_idx` (`id_centro_operacion`),
  CONSTRAINT `id_00` FOREIGN KEY (`id_centro_operacion`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correos_control_atrasos`
--

LOCK TABLES `correos_control_atrasos` WRITE;
/*!40000 ALTER TABLE `correos_control_atrasos` DISABLE KEYS */;
/*!40000 ALTER TABLE `correos_control_atrasos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `correos_control_negociaciones`
--

DROP TABLE IF EXISTS `correos_control_negociaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `correos_control_negociaciones` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `correo` varchar(150) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `correos_control_negociaciones`
--

LOCK TABLES `correos_control_negociaciones` WRITE;
/*!40000 ALTER TABLE `correos_control_negociaciones` DISABLE KEYS */;
/*!40000 ALTER TABLE `correos_control_negociaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `despachador`
--

DROP TABLE IF EXISTS `despachador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `despachador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Atributo identificador de la tabla DESPACHADOR. Almacena el nombre(s) de la persona que realiza el despachaje',
  `contrasena` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena la contraseña encriptada del despachador. Los permisos de este usuario se controlan por aplicación',
  `email` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena el email del despachador. Este será usado en caso que el usuario necesite recuperar la contraseña',
  `centro_operacion_id` int(11) NOT NULL COMMENT 'Almacena los permisos del usuario. Los permisos de este usuario se controlan por aplicación',
  PRIMARY KEY (`nombre`,`centro_operacion_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `centro_operacion_77` (`centro_operacion_id`),
  CONSTRAINT `centro_operacion_77` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `despachador`
--

LOCK TABLES `despachador` WRITE;
/*!40000 ALTER TABLE `despachador` DISABLE KEYS */;
/*!40000 ALTER TABLE `despachador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalle_embalaje`
--

DROP TABLE IF EXISTS `detalle_embalaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalle_embalaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla DESPACHAJE',
  `embalaje_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL COMMENT 'Indica la cantidad de unidades que se despachan de la línea de producción',
  `linea_produccion_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla LINEA_PRODUCCION, que indica a que línea de producción se despacha',
  `no_entregadas` int(1) NOT NULL DEFAULT '0',
  `nota` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_despachaje_linea_produccion1` (`linea_produccion_id`),
  KEY `fk_precarga_64` (`embalaje_id`),
  CONSTRAINT `fk_despachaje_linea_produccion1` FOREIGN KEY (`linea_produccion_id`) REFERENCES `linea_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_precarga_64` FOREIGN KEY (`embalaje_id`) REFERENCES `embalaje` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalle_embalaje`
--

LOCK TABLES `detalle_embalaje` WRITE;
/*!40000 ALTER TABLE `detalle_embalaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `detalle_embalaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `embalaje`
--

DROP TABLE IF EXISTS `embalaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `embalaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `camion_id` int(11) NOT NULL,
  `despachador_id` int(11) NOT NULL,
  `fecha_planeada_cargue` date NOT NULL,
  `turno` int(11) NOT NULL DEFAULT '1',
  `fecha_real_cargue` date DEFAULT NULL,
  `fecha_entrega` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_camion_guia_1` (`camion_id`),
  KEY `fk_despachador_12` (`despachador_id`),
  CONSTRAINT `fk_camion_guia_1` FOREIGN KEY (`camion_id`) REFERENCES `camion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_despachador_12` FOREIGN KEY (`despachador_id`) REFERENCES `despachador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `embalaje`
--

LOCK TABLES `embalaje` WRITE;
/*!40000 ALTER TABLE `embalaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `embalaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estado_cartilla`
--

DROP TABLE IF EXISTS `estado_cartilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estado_cartilla` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla RECEPCIONISTA. Almacena el nombre(s) de la persona que recibe y sube la cartilla',
  `estado` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Guarda los diferentes estados que puede tener una cartilla. Estos estados serán asignados por servicio al cliente.',
  `descripcion` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Guarda la descripción o característícas del estado',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estado_cartilla`
--

LOCK TABLES `estado_cartilla` WRITE;
/*!40000 ALTER TABLE `estado_cartilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado_cartilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `etiqueta`
--

DROP TABLE IF EXISTS `etiqueta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `etiqueta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `archivo` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `etiqueta`
--

LOCK TABLES `etiqueta` WRITE;
/*!40000 ALTER TABLE `etiqueta` DISABLE KEYS */;
/*!40000 ALTER TABLE `etiqueta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fechas_cartilla`
--

DROP TABLE IF EXISTS `fechas_cartilla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fechas_cartilla` (
  `id` int(11) NOT NULL,
  `subida_bdd` datetime NOT NULL,
  `entrega_estimada` date NOT NULL,
  `entrega_solicitada` date NOT NULL,
  `entrega_prometida` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartilla_id` (`id`),
  CONSTRAINT `fk_cartilla_id` FOREIGN KEY (`id`) REFERENCES `cartilla` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fechas_cartilla`
--

LOCK TABLES `fechas_cartilla` WRITE;
/*!40000 ALTER TABLE `fechas_cartilla` DISABLE KEYS */;
/*!40000 ALTER TABLE `fechas_cartilla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `figura_detallada`
--

DROP TABLE IF EXISTS `figura_detallada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `figura_detallada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `figura_general_id` int(11) NOT NULL,
  `etiqueta_id` int(11) NOT NULL DEFAULT '1',
  `comentario` varchar(80) COLLATE latin1_spanish_ci NOT NULL,
  `diametro_menor_mm` int(11) NOT NULL DEFAULT '0',
  `diametro_mayor_mm` int(11) NOT NULL DEFAULT '999',
  `dimension1_menor` decimal(6,3) NOT NULL DEFAULT '0.000',
  `dimension1_mayor` decimal(6,3) NOT NULL DEFAULT '999.000',
  `dimension2_menor` decimal(6,3) NOT NULL DEFAULT '0.000',
  `dimension2_mayor` decimal(6,3) NOT NULL DEFAULT '999.000',
  `dimension3_menor` decimal(6,3) NOT NULL DEFAULT '0.000',
  `dimension3_mayor` decimal(6,3) NOT NULL DEFAULT '999.000',
  `n1_menor` int(11) NOT NULL DEFAULT '0',
  `n1_mayor` int(11) NOT NULL DEFAULT '999999',
  `n2_menor` int(11) NOT NULL DEFAULT '0',
  `n2_mayor` int(11) NOT NULL DEFAULT '999999',
  `peso_menor_kg` decimal(8,2) NOT NULL DEFAULT '0.00',
  `peso_mayor_kg` decimal(8,2) NOT NULL DEFAULT '999999.00',
  PRIMARY KEY (`id`),
  KEY `kf_grupo_figuracion2` (`figura_general_id`),
  KEY `fk_etiqueta3` (`etiqueta_id`),
  CONSTRAINT `fk_etiqueta3` FOREIGN KEY (`etiqueta_id`) REFERENCES `etiqueta` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `kf_figura_general3` FOREIGN KEY (`figura_general_id`) REFERENCES `figura_general` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `figura_detallada`
--

LOCK TABLES `figura_detallada` WRITE;
/*!40000 ALTER TABLE `figura_detallada` DISABLE KEYS */;
/*!40000 ALTER TABLE `figura_detallada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `figura_general`
--

DROP TABLE IF EXISTS `figura_general`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `figura_general` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `descripcion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `figura_general`
--

LOCK TABLES `figura_general` WRITE;
/*!40000 ALTER TABLE `figura_general` DISABLE KEYS */;
/*!40000 ALTER TABLE `figura_general` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `referencia` varchar(45) NOT NULL COMMENT 'Almacena la referencia con la que puede ser identificada una barra o malla ya creada',
  `referencia_creada` varchar(60) NOT NULL COMMENT 'Almacena la referencia con la que puede ser identificada una barra o malla y describe logicamente la estructura del objeto',
  `descripcion` varchar(100) NOT NULL,
  `precio_unidad` decimal(20,4) NOT NULL,
  `fecha_actualizacion` datetime NOT NULL,
  `unidad` int(11) NOT NULL,
  `para_negociacion` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `referencia_UNIQUE` (`referencia_creada`),
  UNIQUE KEY `item_UNIQUE` (`referencia`),
  KEY `fk_unidad` (`unidad`),
  CONSTRAINT `fk_unidad` FOREIGN KEY (`unidad`) REFERENCES `unidad` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jefedeplanta`
--

DROP TABLE IF EXISTS `jefedeplanta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jefedeplanta` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `contrasena` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `email` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  `centro_operacion_id` int(11) NOT NULL,
  PRIMARY KEY (`nombre`,`centro_operacion_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_jefedeplanta_centro_operacion1_idx` (`centro_operacion_id`),
  CONSTRAINT `fk_jefedeplanta_centro_operacion1` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jefedeplanta`
--

LOCK TABLES `jefedeplanta` WRITE;
/*!40000 ALTER TABLE `jefedeplanta` DISABLE KEYS */;
/*!40000 ALTER TABLE `jefedeplanta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linea_produccion`
--

DROP TABLE IF EXISTS `linea_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linea_produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla LINEA_PRODUCCION, no es llave primaria pero es única y autoincremento lo cual permite que sea identificador de la tabla',
  `cantidad` int(11) NOT NULL COMMENT 'Indica la cantidad total a planear, producir y entregar en esa línea de producción',
  `definicion_sin_cantidad` varchar(200) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Describe la línea de producción en cuanto a figura, largo, diametro, etc.',
  `figura_detallada_id` int(11) NOT NULL,
  `codigo_aprobacion_erp` varchar(45) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `cartilla_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla CARTILLA indica a qué cartilla pertenece la línea de producción',
  `linea_cartilla` int(11) NOT NULL COMMENT 'Hace referencia al número o consecutivo con el cual el cliente llamó a esa línea de producción en una cartilla',
  `centro_operacion_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla CENTRO_OPERACION que indica a qué centro de operación fue asignada la línea de producción',
  `fecha_limite_produccion` date NOT NULL COMMENT 'Almacena la fecha en que el recepcionista le indicó al cliente que sería entregada la cartilla',
  `canceladas` int(11) NOT NULL DEFAULT '0' COMMENT 'Indica la cantidad que fue cancelada en esa línea de producción',
  `producidas` int(11) NOT NULL DEFAULT '0' COMMENT 'Indica la cantidad que fue producida en esa línea de producción',
  `almacenadas` int(11) NOT NULL DEFAULT '0',
  `embaladas` int(11) NOT NULL DEFAULT '0',
  `entregadas` int(11) NOT NULL DEFAULT '0' COMMENT 'Indica la cantidad que fue entregada en esa línea de producción',
  `no_entregadas` int(11) NOT NULL DEFAULT '0',
  `peso_unitario_kg` decimal(12,4) NOT NULL COMMENT 'indica en Kilogramos el peso total de la línea de producción',
  `recepcionista_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla RECEPCIONISTA que indica qué recepcionista ordenó la línea de producción',
  `item_id` int(11) NOT NULL,
  `orden_produccion` varchar(20) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`cartilla_id`,`linea_cartilla`,`centro_operacion_id`,`fecha_limite_produccion`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_linea_produccion_cartilla1` (`cartilla_id`),
  KEY `fk_recepcionista_id1` (`recepcionista_id`),
  KEY `fk_cartilla_id1` (`cartilla_id`),
  KEY `fj_centro_operacion_id` (`centro_operacion_id`),
  KEY `fk_figura_detallada_id` (`figura_detallada_id`),
  CONSTRAINT `fj_centro_operacion_id` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cartilla_id1` FOREIGN KEY (`cartilla_id`) REFERENCES `cartilla` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_figura_detallada_id` FOREIGN KEY (`figura_detallada_id`) REFERENCES `figura_detallada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recepcionista_id1` FOREIGN KEY (`recepcionista_id`) REFERENCES `recepcionista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linea_produccion`
--

LOCK TABLES `linea_produccion` WRITE;
/*!40000 ALTER TABLE `linea_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `linea_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malla`
--

DROP TABLE IF EXISTS `malla`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `malla` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomenclatura` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `nomenclaturas_alternas` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `diametro_longitudinal_mm` decimal(6,2) DEFAULT NULL,
  `fy_longitudinal_mpa` decimal(6,2) DEFAULT NULL,
  `layer_borde_longitudinal` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `layer_relleno_longitudinal` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `area_longitudinal_mm2` decimal(8,4) DEFAULT NULL,
  `nomenclatura_longitudinal` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `masa_longitudinal_kg_m` decimal(8,4) DEFAULT NULL,
  `diametro_transversal_mm` decimal(6,2) DEFAULT NULL,
  `fy_transversal_mpa` decimal(6,2) DEFAULT NULL,
  `layer_borde_transversal` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `layer_relleno_transversal` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `area_transversal_mm2` decimal(8,4) DEFAULT NULL,
  `nomenclatura_transversal` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `masa_transversal_kg_m` decimal(8,4) DEFAULT NULL,
  `separacion_barras_longitudinales_mm` decimal(6,2) DEFAULT NULL,
  `separacion_barras_transversales_mm` decimal(6,2) DEFAULT NULL,
  `ancho_maximo_m` decimal(8,4) DEFAULT NULL,
  `longitud_maxima_m` decimal(8,4) DEFAULT NULL,
  `ancho_estandar_m` decimal(8,4) DEFAULT NULL,
  `longitud_estandar_m` decimal(8,4) DEFAULT NULL,
  `ancho_maximo_transporte_m` decimal(8,4) DEFAULT NULL,
  `longitud_maxima_transporte_m` decimal(8,4) DEFAULT NULL,
  `masa_nominal_kg_m2` decimal(8,4) DEFAULT NULL,
  `referencia_estandar` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `referencia_especial` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `referencia_superespecial` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `traslapo_barras_longitudinales_m` decimal(8,4) DEFAULT NULL,
  `traslapo_barras_tranversales_m` decimal(8,4) DEFAULT NULL,
  `maximas_por_paquete` int(11) DEFAULT NULL,
  `fabricacion_especial` tinyint(1) DEFAULT NULL,
  `solo_en_dimensiones_estandar` tinyint(1) DEFAULT NULL,
  `unidad_referencia_estandar` enum('unidad','peso') COLLATE latin1_spanish_ci DEFAULT NULL,
  `unidad_referencia_especial` enum('unidad','peso') COLLATE latin1_spanish_ci DEFAULT NULL,
  `unidad_referencia_superespecial` enum('unidad','peso') COLLATE latin1_spanish_ci DEFAULT NULL,
  `minimo_pelo_produccion_mm` decimal(6,2) DEFAULT NULL,
  `unir_especiales_y_superespeciales` tinyint(1) DEFAULT NULL,
  `unir_estandar_y_especiales` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomenclatura` (`nomenclatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malla`
--

LOCK TABLES `malla` WRITE;
/*!40000 ALTER TABLE `malla` DISABLE KEYS */;
/*!40000 ALTER TABLE `malla` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malla_alterna`
--

DROP TABLE IF EXISTS `malla_alterna`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `malla_alterna` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nomenclatura` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `nomenclaturas_alternas` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `diametro_longitudinal_mm` decimal(6,2) DEFAULT NULL,
  `fy_longitudinal_mpa` decimal(6,2) DEFAULT NULL,
  `layer_borde_longitudinal` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `layer_relleno_longitudinal` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `area_longitudinal_mm2` decimal(8,4) DEFAULT NULL,
  `nomenclatura_longitudinal` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `masa_longitudinal_kg_m` decimal(8,4) DEFAULT NULL,
  `diametro_transversal_mm` decimal(6,2) DEFAULT NULL,
  `fy_transversal_mpa` decimal(6,2) DEFAULT NULL,
  `layer_borde_transversal` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `layer_relleno_transversal` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `area_transversal_mm2` decimal(8,4) DEFAULT NULL,
  `nomenclatura_transversal` varchar(10) COLLATE latin1_spanish_ci DEFAULT NULL,
  `masa_transversal_kg_m` decimal(8,4) DEFAULT NULL,
  `separacion_barras_longitudinales_mm` decimal(6,2) DEFAULT NULL,
  `separacion_barras_transversales_mm` decimal(6,2) DEFAULT NULL,
  `ancho_maximo_m` decimal(8,4) DEFAULT NULL,
  `longitud_maxima_m` decimal(8,4) DEFAULT NULL,
  `ancho_estandar_m` decimal(8,4) DEFAULT NULL,
  `longitud_estandar_m` decimal(8,4) DEFAULT NULL,
  `ancho_maximo_transporte_m` decimal(8,4) DEFAULT NULL,
  `longitud_maxima_transporte_m` decimal(8,4) DEFAULT NULL,
  `masa_nominal_kg_m2` decimal(8,4) DEFAULT NULL,
  `referencia_estandar` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `referencia_especial` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `referencia_superespecial` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `traslapo_barras_longitudinales_m` decimal(8,4) DEFAULT NULL,
  `traslapo_barras_tranversales_m` decimal(8,4) DEFAULT NULL,
  `maximas_por_paquete` int(11) DEFAULT NULL,
  `fabricacion_especial` tinyint(1) DEFAULT NULL,
  `solo_en_dimensiones_estandar` tinyint(1) DEFAULT NULL,
  `unidad_referencia_estandar` enum('unidad','peso') COLLATE latin1_spanish_ci DEFAULT NULL,
  `unidad_referencia_especial` enum('unidad','peso') COLLATE latin1_spanish_ci DEFAULT NULL,
  `unidad_referencia_superespecial` enum('unidad','peso') COLLATE latin1_spanish_ci DEFAULT NULL,
  `minimo_pelo_produccion_mm` decimal(6,2) DEFAULT NULL,
  `unir_especiales_y_superespeciales` tinyint(1) DEFAULT NULL,
  `unir_estandar_y_especiales` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nomenclatura` (`nomenclatura`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malla_alterna`
--

LOCK TABLES `malla_alterna` WRITE;
/*!40000 ALTER TABLE `malla_alterna` DISABLE KEYS */;
/*!40000 ALTER TABLE `malla_alterna` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malla_alterna_comentario`
--

DROP TABLE IF EXISTS `malla_alterna_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `malla_alterna_comentario` (
  `comentario_1` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `comentario_2` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `version_general` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `version_particular` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malla_alterna_comentario`
--

LOCK TABLES `malla_alterna_comentario` WRITE;
/*!40000 ALTER TABLE `malla_alterna_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `malla_alterna_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `malla_comentario`
--

DROP TABLE IF EXISTS `malla_comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `malla_comentario` (
  `comentario_1` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `comentario_2` varchar(50) COLLATE latin1_spanish_ci DEFAULT NULL,
  `version_general` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL,
  `version_particular` varchar(20) COLLATE latin1_spanish_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `malla_comentario`
--

LOCK TABLES `malla_comentario` WRITE;
/*!40000 ALTER TABLE `malla_comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `malla_comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactura_centro_operacion`
--

DROP TABLE IF EXISTS `manufactura_centro_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactura_centro_operacion` (
  `figura_general_id` int(11) NOT NULL,
  `centro_operacion_id` int(11) NOT NULL,
  `dias_produccion` int(11) NOT NULL DEFAULT '10',
  PRIMARY KEY (`figura_general_id`,`centro_operacion_id`),
  KEY `fk_fig_gen89` (`figura_general_id`),
  KEY `fk_cen_pro_99` (`centro_operacion_id`),
  CONSTRAINT `fk_cen_pro_99` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_fig_gen89` FOREIGN KEY (`figura_general_id`) REFERENCES `figura_general` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactura_centro_operacion`
--

LOCK TABLES `manufactura_centro_operacion` WRITE;
/*!40000 ALTER TABLE `manufactura_centro_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufactura_centro_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufactura_centro_produccion`
--

DROP TABLE IF EXISTS `manufactura_centro_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufactura_centro_produccion` (
  `figura_detallada_id` int(11) NOT NULL,
  `centro_produccion_1_id` int(11) NOT NULL,
  `capacidad_1_kg_hora` decimal(8,3) NOT NULL DEFAULT '5.000',
  `cantidad_1_maxima_hora` int(11) NOT NULL DEFAULT '1000',
  `centro_produccion_2_id` int(11) DEFAULT NULL,
  `capacidad_2_kg_hora` decimal(8,3) DEFAULT NULL,
  `cantidad_2_maxima_hora` int(11) DEFAULT NULL,
  `prioridad` int(11) NOT NULL DEFAULT '1',
  `minutos_1_cambio_diametro` decimal(12,8) NOT NULL DEFAULT '5.00000000',
  `minutos_1_cambio_dimension` decimal(12,8) NOT NULL DEFAULT '2.00000000',
  `minutos_2_cambio_diametro` decimal(12,8) NOT NULL DEFAULT '5.00000000',
  `minutos_2_cambio_dimension` decimal(12,8) NOT NULL DEFAULT '2.00000000',
  PRIMARY KEY (`figura_detallada_id`,`centro_produccion_1_id`),
  KEY `fk_centro_produccion_id4` (`centro_produccion_1_id`),
  KEY `fk_grupo_figuracion_id4` (`figura_detallada_id`),
  KEY `fk_centro_produccion_id22` (`centro_produccion_2_id`),
  CONSTRAINT `fk_centro_produccion_id22` FOREIGN KEY (`centro_produccion_2_id`) REFERENCES `centro_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_centro_produccion_id4` FOREIGN KEY (`centro_produccion_1_id`) REFERENCES `centro_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_figura_detallada_id4` FOREIGN KEY (`figura_detallada_id`) REFERENCES `figura_detallada` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufactura_centro_produccion`
--

LOCK TABLES `manufactura_centro_produccion` WRITE;
/*!40000 ALTER TABLE `manufactura_centro_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `manufactura_centro_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mapageneral`
--

DROP TABLE IF EXISTS `mapageneral`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `mapageneral` (
  `id` int(11) NOT NULL,
  `centro_operacion_id` int(11) NOT NULL,
  `maquina_identificacion` varchar(30) COLLATE latin1_spanish_ci NOT NULL,
  `x` decimal(5,2) NOT NULL,
  `y` decimal(5,2) NOT NULL,
  `b` decimal(5,2) NOT NULL,
  `h` decimal(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mapageneral`
--

LOCK TABLES `mapageneral` WRITE;
/*!40000 ALTER TABLE `mapageneral` DISABLE KEYS */;
/*!40000 ALTER TABLE `mapageneral` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `negociacion`
--

DROP TABLE IF EXISTS `negociacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `negociacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `obra_id` int(11) NOT NULL,
  `fecha_negociacion` datetime NOT NULL,
  `fecha_expiracion` date NOT NULL DEFAULT '2100-12-31',
  `recepcionista_id` int(11) DEFAULT NULL,
  `representante_id` int(11) DEFAULT NULL,
  `maximo_credito` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `vigente` tinyint(4) NOT NULL DEFAULT '1',
  `auditor_id` int(11) DEFAULT NULL,
  `sintopesdecredito` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_negociacion_obra` (`obra_id`),
  KEY `fk_negociacion_recepcionista` (`recepcionista_id`),
  KEY `fk_representante22` (`representante_id`),
  KEY `fk_recepcionista22` (`recepcionista_id`),
  CONSTRAINT `fk_negociacion_obra` FOREIGN KEY (`obra_id`) REFERENCES `obra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recepcionista22` FOREIGN KEY (`recepcionista_id`) REFERENCES `recepcionista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_representante22` FOREIGN KEY (`representante_id`) REFERENCES `representante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `negociacion`
--

LOCK TABLES `negociacion` WRITE;
/*!40000 ALTER TABLE `negociacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `negociacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obra`
--

DROP TABLE IF EXISTS `obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `obra` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla OBRA',
  `numero` varchar(10) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Guarda el número de obra asignada por el cliente',
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Indica el nombre de la obra',
  `direccion` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Indica la dirección de la obra',
  `telefonos` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Indica el teléfono de la obra o persona de contacto',
  `persona_contacto` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Indica el nombre de la persona de contacto en la obra',
  `cliente_documento` varchar(20) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Clave foránea primaria de la Tabla CLIENTE, que indica con que cliente se relaciona esta obra',
  `ciudad_region_id` int(11) NOT NULL DEFAULT '0' COMMENT 'Indica la ciudad de la obra',
  `centro_operacion_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`,`cliente_documento`,`centro_operacion_id`,`numero`),
  KEY `fk_cliente_documento` (`cliente_documento`),
  KEY `fk_ciudad_region_id` (`ciudad_region_id`),
  KEY `centro_operacion_id` (`centro_operacion_id`),
  CONSTRAINT `fk_centro_operaicon` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ciudad_region_id` FOREIGN KEY (`ciudad_region_id`) REFERENCES `ciudad_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_cliente_documento` FOREIGN KEY (`cliente_documento`) REFERENCES `cliente` (`documento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci COMMENT='			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obra`
--

LOCK TABLES `obra` WRITE;
/*!40000 ALTER TABLE `obra` DISABLE KEYS */;
/*!40000 ALTER TABLE `obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ocupacion_centro_produccion`
--

DROP TABLE IF EXISTS `ocupacion_centro_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ocupacion_centro_produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centro_produccion_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `horas_ocupacion` decimal(8,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`centro_produccion_id`,`fecha`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_centro_produccion8` (`centro_produccion_id`),
  KEY `fk_centroproduccion67` (`centro_produccion_id`),
  CONSTRAINT `fk_centroproduccion67` FOREIGN KEY (`centro_produccion_id`) REFERENCES `centro_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ocupacion_centro_produccion`
--

LOCK TABLES `ocupacion_centro_produccion` WRITE;
/*!40000 ALTER TABLE `ocupacion_centro_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `ocupacion_centro_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operario`
--

DROP TABLE IF EXISTS `operario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `operario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Atributo identificador de la tabla OPERARIO. Almacena el nombre(s) del operario que realiza la producción',
  `contrasena` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena la contraseña encriptada del operario. Los permisos de este usuario se controlan por aplicación',
  `email` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena el email del operario. Este será usado en caso que el usuario necesite recuperar la contraseña',
  `centro_operacion_id` int(11) NOT NULL,
  PRIMARY KEY (`nombre`,`centro_operacion_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_centro_operacion5` (`centro_operacion_id`),
  CONSTRAINT `fk_centro_operacion5` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operario`
--

LOCK TABLES `operario` WRITE;
/*!40000 ALTER TABLE `operario` DISABLE KEYS */;
/*!40000 ALTER TABLE `operario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paros_centro_produccion`
--

DROP TABLE IF EXISTS `paros_centro_produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paros_centro_produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `centro_produccion_id` int(11) NOT NULL,
  `causa_paro_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `cantidad_horas` decimal(6,2) NOT NULL,
  `jefe_de_planta_id` int(11) DEFAULT NULL,
  `nota` varchar(100) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha_de_reporte` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `causa` (`causa_paro_id`),
  KEY `centroproducciond` (`centro_produccion_id`),
  CONSTRAINT `causa` FOREIGN KEY (`causa_paro_id`) REFERENCES `causa_paros` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `centroproducciond` FOREIGN KEY (`centro_produccion_id`) REFERENCES `centro_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paros_centro_produccion`
--

LOCK TABLES `paros_centro_produccion` WRITE;
/*!40000 ALTER TABLE `paros_centro_produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `paros_centro_produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planeacion`
--

DROP TABLE IF EXISTS `planeacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planeacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla PLANEACION',
  `linea_produccion_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla LINEA_PRODUCCION, que indica que línea de producción se está planeando',
  `cantidad` int(11) NOT NULL COMMENT 'Indica cuántas unidades se planean producir de la línea de producción dada',
  `centro_produccion_id` int(11) DEFAULT NULL COMMENT 'Clave foránea primaria de la Tabla CENTRO_PRODUCCION, que centro de producción fue designado en la planeación para realizar la línea de producción',
  `planeador_id` int(11) DEFAULT NULL,
  `fecha_planeada` date DEFAULT NULL,
  `por_atraso` tinyint(4) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_planeacion_centro_produccion1` (`centro_produccion_id`),
  KEY `fk_planeacion_linea_produccion1` (`linea_produccion_id`),
  KEY `fk_planeacion_planeador` (`id`),
  KEY `fk_planeacion_planeador_id` (`planeador_id`),
  CONSTRAINT `fk_planeacion_centro_produccion1` FOREIGN KEY (`centro_produccion_id`) REFERENCES `centro_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_planeacion_linea_produccion1` FOREIGN KEY (`linea_produccion_id`) REFERENCES `linea_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_planeacion_planeador_id` FOREIGN KEY (`planeador_id`) REFERENCES `planeador` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planeacion`
--

LOCK TABLES `planeacion` WRITE;
/*!40000 ALTER TABLE `planeacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `planeacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planeador`
--

DROP TABLE IF EXISTS `planeador`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planeador` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) CHARACTER SET latin1 NOT NULL COMMENT 'Atributo identificador de la tabla PLANEADOR. Almacena el nombre(s) de la persona que realiza la planeación',
  `contrasena` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena la contraseña encriptada del planeador. Los permisos de este usuario se controlan por aplicación',
  `email` varchar(45) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena el email del planeador. Este será usado en caso que el usuario necesite recuperar la contraseña',
  `centro_operacion_id` int(11) NOT NULL COMMENT 'Almacena los permisos del usuario. Los permisos de este usuario se controlan por aplicación',
  PRIMARY KEY (`nombre`,`centro_operacion_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_centro_operacion4` (`centro_operacion_id`),
  CONSTRAINT `fk_centro_operacion4` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planeador`
--

LOCK TABLES `planeador` WRITE;
/*!40000 ALTER TABLE `planeador` DISABLE KEYS */;
/*!40000 ALTER TABLE `planeador` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `precios_negociacion`
--

DROP TABLE IF EXISTS `precios_negociacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `precios_negociacion` (
  `negociacion_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `precio_unitario` decimal(20,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`negociacion_id`,`item_id`),
  KEY `fk_item` (`item_id`),
  KEY `fk_negociacion` (`negociacion_id`),
  CONSTRAINT `fk_item` FOREIGN KEY (`item_id`) REFERENCES `item` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_negociacion` FOREIGN KEY (`negociacion_id`) REFERENCES `negociacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `precios_negociacion`
--

LOCK TABLES `precios_negociacion` WRITE;
/*!40000 ALTER TABLE `precios_negociacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `precios_negociacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produccion`
--

DROP TABLE IF EXISTS `produccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla PRODUCCION',
  `cantidad` int(11) NOT NULL COMMENT 'Indica cuántas unidades se van a producir según la planeación realizada',
  `fecha_produccion` date NOT NULL COMMENT 'Almacena la fecha que se realizó o se terminó la producción de la línea producción relacionada',
  `lista_coladas` varchar(150) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena la referencia a de la cual proviene el acero (Palanquilla)',
  `linea_produccion_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla LINEA_PRODUCCION, que indica que línea de producción se produjo',
  `operario_id` int(11) NOT NULL COMMENT 'Clave foránea primaria de la Tabla OPERARIO, que guarda el ID del operario realizó esa producción',
  PRIMARY KEY (`id`),
  KEY `fk_produccion_linea_produccion1` (`linea_produccion_id`),
  KEY `fk_produccion_operario_id` (`operario_id`),
  CONSTRAINT `fk_produccion_linea_produccion1` FOREIGN KEY (`linea_produccion_id`) REFERENCES `linea_produccion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_produccion_operario_id` FOREIGN KEY (`operario_id`) REFERENCES `operario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produccion`
--

LOCK TABLES `produccion` WRITE;
/*!40000 ALTER TABLE `produccion` DISABLE KEYS */;
/*!40000 ALTER TABLE `produccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcionista`
--

DROP TABLE IF EXISTS `recepcionista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepcionista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) COLLATE latin1_spanish_ci NOT NULL DEFAULT '' COMMENT 'Atributo identificador de la tabla RECEPCIONISTA. Almacena el nombre(s) de la persona que recibe y sube la cartilla',
  `contrasena` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena la contraseña encriptada del recepcionista. Los permisos de este usuario se controlan por aplicación',
  `email` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena el email del recepcionista. Este será usado en caso que el usuario necesite recuperar la contraseña',
  `permisos` varchar(100) COLLATE latin1_spanish_ci NOT NULL COMMENT 'Almacena los permisos del usuario. Los permisos de este usuario se controlan por aplicación',
  PRIMARY KEY (`nombre`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcionista`
--

LOCK TABLES `recepcionista` WRITE;
/*!40000 ALTER TABLE `recepcionista` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcionista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcionista_centrooperacion`
--

DROP TABLE IF EXISTS `recepcionista_centrooperacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepcionista_centrooperacion` (
  `id` int(11) NOT NULL,
  `recepcionista_id` int(11) NOT NULL,
  `centro_operacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcionista_centrooperacion`
--

LOCK TABLES `recepcionista_centrooperacion` WRITE;
/*!40000 ALTER TABLE `recepcionista_centrooperacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcionista_centrooperacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recepcionista_ciudad`
--

DROP TABLE IF EXISTS `recepcionista_ciudad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recepcionista_ciudad` (
  `idrecepcionista_ciudad` int(11) NOT NULL AUTO_INCREMENT,
  `recepcionista_id` int(11) NOT NULL,
  `ciudad_id` int(11) NOT NULL,
  PRIMARY KEY (`idrecepcionista_ciudad`),
  KEY `fk_recepcionista_idx` (`recepcionista_id`),
  KEY `fk_ciudad_idx` (`ciudad_id`),
  CONSTRAINT `fk_ciudad` FOREIGN KEY (`ciudad_id`) REFERENCES `ciudad_region` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recepcionista` FOREIGN KEY (`recepcionista_id`) REFERENCES `recepcionista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recepcionista_ciudad`
--

LOCK TABLES `recepcionista_ciudad` WRITE;
/*!40000 ALTER TABLE `recepcionista_ciudad` DISABLE KEYS */;
/*!40000 ALTER TABLE `recepcionista_ciudad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reglas_centros_operacion`
--

DROP TABLE IF EXISTS `reglas_centros_operacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `reglas_centros_operacion` (
  `id` int(11) NOT NULL,
  `orden` int(11) NOT NULL,
  `descripcion` varchar(200) COLLATE latin1_spanish_ci NOT NULL,
  `n_centros` int(11) NOT NULL DEFAULT '0',
  `n_transportes` int(11) NOT NULL DEFAULT '0',
  `dias_atraso` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reglas_centros_operacion`
--

LOCK TABLES `reglas_centros_operacion` WRITE;
/*!40000 ALTER TABLE `reglas_centros_operacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `reglas_centros_operacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representante`
--

DROP TABLE IF EXISTS `representante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `representante` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Atributo identificador de la tabla RECEPCIONISTA. Almacena el nombre(s) de la persona que recibe y sube la cartilla',
  `email` varchar(40) COLLATE latin1_spanish_ci NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `nombre_completo` varchar(100) COLLATE latin1_spanish_ci NOT NULL DEFAULT 'Nombre del representante',
  PRIMARY KEY (`id`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representante`
--

LOCK TABLES `representante` WRITE;
/*!40000 ALTER TABLE `representante` DISABLE KEYS */;
/*!40000 ALTER TABLE `representante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `representante_obra`
--

DROP TABLE IF EXISTS `representante_obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `representante_obra` (
  `representante_id` int(11) NOT NULL,
  `obra_id` int(11) NOT NULL,
  PRIMARY KEY (`representante_id`,`obra_id`),
  KEY `fk_representante` (`representante_id`),
  KEY `fk_obra` (`obra_id`),
  CONSTRAINT `fk_obra` FOREIGN KEY (`obra_id`) REFERENCES `obra` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_representante` FOREIGN KEY (`representante_id`) REFERENCES `representante` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `representante_obra`
--

LOCK TABLES `representante_obra` WRITE;
/*!40000 ALTER TABLE `representante_obra` DISABLE KEYS */;
/*!40000 ALTER TABLE `representante_obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock`
--

DROP TABLE IF EXISTS `stock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `definicion_sin_cantidad` varchar(100) COLLATE latin1_spanish_ci NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT '0',
  `fecha_ultimo_movimiento` datetime DEFAULT NULL,
  `centro_operacion_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_centro_operacion55` (`centro_operacion_id`),
  CONSTRAINT `fk_centro_operacion55` FOREIGN KEY (`centro_operacion_id`) REFERENCES `centro_operacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock`
--

LOCK TABLES `stock` WRITE;
/*!40000 ALTER TABLE `stock` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stock_movimientos`
--

DROP TABLE IF EXISTS `stock_movimientos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `stock_movimientos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `stock_id` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `almacenista_id` int(11) DEFAULT NULL,
  `nota` varchar(60) COLLATE latin1_spanish_ci DEFAULT NULL,
  `fecha` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_stock01` (`stock_id`),
  KEY `fk_almacenista29` (`almacenista_id`),
  CONSTRAINT `fk_almacenista29` FOREIGN KEY (`almacenista_id`) REFERENCES `almacenista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_stock01` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stock_movimientos`
--

LOCK TABLES `stock_movimientos` WRITE;
/*!40000 ALTER TABLE `stock_movimientos` DISABLE KEYS */;
/*!40000 ALTER TABLE `stock_movimientos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `temporal_subida_erp`
--

DROP TABLE IF EXISTS `temporal_subida_erp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `temporal_subida_erp` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nimbus` varchar(45) COLLATE latin1_spanish_ci DEFAULT NULL,
  `texto_definicion` text COLLATE latin1_spanish_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `temporal_subida_erp`
--

LOCK TABLES `temporal_subida_erp` WRITE;
/*!40000 ALTER TABLE `temporal_subida_erp` DISABLE KEYS */;
/*!40000 ALTER TABLE `temporal_subida_erp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transacciones_negociacion`
--

DROP TABLE IF EXISTS `transacciones_negociacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transacciones_negociacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `recepcionista_id` int(11) DEFAULT NULL,
  `auditor_id` int(11) DEFAULT NULL,
  `negociacion_id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `codigo_nimbus` varchar(15) COLLATE latin1_spanish_ci NOT NULL DEFAULT '',
  `nota` varchar(200) COLLATE latin1_spanish_ci DEFAULT NULL,
  `debe` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `haber` decimal(20,4) NOT NULL DEFAULT '0.0000',
  `saldo` decimal(20,4) NOT NULL DEFAULT '0.0000',
  PRIMARY KEY (`id`),
  KEY `fk_recepcionista_22` (`recepcionista_id`),
  KEY `fk_negociacion_22` (`negociacion_id`),
  CONSTRAINT `fk_negociacion_22` FOREIGN KEY (`negociacion_id`) REFERENCES `negociacion` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_recepcionista_22` FOREIGN KEY (`recepcionista_id`) REFERENCES `recepcionista` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transacciones_negociacion`
--

LOCK TABLES `transacciones_negociacion` WRITE;
/*!40000 ALTER TABLE `transacciones_negociacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `transacciones_negociacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `unidad`
--

DROP TABLE IF EXISTS `unidad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tipo` varchar(5) COLLATE latin1_spanish_ci NOT NULL,
  `sufijo` varchar(10) COLLATE latin1_spanish_ci NOT NULL,
  `definicion` varchar(45) COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tipo_UNIQUE` (`tipo`),
  UNIQUE KEY `texto_UNIQUE` (`sufijo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `unidad`
--

LOCK TABLES `unidad` WRITE;
/*!40000 ALTER TABLE `unidad` DISABLE KEYS */;
/*!40000 ALTER TABLE `unidad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `variables`
--

DROP TABLE IF EXISTS `variables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `variables` (
  `definicion` varchar(50) COLLATE latin1_spanish_ci NOT NULL,
  `valor` text COLLATE latin1_spanish_ci NOT NULL,
  PRIMARY KEY (`definicion`),
  UNIQUE KEY `definicion_UNIQUE` (`definicion`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `variables`
--

LOCK TABLES `variables` WRITE;
/*!40000 ALTER TABLE `variables` DISABLE KEYS */;
/*!40000 ALTER TABLE `variables` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-08-29 23:59:16
