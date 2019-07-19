#数据库  创建 插入数据
#设置编码
SET NAMES UTF8;
#丢弃数据库  前提存在
DROP DATABASE IF EXISTS swq;
#创建数据库
CREATE DATABASE swq CHARSET=UTF8;
#进入创建的数据库
USE swq;
#创建保存数据的表
#网页表
CREATE TABLE watch(
   wid INT,
   wname VARCHAR(30)
);



#手表型号家族        主键约束
CREATE TABLE swq_watch_family(
	fid INT PRIMARY KEY AUTO_INCREMENT,   #手表家族
	fname VARCHAR(32)
);

#手表
CREATE TABLE swq_watch(
	lid INT PRIMARY KEY AUTO_INCREMENT,    #编号
	family_id INT,					#所属家族编号
	title VARCHAR(60),              #标题
	price DECIMAL(10,2),            #价格
	spec VARCHAR(50),               #颜色

	lname VARCHAR(32),              #商品名称
	style VARCHAR(20),              #款式
	dial_dia VARCHAR(12),           #表盘直径
	dial_thick VARCHAR(12),			#表盘厚度
	waterorrof VARCHAR(32),         #防水深度
	watchband VARCHAR(12),          #表带材质
	movement VARCHAR(12),           #机芯
	trait VARCHAR(12),              #特点
	details VARCHAR(500),           #详细说明

	putaway_time VARCHAR(32),       #上架时间
	sold_count INT,                 #已售出数量
	is_onsale BOOLEAN               #是否促销中
	);

#用户信息
	CREATE TABLE swq_user(
  		 sid INT PRIMARY KEY AUTO_INCREMENT,    #编号
 		 sname VARCHAR(32),                     #用户名
 		 upwd VARCHAR(32),                      #密码
 		 email VARCHAR(64),                     #邮箱
		 phone VARCHAR(16),                     #电话

         avatar VARCHAR(128),       		    #头像图片路径
  		 user_name VARCHAR(32),                 #真实用户名
  		 gender INT                             #性别  0-女  1-男
);


#收货地址信息
	CREATE TABLE swq_receiver_address(
  		 sid INT PRIMARY KEY AUTO_INCREMENT,
 		 user_id INT,                #用户编号
 		 receiver VARCHAR(16),       #接收人姓名
 		 province VARCHAR(16),       #省
 		 city VARCHAR(16),           #市
 		 county VARCHAR(16),         #县
		 address VARCHAR(128),       #详细地址
		 cellphone VARCHAR(16),      #手机
 		 fixedphone VARCHAR(16),     #固定电话
		 postcode CHAR(6),           #邮编
		 tag VARCHAR(16),            #标签名

 		 is_default BOOLEAN          #是否为当前用户的默认收货地址
);


#购物车条目
	CREATE TABLE swq_shoppingcart_item(
  		sid INT PRIMARY KEY AUTO_INCREMENT,
  		user_id INT,      #用户编号
  		product_id INT,   #商品编号
  		count INT,        #购买数量
  		is_checked BOOLEAN #是否已勾选，确定购买
);


#用户订单
	CREATE TABLE swq_order(
  		sid INT PRIMARY KEY AUTO_INCREMENT,
  		user_id INT,
  		address_id INT,
  		status INT,             #订单状态  1-等待付款  2-等待发货  3-运输中  4-已签收  5-已取消
  		order_time BIGINT,      #下单时间
  		pay_time BIGINT,        #付款时间
  		deliver_time BIGINT,    #发货时间
  		received_time BIGINT    #签收时间
	)AUTO_INCREMENT=10000000;



/**用户订单**/
	CREATE TABLE swq_order_detail(
  		sid INT PRIMARY KEY AUTO_INCREMENT,
  		order_id INT,           #订单编号
  		product_id INT,         #产品编号
  		count INT               #购买数量
);

/****首页轮播广告商品****/
	CREATE TABLE swq_index_carousel(
  		sid INT PRIMARY KEY AUTO_INCREMENT,
  		img VARCHAR(128),
  		title VARCHAR(64),
  		href VARCHAR(128)
);


