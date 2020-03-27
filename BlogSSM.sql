/*
SQLyog Ultimate v12.08 (64 bit)
MySQL - 5.7.17-log : Database - blog
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`blog` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `blog`;

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `author` varchar(100) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `blog` */

insert  into `blog`(`id`,`title`,`author`,`content`) values (1,'Redis 性能问题分析','作者-1','Redis的性能基本面：\r\n  首先，Redis使用操作系统提供的虚拟内存来存储数据。而且，这个操作系统一般就是指 Unix。Windows 上也能运行Redis，但是需要特殊处理。如果你的操作系统使用交换空间，那么 Redis 的数据可能会被实际保存在硬盘上。其次，Redis支持持久化，可以把数据保存在硬盘上。很多时候，我们也确实有必要进行持久化来实现备份，数据恢复等需求。但持久化不会凭空发生，它也会占用一部分资源。第三，Redis是用 key-value 的方式来读写的，而 value中又可以是很多不同种类的数据；更进一步，一个数据类型的底层还有被存储为不同的结构。不同的存储结构决定了数据增删改查的复杂度以及性能开销。最后，在上面的介绍中没有提到的是，Redis大多数时候是单线程运行的（single-threaded)，即同一时间只占用一个CPU，只能有一个指令在运行，并行读写是不存在的。很多操作带来的延迟问题，都可以在这里找到答案。关于最后这个特性，为什么Redis 是单线程的，却能有很好的性能(根据 Amdahl’sLaw，优化耗时占比大的过程，才更有意义)，两句话概括是：Redis 利用了多路 I/O复用机制，处理客户端请求时，不会阻塞主线程；Redis 单纯执行（大多数指令）一个指令不到 1 微秒，如此，单核 CPU一秒就能处理 1 百万个指令（大概对应着几十万个请求吧），用不着实现多线程（网络才是瓶颈）。'),(2,'洛杉矶湖人','作者-2','洛杉矶湖人队（Los AngelesLakers）是一家位于美国加利福尼亚州洛杉矶的篮球俱乐部。球队于1947年成立于明尼阿波利斯，1960年搬迁到了洛杉矶。“湖人”这个名字来源于明尼阿波利斯的别称——千湖之地，指在美国东北五大湖工作或者居住的人。由于球衣颜色的关系，湖人又被称为“紫金军团”。湖人于1948年加入美国职业篮球联赛（NBA）。球队的最大特点是总有巨星跟他们联系在一起。50年代，乔治·迈肯是球队早期主力中锋，在他的带领下，湖人6年间5次夺得总冠军，很快成为了NBA的豪门球队。60年代，在埃尔金·贝勒、杰里·韦斯特、威尔特·张伯伦的带领下，湖人在整个60年代从未缺席过季后赛。1975年，湖人得到“天勾”卡里姆·阿布杜尔-贾巴尔。1979年，湖人选中状元秀“魔术师”埃尔文·约翰逊，他在新秀赛季便带领球队夺冠并当选FMVP，同时和贾巴尔一起在80年代先后夺得了5次总冠军。1996年夏天，湖人签下“大鲨鱼”沙奎尔·奥尼尔，并交易得到了新秀科比·布莱恩特，两人组成了“OK组合”，带领湖人于2000-02年取得三连冠。2007年，保罗·加索尔加盟湖人。球队又于2008-10年三度进入总决赛并两度夺冠。2016年4月，湖人传奇球员科比宣布退役。2018年7月2日，勒布朗·詹姆斯宣布加盟湖人。2019年6月16日，湖人交易得到了安东尼·戴维斯。截至2019-20赛季，湖人队史共56次进入季后赛，31次获得西部冠军、16次获得总冠军，仅次于波士顿凯尔特人队（17次）；常规赛最高连胜纪录为33场（NBA历史最高）。\')\r\n  在19-20赛季，湖人如今位列西部第一，高居联盟第二，这赛季湖人一路高歌猛进，有很大几率获得球队的第17座总冠军。'),(3,'Spring Boot、Spring MVC 和 Spring 有什么区别？','作者-3','Spring 框架就像一个家族，有众多衍生产品例如boot、security、jpa等等。但他们的基础都是Spring 的ioc和 aop，ioc 提供了依赖注入的容器，aop解决了面向横切面的编程，然后在此两者的基础上实现了其他延伸产品的高级功能。\r\n  SpringMVC提供了一种轻度耦合的方式来开发web应用。它是Spring的一个模块，是一个web框架。通过DispatcherServlet, ModelAndView 和 ViewResolver，开发web应用变得很容易。解决的问题领域是网站应用程序或者服务开发——URL路由、Session、模板引擎、静态Web资源等等。 \r\n  SpringBoot实现了自动配置，降低了项目搭建的复杂度。它主要是为了解决使用Spring框架需要进行大量的配置太麻烦的问题，所以它并不是用来替代Spring的解决方案，而是和Spring框架紧密结合用于提升Spring开发者体验的工具。同时它集成了大量常用的第三方库配置(例如Jackson,JDBC, Mongo, Redis, Mail等等)，SpringBoot应用中这些第三方库几乎可以零配置的开箱即用(out-of-the-box)。\r\n  所以，用最简练的语言概括就是: Spring是一个“引擎”; Spring MVC 是基于Spring的一个 MVC 框架; Spring Boot是基于Spring4的条件注册的一套快速开发整合包。');

