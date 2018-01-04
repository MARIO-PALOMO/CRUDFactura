/*
Navicat MySQL Data Transfer

Source Server         : MariaDBLenovo
Source Server Version : 50505
Source Host           : 127.0.0.1:3307
Source Database       : factura

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-01-03 19:07:57
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cliente
-- ----------------------------
DROP TABLE IF EXISTS `cliente`;
CREATE TABLE `cliente` (
  `cli_id` int(11) NOT NULL AUTO_INCREMENT,
  `cli_nombre` text DEFAULT NULL,
  `cli_cedula` varchar(10) DEFAULT NULL,
  `cli_direccion` text DEFAULT NULL,
  `cli_telefono` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`cli_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of cliente
-- ----------------------------
INSERT INTO `cliente` VALUES ('10', 'MARIO PALOMO', '1724395536', 'LIBERTADORES', '0979212157');
INSERT INTO `cliente` VALUES ('11', 'GABRIEL MARTINEZ', '1745896321', 'PIO XII', '0985471236');

-- ----------------------------
-- Table structure for detalle_factura
-- ----------------------------
DROP TABLE IF EXISTS `detalle_factura`;
CREATE TABLE `detalle_factura` (
  `dfa_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_id` int(11) DEFAULT NULL,
  `dfa_cantidad` int(11) DEFAULT NULL,
  `dfa_total` int(11) DEFAULT NULL,
  `fac_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`dfa_id`),
  KEY `pro_id` (`pro_id`),
  KEY `fac_id` (`fac_id`),
  CONSTRAINT `detalle_factura_ibfk_1` FOREIGN KEY (`pro_id`) REFERENCES `producto` (`pro_id`),
  CONSTRAINT `detalle_factura_ibfk_2` FOREIGN KEY (`fac_id`) REFERENCES `factura` (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of detalle_factura
-- ----------------------------

-- ----------------------------
-- Table structure for factura
-- ----------------------------
DROP TABLE IF EXISTS `factura`;
CREATE TABLE `factura` (
  `fac_id` int(11) NOT NULL AUTO_INCREMENT,
  `fac_numero_factura` varchar(50) DEFAULT NULL,
  `fac_fecha` date DEFAULT NULL,
  `fac_subtotal` double DEFAULT NULL,
  `fac_iva` double DEFAULT NULL,
  `fac_total` double DEFAULT NULL,
  `cli_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`fac_id`),
  KEY `cli_id` (`cli_id`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`cli_id`) REFERENCES `cliente` (`cli_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of factura
-- ----------------------------

-- ----------------------------
-- Table structure for producto
-- ----------------------------
DROP TABLE IF EXISTS `producto`;
CREATE TABLE `producto` (
  `pro_id` int(11) NOT NULL AUTO_INCREMENT,
  `pro_nombre` text DEFAULT NULL,
  `pro_stock` int(11) DEFAULT NULL,
  `pro_precio` double DEFAULT NULL,
  PRIMARY KEY (`pro_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of producto
-- ----------------------------
INSERT INTO `producto` VALUES ('5', 'Teclado', '10', '15.26');
INSERT INTO `producto` VALUES ('6', 'Mouse G.skill MX780', '6', '79.99');
INSERT INTO `producto` VALUES ('7', 'Monitor ASUS  27plg', '5', '599.99');