/****首页商品****/
	CREATE TABLE swq_index_product(
  		sid INT PRIMARY KEY AUTO_INCREMENT,
  		title VARCHAR(64),
  		details VARCHAR(128),
  		pic VARCHAR(128),
  		price DECIMAL(10,2),
  		href VARCHAR(128),
  		seq_recommended TINYINT,
  		seq_new_arrival TINYINT,
  		seq_top_sale TINYINT
);



#向数据表中插入数据
INSERT INTO swq_watch_family VALUES(100,"swatch_metal"); #金属家族
INSERT INTO swq_watch_family VALUES(200,"swatch_neutral"); #中性家族
INSERT INTO swq_watch_family VALUES(300,"swatch_origin"); #原创家族


#用户信息
INSERT INTO swq_user VALUES(NULL,"tom","qwe25252525","hhwhu@163.com","13145855895","img/1.jpg","汤姆","1");
INSERT INTO swq_user VALUES(NULL,"lucy","wue6665566","hjsds@163.com","15225269698","img/2.jpg","露西","0");
INSERT INTO swq_user VALUES(NULL,"qieli","ejwiwie558","trrffr@qq.com","18759964582","img/3.jpg","凯丽","0");
INSERT INTO swq_user VALUES(NULL,"jirry","nndol25563","sdsss@qq.com","15326987456","img/4.jpg","杰瑞","1");
INSERT INTO swq_user VALUES(NULL,"mariya","iuiu2562311","sweeef@126.com","13025478495","img/5.jpg","玛利亚","0");
INSERT INTO swq_user VALUES(NULL,"aisasi","popo7888877","hgghg@126.com","18158582465","img/6.jpg","爱丝","0");
INSERT INTO swq_user VALUES(NULL,"lnbote","uyuyyh785558","pooiik@163.com","18959878959","img/7.jpg","罗伯特","1");
INSERT INTO swq_user VALUES(NULL,"qooaz","wewsse554489","tutjji@qq.com","13658966595","img/8.jpg","乔治","1");

#手表数据
INSERT INTO  swq_watch VALUES(NULL,"100","商务男表，攀登吧","890.00","灰色，蓝色","YES4004","中性","41mm","11mm","30米生活防水","硅胶","石英","商务精英系列","2015款，彰显气质，成熟的品格","2015-5-5","3255","1");
INSERT INTO  swq_watch VALUES(NULL,"300","原创色彩密码系列，海洋之夜","309.00","黑色，蓝色","GB281","中性","33mm","8mm","30米生活防水","硅胶","石英","表镜合成树脂，物美价廉","通用，石英表，海洋之夜","2017-3-13","6957","1");
INSERT INTO  swq_watch VALUES(NULL,"200","王俊凯同款","780.00","白色，白色","SVUW101","中性","42mm","5.56mm","30米生活防水","硅胶","石英","Swatch-New Skin系列","SVUW101，凯凯的心仪之选，超薄","2018-6-5","9911","1");
INSERT INTO  swq_watch VALUES(NULL,"100","Swatch-New Skin系列","688.00","蓝色,银色","SVOS100","中性","38mm","6.15mm","30米生活防水","硅胶","石英","女表","蓝色条纹，变换的美","2017-5-23","4565","1");
INSERT INTO  swq_watch VALUES(NULL,"300","璀璨钻石，石英之光","688.00","白色，白色","SFK360","女表","32mm","3.9mm","3bar防水","硅胶","石英","Swatch-Lifestyle系列原创","洁白，通体亮眼","2018-9-13","11025","1");
INSERT INTO  swq_watch VALUES(NULL,"200","圈线环绕，个性革新","688.00","白色，黑色","SVOW100","中性","38mm","5.4mm","30米生活防水","硅胶","石英","Swatch-New Skin系列","休闲搭配，得意之选","2017-5-25","6655","1");
INSERT INTO  swq_watch VALUES(NULL,"300","炫动蓝色，彩虹线条，带出格调","498.00","蓝色，彩色","SUOZ277","中性","42mm","9.85mm","30米生活防水","硅胶","石英","Swatch-Olympic系列","2018冬奥会订制限量版","2018-7-12","7555","1");
INSERT INTO  swq_watch VALUES(NULL,"200","黑暗格调，一点光亮","498.00","灰色，黑色","SUOB702","中性","43mm","9.85mm","30米生活防水","硅胶","石英","黑色臆想，深沉之作","夜光，隐藏","2018-12-12","6655","1");




