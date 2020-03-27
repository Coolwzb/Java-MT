SELECT * FROM blog
SELECT * FROM blogger
SELECT * FROM blogtype
SELECT * FROM COMMENT
SELECT * FROM link


DROP TABLE blogger
DROP TABLE blog
DROP TABLE blogtype
DROP TABLE link
DROP TABLE COMMENT

TRUNCATE TABLE blogger
TRUNCATE TABLE blogtype
TRUNCATE TABLE blog
TRUNCATE TABLE COMMENT
TRUNCATE TABLE link


select * from person

desc blogger

create table blogger(
id int primary key auto_increment,
name varchar(50),
password varchar(50)
)

CREATE TABLE blog(
id INT PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(255),
author varchar(100),
content varchar(1000)
)

CREATE TABLE link(
id INT PRIMARY KEY AUTO_INCREMENT,
linkname VARCHAR(255),
linkurl VARCHAR(500),
urlname varchar(255)
)


CREATE TABLE blogtype(
id INT PRIMARY KEY AUTO_INCREMENT,
tname VARCHAR(255)
)

CREATE TABLE COMMENT(
id INT PRIMARY KEY AUTO_INCREMENT,
title varchar(255),
content VARCHAR(255)
)



INSERT INTO blogger(NAME,PASSWORD) VALUES('administrator','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('aaa001','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('aaa002','111111');
insert into blogger(name,password) values('aaa003','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('aaa004','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('aaa005','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('aaa006','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('aaa007','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('aaa008','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('aaa009','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('aaa010','111111');
INSERT INTO blogger(NAME,PASSWORD) VALUES('bbb001','222222');



INSERT INTO blogtype(tname) VALUES('热门文章');
INSERT INTO blogtype(tname) VALUES('最新文章');
INSERT INTO blogtype(tname) VALUES('经济动态');
INSERT INTO blogtype(tname) VALUES('商业文章');


INSERT INTO blog(title,author,content) VALUES('洛杉矶湖人','作者-2','洛杉矶湖人队（Los Angeles Lakers）是一家位于美国加利福尼亚州洛杉矶的篮球俱乐部。球队于1947年成立于明尼阿波利斯，1960年搬迁到了洛杉矶。“湖人”这个名字来源于明尼阿波利斯的别称——千湖之地，指在美国东北五大湖工作或者居住的人 [1]  。由于球衣颜色的关系，湖人又被称为“紫金军团”。
湖人于1948年加入美国职业篮球联赛（NBA）。球队的最大特点是总有巨星跟他们联系在一起。50年代，乔治·迈肯是球队早期主力中锋，在他的带领下，湖人6年间5次夺得总冠军，很快成为了NBA的豪门球队。
60年代，在埃尔金·贝勒、杰里·韦斯特、威尔特·张伯伦的带领下，湖人在整个60年代从未缺席过季后赛。
1975年，湖人得到“天勾”卡里姆·阿布杜尔-贾巴尔。1979年，湖人选中状元秀“魔术师”埃尔文·约翰逊，他在新秀赛季便带领球队夺冠并当选FMVP，同时和贾巴尔一起在80年代先后夺得了5次总冠军。 [2] 
1996年夏天，湖人签下“大鲨鱼”沙奎尔·奥尼尔，并交易得到了新秀科比·布莱恩特，两人组成了“OK组合”，带领湖人于2000-02年取得三连冠。 
2007年，保罗·加索尔加盟湖人。球队又于2008-10年三度进入总决赛并两度夺冠。2016年4月，湖人传奇球员科比宣布退役。
2018年7月2日，勒布朗·詹姆斯宣布加盟湖人。2019年6月16日，湖人交易得到了安东尼·戴维斯。
截至2019-20赛季，湖人队史共56次进入季后赛，31次获得西部冠军、16次获得总冠军，仅次于波士顿凯尔特人队（17次）；常规赛最高连胜纪录为33场（NBA历史最高）。')




















select * from person

INSERT INTO person(NAME,PASSWORD) VALUES('admin','admin');





INSERT INTO link(linkname,linkUrl) VALUES('Github','https://github.com/');
INSERT INTO link(linkname,linkUrl) VALUES('中国大学MOOC','https://www.icourse163.org/');
INSERT INTO link(linkname,linkUrl) VALUES('腾讯NBA','https://sports.qq.com/nba/');
INSERT INTO link(linkname,linkUrl) VALUES('中国知网','https://www.cnki.net/');


insert into comment(title,content) values('redis','很好');





