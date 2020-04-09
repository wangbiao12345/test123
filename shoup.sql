/*
Navicat MySQL Data Transfer

Source Server         : 王大人有大量
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : shoup

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2020-04-09 21:33:50
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for cart
-- ----------------------------
DROP TABLE IF EXISTS `cart`;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `shopName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shuliang` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopXh` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopMoney` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopcolor` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `shopimg` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `kucun` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of cart
-- ----------------------------
INSERT INTO `cart` VALUES ('16', 'Find X2 Pro 兰博基尼12+256G版超感设计，120Hz QHD+ 超感屏', '18179468360', '2', '12+128', '14999.00', '红色', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '5');
INSERT INTO `cart` VALUES ('17', 'Find X2 Pro 兰博基尼12+256G版超感设计，120Hz QHD+ 超感屏', '18179468360', '1', '12+256', '14999.00', '红色', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '5');

-- ----------------------------
-- Table structure for shopping
-- ----------------------------
DROP TABLE IF EXISTS `shopping`;
CREATE TABLE `shopping` (
  `sid` int(11) NOT NULL AUTO_INCREMENT,
  `shopImg` text COLLATE utf8_unicode_ci NOT NULL,
  `shopExplain` text COLLATE utf8_unicode_ci NOT NULL,
  `shopColor` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shopxt` text COLLATE utf8_unicode_ci NOT NULL,
  `shopName` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shopXh` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `shopMoney` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `pid` int(11) NOT NULL,
  `kuchun` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`sid`),
  KEY `shopName` (`shopName`)
) ENGINE=MyISAM AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of shopping
-- ----------------------------
INSERT INTO `shopping` VALUES ('1', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+128版', '6+64G===12+128G===12+256G', '11999.00', '0', '10');
INSERT INTO `shopping` VALUES ('2', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '6+64===12+128===12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('3', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '6+64===12+128===12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('4', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '6+64===12+128===12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('5', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '6+64===12+128===12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('6', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '6+64===12+128===12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('7', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '6+64===12+128===12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('8', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+128版', '6+64===12+128===12+256', '12999.00', '0', '10');
INSERT INTO `shopping` VALUES ('9', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '6+64===12+128===12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('10', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('11', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('12', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('13', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('14', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色===蓝色===绿色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '12+256', '14999.00', '0', '10');
INSERT INTO `shopping` VALUES ('15', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '12+256', '14999.00', '1', '5');
INSERT INTO `shopping` VALUES ('16', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '蓝色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '12+256', '14999.00', '1', '10');
INSERT INTO `shopping` VALUES ('17', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '蓝色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '12+256', '14999.00', '1', '10');
INSERT INTO `shopping` VALUES ('18', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '6+64', '11999.00', '1', '10');
INSERT INTO `shopping` VALUES ('19', 'https://image.oppo.com/content/dam/oppo/cn/mkt/homepage/middle-banner-01-findx2pro.jpg', '超感设计，120Hz QHD+ 超感屏', '红色', 'https://dsfs.oppo.com/archives/202003/202003160603535e6f57f10cdbb.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603515e6f57ef4187d.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603545e6f57f2cd5a6.png?x-oss-process=image/format,webp===https://dsfs.oppo.com/archives/202003/202003160603565e6f57f4a83e4.png?x-oss-process=image/format,webp', 'Find X2 Pro 兰博基尼12+256G版', '12+128', '14999.00', '1', '5');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `shoujihao` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(16) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'wang123', '', 'wb123456');
INSERT INTO `user` VALUES ('2', '18179468360', '', '123456');
INSERT INTO `user` VALUES ('3', '18179468361', '', 'wb123456');
INSERT INTO `user` VALUES ('4', '18179468362', '', 'wb123456');
INSERT INTO `user` VALUES ('5', '18179468363', '', 'wb123456');
INSERT INTO `user` VALUES ('6', '18179468364', '', 'wb123456');
INSERT INTO `user` VALUES ('7', '18179468365', '', 'wb123456');
INSERT INTO `user` VALUES ('8', '18179468366', '', 'wb199898');