/*Table structure for table `blogger` */

DROP TABLE IF EXISTS `blogger`;

CREATE TABLE `blogger` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `password` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

/*Data for the table `blogger` */

insert  into `blogger`(`id`,`name`,`password`) values (1,'administrator','d44a5a7ba3f624d4b85473c14c427eaa'),(2,'aaa001','58b100fe8e5b90017f72b669c285732f'),(3,'aaa002','a2aae75fd6ad77e4b904d6daae4d2bfe'),(4,'bbb001','fd1b67f568aa14995378fea47013785b'),(5,'bbb002','8fe8470f01b0da89d5aa7adb05829a0e');

/*Table structure for table `blogtype` */

DROP TABLE IF EXISTS `blogtype`;

CREATE TABLE `blogtype` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

/*Data for the table `blogtype` */

insert  into `blogtype`(`id`,`tname`) values (1,'热门文章'),(2,'最新文章'),(3,'经济动态'),(4,'体育文章');

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

insert  into `comment`(`id`,`title`,`content`) values (1,'redis','很好');

/*Table structure for table `link` */

DROP TABLE IF EXISTS `link`;

CREATE TABLE `link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `linkname` varchar(255) DEFAULT NULL,
  `linkurl` varchar(500) DEFAULT NULL,
  `urlname` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

/*Data for the table `link` */

insert  into `link`(`id`,`linkname`,`linkurl`,`urlname`) values (1,'中国大学MOOC','https://www.icourse163.org/','千所中国高校，近万课程资源'),(2,'慕课网','https://www.imooc.com/','慕课网，程序员的工厂'),(3,'Layui文档','https://www.layui.com/doc/element/form.html','前端框架，适合界面的快速开发'),(4,'会打篮球的程序猿','https://www.lzhpo.com','一个程序员的原创博客'),(5,'网易人工智能','https://ai.163.com/#/m/overview','基于AI能力，提供全新产品服务体验'),(6,'腾讯NBA','https://sports.qq.com/nba/','NBA中国数字媒体合作伙伴'),(7,'IT工程师','https://weibo.com/u/1749224837?from=myfollow_all&is_all=1','新浪微博知名科技博主'),(8,'在码圈','https://www.arcinbj.com/','代码改变未来，努力codeing'),(9,'AiLinkLif','http://www.jiangxindc.com','Java教程博客，人工智能技术博客，分享技术，分享生活，分享资料'),(10,'网易云音乐','https://music.163.com/','网易云音乐，享受无限的乐趣'),(11,'GitHub','https://github.com/','GitHub,程序员的代码库'),(12,'湖人最前线','https://weibo.com/u/5979001958?from=myfollow_all&is_all=1','知名体育博主 体育视频自媒体');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
