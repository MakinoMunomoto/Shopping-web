-- ----------------------------
-- Table structure for `carts`
-- ----------------------------
DROP TABLE IF EXISTS carts;
CREATE TABLE carts (
  userName varchar(255) default NULL,
  Id varchar(255) default NULL,
  path varchar(255) default NULL,
  shopname varchar(255) default NULL,
  price varchar(255) default NULL,
  color varchar(255) default NULL,
  decribe varchar(255) default NULL
)

-- ----------------------------
-- Records of carts
-- ----------------------------
INSERT INTO carts VALUES ('fan', '05', '04.webp', '蓝牙运动耳机', '￥ 299.00', '红色', 'IPX5级防水设计.佩戴舒适');
INSERT INTO carts VALUES ('vvv4', '05', '04.webp', '蓝牙运动耳机', '￥ 299.00', '红色', 'IPX5级防水设计.佩戴舒适');

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
DROP TABLE IF EXISTS goods;
CREATE TABLE goods (
  Id varchar(255) NOT NULL,
  name varchar(255) NOT NULL,
  price varchar(255) NOT NULL,
  color varchar(255) NOT NULL,
  storage varchar(255) NOT NULL,
  path varchar(255) NOT NULL,
  describe varchar(255) NOT NULL,
  PRIMARY KEY  (Id)
) 

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO goods VALUES ('01', '保护膜', '49', '黑色', '2500', '01.webp', '');
INSERT INTO goods VALUES ('02', '智能呼吸机', '3499', '白色', '4200', '02.jpg', '');
INSERT INTO goods VALUES ('03', '卫衣热血', '199', '灰色', '45000', '03.png', '');
INSERT INTO goods VALUES ('04', '卫衣大爆炸', '199', '灰黑色', '15000', '05.png', '');
INSERT INTO goods VALUES ('05', '蓝牙耳机', '299', '红色', '24000', '04.webp', '');
INSERT INTO goods VALUES ('06', '记事本', '49', '黑色', '65000', '06.jpg', '');
INSERT INTO goods VALUES ('07', '明信片', '199', '彩色', '7000', '07.jpg', '');
INSERT INTO goods VALUES ('08', '无限电视H1S', '4399', '灰色', '4900', '08.jpg', '');

-- ----------------------------
-- Table structure for `my_users`
-- ----------------------------
DROP TABLE IF EXISTS my_users;
CREATE TABLE my_users (
  userName varchar(20) NOT NULL,
  password varchar(20) NOT NULL,
  realName varchar(20) default NULL,
  phone varchar(25) default NULL,
  email varchar(50) default NULL,
  address varchar(150) default NULL,
  PRIMARY KEY  (userName)
)

-- ----------------------------
-- Records of my_users
-- ----------------------------

-- ----------------------------
-- Table structure for `personcart`
-- ----------------------------
DROP TABLE IF EXISTS personcart;
CREATE TABLE personcart (
  name varchar(255) NOT NULL,
  goods varchar(255) default NULL,
  num varchar(255) default NULL,
  PRIMARY KEY  (name)
)

-- ----------------------------
-- Records of personcart
-- ----------------------------

-- ----------------------------
-- Table structure for `purchaserecord`
-- ----------------------------
DROP TABLE IF EXISTS purchaserecord;
CREATE TABLE purchaserecord(
  path varchar(255) NOT NULL,
  shopname varchar(255) NOT NULL,
  shopnum varchar(255) NOT NULL,
  price varchar(255) NOT NULL,
  sum varchar(255) NOT NULL,
  phonenum varchar(255) NOT NULL,
  userName varchar(255) NOT NULL
)

-- ----------------------------
-- Records of purchaserecord
-- ----------------------------

-- ----------------------------
-- Table structure for `test`
-- ----------------------------
DROP TABLE IF EXISTS test;
CREATE TABLE test (
  name varchar(255) NOT NULL,
  title varchar(255) default NULL,
  message varchar(255) default NULL,
  date varchar(255) NOT NULL
)

-- ----------------------------
-- Table structure for leaveMessage
-- ----------------------------
DROP TABLE IF EXISTS leaveMessage;
create table leaveMessage(
name varchar(255),
title varchar(255),
message varchar(255),
date varchar(255)
)
