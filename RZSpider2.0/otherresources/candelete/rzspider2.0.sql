-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.6.19 - MySQL Community Server (GPL)
-- Server OS:                    Win64
-- HeidiSQL Version:             9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for rzspider
DROP DATABASE IF EXISTS `rzspider`;
CREATE DATABASE IF NOT EXISTS `rzspider` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `rzspider`;

-- Dumping structure for table rzspider.blog_blogcontent
DROP TABLE IF EXISTS `blog_blogcontent`;
CREATE TABLE IF NOT EXISTS `blog_blogcontent` (
  `cid` bigint(20) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL COMMENT '标题',
  `slug` varchar(255) DEFAULT NULL,
  `created` bigint(20) DEFAULT NULL COMMENT '创建人id',
  `modified` bigint(20) DEFAULT NULL COMMENT '最近修改人id',
  `content` text COMMENT '内容',
  `type` varchar(16) DEFAULT NULL COMMENT '类型',
  `tags` varchar(200) DEFAULT NULL COMMENT '标签',
  `categories` varchar(200) DEFAULT NULL COMMENT '分类',
  `hits` int(5) DEFAULT NULL,
  `comments_num` int(5) DEFAULT '0' COMMENT '评论数量',
  `like_num` int(5) DEFAULT '0' COMMENT '点赞数',
  `allow_comment` int(1) DEFAULT '0' COMMENT '开启评论',
  `allow_ping` int(1) DEFAULT '0' COMMENT '允许ping',
  `allow_feed` int(1) DEFAULT '0' COMMENT '允许反馈',
  `status` int(1) DEFAULT NULL COMMENT '状态',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `gtm_create` datetime DEFAULT NULL COMMENT '创建时间',
  `gtm_modified` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容';

-- Dumping data for table rzspider.blog_blogcontent: ~0 rows (approximately)
/*!40000 ALTER TABLE `blog_blogcontent` DISABLE KEYS */;
/*!40000 ALTER TABLE `blog_blogcontent` ENABLE KEYS */;

-- Dumping structure for table rzspider.book_bookmanage
DROP TABLE IF EXISTS `book_bookmanage`;
CREATE TABLE IF NOT EXISTS `book_bookmanage` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `book_name` varchar(50) NOT NULL COMMENT '图书名称',
  `book_author` varchar(50) DEFAULT '' COMMENT '图书作者',
  `book_publisher` varchar(50) DEFAULT '' COMMENT '图书出版社',
  `book_ISBN` varchar(20) DEFAULT '' COMMENT '图书ISBN',
  `book_des` varchar(500) DEFAULT '' COMMENT '图书简介',
  `book_language` varchar(50) DEFAULT '' COMMENT '图书语言',
  `book_original_price` varchar(10) DEFAULT NULL COMMENT '图书定价',
  `book_purchase_price` varchar(10) DEFAULT NULL COMMENT '图书购买价',
  `book_publish_time` varchar(50) DEFAULT NULL COMMENT '图书出版日期',
  `book_classification` varchar(50) DEFAULT '' COMMENT '图书分类',
  `book_binding` varchar(50) DEFAULT '' COMMENT '图书装帧',
  `book_pages` int(5) DEFAULT NULL COMMENT '图书页数',
  `book_stay_address` varchar(50) DEFAULT '' COMMENT '图书所在地',
  `book_read_status` int(1) DEFAULT '1' COMMENT '阅读状态',
  `book_read_star` int(2) DEFAULT '0' COMMENT '阅读星级',
  `book_read_evaluation` varchar(500) DEFAULT '' COMMENT '阅读评价',
  `user_id` int(11) DEFAULT '1' COMMENT '用户ID',
  `status` int(1) DEFAULT '0' COMMENT '在馆状态',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='图书详情表';

-- Dumping data for table rzspider.book_bookmanage: ~0 rows (approximately)
/*!40000 ALTER TABLE `book_bookmanage` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_bookmanage` ENABLE KEYS */;

-- Dumping structure for table rzspider.book_intention
DROP TABLE IF EXISTS `book_intention`;
CREATE TABLE IF NOT EXISTS `book_intention` (
  `book_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `book_name` varchar(50) NOT NULL COMMENT '图书名称',
  `book_author` varchar(50) DEFAULT '' COMMENT '图书作者',
  `book_publisher` varchar(50) DEFAULT '' COMMENT '图书出版社',
  `book_ISBN` varchar(20) DEFAULT '' COMMENT '图书ISBN',
  `book_des` varchar(500) DEFAULT '' COMMENT '图书简介',
  `book_original_price` varchar(10) DEFAULT NULL COMMENT '图书定价',
  `book_classification` varchar(50) DEFAULT '' COMMENT '图书分类',
  `book_binding` varchar(50) DEFAULT '' COMMENT '图书装帧',
  `book_pages` int(5) DEFAULT NULL COMMENT '图书页数',
  `book_read_star` int(2) DEFAULT '0' COMMENT '购买星级',
  `user_id` int(11) DEFAULT '1' COMMENT '用户ID',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`book_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='图书购买意向详情表';

-- Dumping data for table rzspider.book_intention: ~0 rows (approximately)
/*!40000 ALTER TABLE `book_intention` DISABLE KEYS */;
/*!40000 ALTER TABLE `book_intention` ENABLE KEYS */;

-- Dumping structure for table rzspider.commongame_gamelist
DROP TABLE IF EXISTS `commongame_gamelist`;
CREATE TABLE IF NOT EXISTS `commongame_gamelist` (
  `game_list_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '游戏ID',
  `game_nick_name` varchar(50) NOT NULL COMMENT '游戏昵称',
  `game_name` varchar(50) NOT NULL COMMENT '游戏名称',
  `game_instruction` varchar(500) DEFAULT '' COMMENT '游戏说明',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`game_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通用游戏列表';

-- Dumping data for table rzspider.commongame_gamelist: ~0 rows (approximately)
/*!40000 ALTER TABLE `commongame_gamelist` DISABLE KEYS */;
/*!40000 ALTER TABLE `commongame_gamelist` ENABLE KEYS */;

-- Dumping structure for table rzspider.commongame_gamemanage
DROP TABLE IF EXISTS `commongame_gamemanage`;
CREATE TABLE IF NOT EXISTS `commongame_gamemanage` (
  `game_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '游戏id',
  `game_back_id` int(20) NOT NULL COMMENT '游戏后台ID',
  `game_name` varchar(50) NOT NULL COMMENT '游戏名称',
  `game_des` varchar(500) DEFAULT '' COMMENT '游戏描述',
  `game_type` int(1) DEFAULT '0' COMMENT '游戏类型（网页版客户端版）',
  `game_code_type` int(1) DEFAULT '0' COMMENT '游戏代码类型',
  `src_download_status` int(1) DEFAULT '1' COMMENT '源码是否可下载',
  `execexe_download_status` int(1) DEFAULT '1' COMMENT '可执行exe是否可下载',
  `setupexe_download_status` int(1) DEFAULT '1' COMMENT '安装版exe是否可下载',
  `src_file_name` varchar(50) DEFAULT NULL COMMENT '源码文件名',
  `execexe_file_name` varchar(50) DEFAULT NULL COMMENT '可执行exe文件名',
  `setupexe_name` varchar(50) DEFAULT NULL COMMENT '安装版exe文件名',
  `status` int(1) DEFAULT '0' COMMENT '可用状态',
  `create_type` int(1) DEFAULT '1' COMMENT '创建类型',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`game_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通用游戏管理';

-- Dumping data for table rzspider.commongame_gamemanage: ~0 rows (approximately)
/*!40000 ALTER TABLE `commongame_gamemanage` DISABLE KEYS */;
/*!40000 ALTER TABLE `commongame_gamemanage` ENABLE KEYS */;

-- Dumping structure for table rzspider.commontool_toollist
DROP TABLE IF EXISTS `commontool_toollist`;
CREATE TABLE IF NOT EXISTS `commontool_toollist` (
  `tool_list_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '工具id',
  `tool_nick_name` varchar(50) NOT NULL COMMENT '工具昵称',
  `tool_name` varchar(50) NOT NULL COMMENT '工具名称',
  `tool_instruction` varchar(500) DEFAULT '' COMMENT '工具说明',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`tool_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='通用工具列表';

-- Dumping data for table rzspider.commontool_toollist: ~0 rows (approximately)
/*!40000 ALTER TABLE `commontool_toollist` DISABLE KEYS */;
/*!40000 ALTER TABLE `commontool_toollist` ENABLE KEYS */;

-- Dumping structure for table rzspider.commontool_toolmanage
DROP TABLE IF EXISTS `commontool_toolmanage`;
CREATE TABLE IF NOT EXISTS `commontool_toolmanage` (
  `tool_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '工具id',
  `tool_back_id` int(20) NOT NULL COMMENT '工具后台ID',
  `tool_name` varchar(50) NOT NULL COMMENT '工具名称',
  `tool_des` varchar(500) DEFAULT '' COMMENT '工具描述',
  `tool_type` int(1) DEFAULT '0' COMMENT '工具类型（网页版客户端版）',
  `tool_code_type` int(1) DEFAULT '0' COMMENT '工具代码类型',
  `src_download_status` int(1) DEFAULT '1' COMMENT '源码是否可下载',
  `execexe_download_status` int(1) DEFAULT '1' COMMENT '可执行exe是否可下载',
  `setupexe_download_status` int(1) DEFAULT '1' COMMENT '安装版exe是否可下载',
  `src_file_name` varchar(50) DEFAULT NULL COMMENT '源码文件名',
  `execexe_file_name` varchar(50) DEFAULT NULL COMMENT '可执行exe文件名',
  `setupexe_name` varchar(50) DEFAULT NULL COMMENT '安装版exe文件名',
  `status` int(1) DEFAULT '0' COMMENT '可用状态',
  `create_type` int(1) DEFAULT '1' COMMENT '创建类型',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`tool_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='通用工具管理';

-- Dumping data for table rzspider.commontool_toolmanage: ~11 rows (approximately)
/*!40000 ALTER TABLE `commontool_toolmanage` DISABLE KEYS */;
INSERT INTO `commontool_toolmanage` (`tool_id`, `tool_back_id`, `tool_name`, `tool_des`, `tool_type`, `tool_code_type`, `src_download_status`, `execexe_download_status`, `setupexe_download_status`, `src_file_name`, `execexe_file_name`, `setupexe_name`, `status`, `create_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 30001, '二维码生成', '文本，链接等生成二维码', 0, 1, 1, 1, 1, NULL, NULL, NULL, 0, 0, 'superadmin', '2018-07-19 16:45:05', 'superadmin', '2018-08-03 12:48:37', ''),
	(2, 30002, '二维码解析', '图片二维码解析', 0, 0, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', NULL, '', NULL, ''),
	(3, 30003, 'OCR识别文字', '简单OCR识别图片文字', 0, 0, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', NULL, '', NULL, ''),
	(4, 30004, '魔方拼图', '生成魔方图案', 0, 0, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', NULL, '', NULL, ''),
	(5, 30005, '字符画生成', '图片生成字符画', 0, 0, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', NULL, '', NULL, ''),
	(6, 30006, '文本格式化', '格式化JSON，多行转一行等等', 0, 0, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', NULL, 'superadmin', '2018-07-23 12:41:06', ''),
	(7, 30007, '计算器', '各种计算器', 0, 0, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', NULL, '', NULL, ''),
	(8, 30008, '邮件系统', '发送，接收邮件', 0, 0, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', NULL, '', NULL, ''),
	(9, 30009, '正则表达式匹配', '匹配正则表达式', 0, 0, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', NULL, '', NULL, ''),
	(10, 30010, '代码格式化', '格式化各种代码', 0, 0, 1, 1, 1, NULL, NULL, NULL, 0, 0, '', NULL, '', NULL, ''),
	(11, 32001, '截图2.0', '客户端截图软件', 1, 0, 1, 1, 1, NULL, NULL, NULL, 0, 1, 'superadmin', '2018-08-07 01:31:24', '', '2018-08-07 01:31:24', '');
/*!40000 ALTER TABLE `commontool_toolmanage` ENABLE KEYS */;

-- Dumping structure for table rzspider.music_musiclist
DROP TABLE IF EXISTS `music_musiclist`;
CREATE TABLE IF NOT EXISTS `music_musiclist` (
  `music_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '歌曲id',
  `baseset_id` int(5) DEFAULT '0' COMMENT '基础设置id',
  `title` varchar(255) DEFAULT '' COMMENT '歌曲名',
  `author` varchar(255) DEFAULT '' COMMENT '歌手',
  `url` varchar(255) DEFAULT '' COMMENT '歌曲链接',
  `pic` varchar(255) DEFAULT '' COMMENT '歌曲封面链接',
  `lrc` text COMMENT '歌曲歌词',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`music_id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COMMENT='歌曲信息';

-- Dumping data for table rzspider.music_musiclist: ~56 rows (approximately)
/*!40000 ALTER TABLE `music_musiclist` DISABLE KEYS */;
INSERT INTO `music_musiclist` (`music_id`, `baseset_id`, `title`, `author`, `url`, `pic`, `lrc`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(29, 4, '讲真的', '曾惜', 'http://music.163.com/song/media/outer/url?id=30987293.mp3', 'http://p1.music.126.net/cd9tDyVMq7zzYFbkr0gZcw==/2885118513459477.jpg?param=300x300', '[by:却连一句我爱你都不能说出口]\\n[ti:讲真的]\\n[ar:曾惜]\\n[al:不要你为难]\\n[by:冰城离殇]\\n[00:00] 作曲 : 何诗蒙\\n[00:01] 作词 : 黄然\\n[00:18]今夜特别漫长\\n[00:21]有个号码一直被存放\\n[00:25]源自某种倔强\\n[00:30]不舍删去又不敢想\\n[00:33]明明对你念念不忘\\n[00:37]思前想后愈发紧张\\n[00:41]无法深藏\\n[00:43]爱没爱过想听你讲\\n[00:48]讲真的\\n[00:51]会不会是我 被鬼迷心窍了\\n[00:54]敷衍了太多 我怎么不难过\\n[00:58]要你亲口说 别只剩沉默\\n[01:03]或许你早就回答了我\\n[01:06]讲真的\\n[01:08]想得不可得 是最难割舍的\\n[01:11]各自好好过 也好过一直拖\\n[01:15]自作多情了 好吧我认了\\n[01:19]至少能换来释怀洒脱\\n[01:23]没丢失掉自我\\n[01:42]今夜特别漫长\\n[01:44]有个号码一直被存放\\n[01:49]源自某种倔强\\n[01:53]不舍删去又不敢想\\n[01:57]明明对你念念不忘\\n[02:01]思前想后愈发紧张\\n[02:05]无法深藏\\n[02:08]爱没爱过想听你讲\\n[02:13]讲真的\\n[02:15]会不会是我 被鬼迷心窍了\\n[02:19]敷衍了太多 我怎么不难过\\n[02:23]要你亲口说 别只剩沉默\\n[02:27]或许你早就回答了我\\n[02:30]讲真的\\n[02:32]想得不可得 是最难割舍的\\n[02:35]各自好好过 也好过一直拖\\n[02:40]自作多情了 好吧我认了\\n[02:44]至少能换来释怀洒脱\\n[02:47]没丢失掉自我\\n[03:04]讲真的\\n[03:05]会不会是我 被鬼迷心窍了\\n[03:09]敷衍了太多 我怎么不难过\\n[03:14]要你亲口说 别只剩沉默\\n[03:18]或许你早就回答了我\\n[03:21]讲真的\\n[03:22]想得不可得 是最难割舍的\\n[03:26]各自好好过 也好过一直拖\\n[03:30]自作多情了 好吧我认了\\n[03:35]至少能换来释怀洒脱\\n[03:38]没丢失掉自我\\n', 'superadmin', '2018-06-29 22:08:54', 'superadmin', '2018-07-24 14:57:06', ''),
	(31, 4, '学猫叫', '小潘潘', 'http://music.163.com/song/media/outer/url?id=554191055.mp3', 'http://p1.music.126.net/D1Ov-XMAwUzsr16mQk95fA==/109951163256119128.jpg?param=300x300', '[00:00.00] 作曲 : 小峰峰[00:01.00] 作词 : 小峰峰[00:05.03]编曲：吕宏斌&塞米七[00:05.28]和声：小峰峰[00:05.45]混音：陈秋洁[00:05.63]制作人：小峰峰[00:05.85]唱片：麦袭时代[00:06.40]OP：百纳娱乐[00:06.93][00:07.96]小潘潘：[00:08.31]我们一起学猫叫[00:10.58]一起喵喵喵喵喵[00:12.60]在你面前撒个娇[00:14.71]哎呦喵喵喵喵喵[00:16.77]我的心脏砰砰跳[00:18.85]迷恋上你的坏笑[00:21.31]你不说爱我我就喵喵喵[00:24.10][00:24.75]小峰峰：[00:26.17]每天都需要你的拥抱[00:29.08]珍惜在一起的每分每秒[00:33.35]你对我多重要[00:35.21]我想你比我更知道[00:38.00]你就是我的女主角[00:41.34][00:41.80]小潘潘：[00:42.80]有时候我懒的像只猫[00:45.69]脾气不好时又张牙舞爪[00:50.10]你总是温柔的[00:51.96]能把我的心融化掉[00:54.65]我想要当你的小猫猫[00:59.93][01:00.38]合：[01:00.70]我们一起学猫叫[01:02.69]一起喵喵喵喵喵[01:04.72]在你面前撒个娇[01:06.81]哎呦喵喵喵喵喵[01:08.82]我的心脏砰砰跳[01:10.79]迷恋上你的坏笑[01:13.42]你不说爱我我就喵喵喵[01:16.86][01:17.23]我们一起学猫叫[01:19.30]一起喵喵喵喵喵[01:21.45]我要穿你的外套[01:23.55]闻你身上的味道[01:25.62]想要变成你的猫[01:27.68]赖在你怀里睡着[01:30.17]每天都贪恋着你的好[01:33.85][01:50.67]小潘潘：[01:51.73]有时候我懒的像只猫[01:54.62]脾气不好时又张牙舞爪[01:58.95]你总是温柔的[02:01.07]能把我的心融化掉[02:03.62]我想要当你的小猫猫[02:07.97][02:09.19]合：[02:09.49]我们一起学猫叫[02:11.49]一起喵喵喵喵喵[02:13.55]在你面前撒个娇[02:15.55]哎呦喵喵喵喵喵[02:17.72]我的心脏砰砰跳[02:19.77]迷恋上你的坏笑[02:22.28]你不说爱我我就喵喵喵[02:26.01][02:26.21]我们一起学猫叫[02:28.30]一起喵喵喵喵喵[02:30.30]我要穿你的外套[02:32.38]闻你身上的味道[02:34.58]想要变成你的猫[02:36.56]赖在你怀里睡着[02:39.02]每天都贪恋着你的好[02:42.40][02:42.85]我们一起学猫叫[02:44.84]一起喵喵喵喵喵[02:46.89]在你面前撒个娇[02:49.02]哎呦喵喵喵喵喵[02:51.14]我的心脏砰砰跳[02:53.32]迷恋上你的坏笑[02:55.75]你不说爱我我就喵喵喵[02:59.12][02:59.47]我们一起学猫叫[03:01.59]一起喵喵喵喵喵[03:03.66]我要穿你的外套[03:05.82]闻你身上的味道[03:07.88]想要变成你的猫[03:09.98]赖在你怀里睡着[03:12.37]每天都贪恋着你的好', 'superadmin', '2018-06-29 22:08:54', 'superadmin', '2018-07-17 15:15:15', ''),
	(33, 4, '莎啦啦', '蒋雪璇', 'http://music.163.com/song/media/outer/url?id=537510674.mp3', 'http://p1.music.126.net/t633x_KG8Zcd6SNf7xZdYA==/109951163142569560.jpg?param=300x300', '[00:00.00] 作曲 : 蒋雪璇[00:01.00] 作词 : 蒋雪璇[00:04.43]编曲：伍华/江潮[00:05.34]录音：Ethan/付威[00:06.30]混音：Ethan[00:07.23]和声：常玮[00:08.08]制作人：伍华[00:08.97]监制：潇喆Sean[00:09.89]OP：腾研国际[00:11.30]夕阳西下 蝴蝶回家[00:16.24]落叶惊风 缠绵飘荡[00:21.09]黑幕拉下 光阴睡下[00:26.21]你要去哪 带上我吧吧吧吧吧[00:32.14]你说希望陪我到老[00:34.57]就算撒娇变成唠叨[00:37.09]就算无法轻盈舞蹈[00:39.60]爱的小船也不会抛锚[00:41.89]你说我是你命中的妖[00:44.45]才会让你神魂颠倒[00:46.86]你要和我唱一曲歌谣[00:49.32]忘记糟糕忘掉烦恼[00:54.43]wosha shalala la[00:56.89]wosha shalala[00:59.34]wosha shalala la[01:01.89]wosha shalala[01:04.32]wosha shalala la[01:06.72]wosha shalala[01:09.15]wosha shalala la[01:11.71]wosha shalala la la[01:35.48]咖啡奶茶 多味情话[01:40.42]淡淡眼妆 相思相望[01:45.39]心事绵长 指尖微凉[01:50.39]把我送送送送给你啦[01:56.20]我们一起去无人小岛[01:58.69]像退江湖般的逍遥[02:01.16]养个猫猫 种个花草[02:03.25]有你在就不觉得无聊[02:06.07]一起吃早餐吃到夜宵[02:08.64]你身强体壮我心灵手巧[02:11.18]管那野兽卖弄风骚[02:13.50]不用担心你被她带跑[02:16.02]wosha shalala la[02:18.52]wosha shalala[02:21.03]wosha shalala la[02:23.51]wosha shalala[02:25.92]wosha shalala la[02:28.38]wosha shalala[02:30.94]wosha shalala la[02:33.35]wosha shalala[02:35.77]wosha shalala la[02:38.32]wosha shalala[02:40.80]wosha shalala la[02:43.26]wosha shalala[02:45.69]wosha shalala la[02:48.17]wosha shalala[02:50.61]wosha shalala la[02:53.11]wosha shalala la la[02:57.39]', 'superadmin', '2018-06-29 22:08:54', 'superadmin', '2018-07-17 15:12:03', ''),
	(34, 4, 'That Girl', 'Olly Murs', 'http://music.163.com/song/media/outer/url?id=440208476.mp3', 'http://p1.music.126.net/_dPhSlbDz23MjXUEYeBGRw==/18820340533734696.jpg?param=300x300', '[by:刺客辣条之法与鲨][00:00.00]There\'s a girl but I let her get away[00:05.40]It\'s all my fault cause pride got in the way[00:11.40]And I\'d be lying if I said I was ok[00:16.00]About that girl the one I let get away[00:21.00]I keep saying no[00:23.00]This can\'t be the way we\'re supposed to be[00:26.00]I keep saying no[00:29.00]There\'s gotta be a way to get you close to me[00:31.00]Now I know you gotta[00:33.490]Speak up if you want somebody[00:36.490]Can\'t let him get away, oh no[00:38.490]You don\'t wanna end up sorry[00:41.490]The way that I\'m feeling everyday[00:43.490](Don\'t you know)[00:44.00]No no no no[00:46.490]There\'s no home for the broken heart[00:50.490](Don\'t you know)[00:50.00]No no no no[00:52.490]There\'s no home for the broken[00:53.490]There\'s a girl but I let her get away[00:59.490]It\'s my fault cause I said I needed space[01:04.490]I\'ve been torturing myself night and day[01:10.490]About that girl, the one I let get away[01:15.490]I keep saying no[01:17.490]This can\'t be the way it was supposed to be[01:20.490]I keep saying no[01:23.490]There\'s gotta be a way to get you[01:24.490]There\'s gotta be a way to get you[01:25.490]Close to me[00:26.490]You gotta[01:27.490]Speak up if you want somebody[01:30.490]Can\'t let him get away, oh no[01:32.490]You don\'t wanna end up sorry[01:35.490]The way that I\'m feeling everyday[01:37.490](Don\'t you know)[01:38.490]No no no no[01:40.490]There\'s no home for the broken heart[01:42.490](Don\'t you know)[01:43.490]No no no no[01:45.490]There\'s no home for the broken[01:48.490]No home for me[01:51.490]No home cause I\'m broken[01:53.490]No room to breathe[01:55.490]And I got no one to bla-ame[01:59.490]No home for me[02:02.490]No home cause I\'m broken[02:03.490]About that girl[02:05.490]The one I let get away[02:09.490]So you better[02:10.490]Speak up if you want somebody[02:13.490]You can\'t let him get away oh no[02:16.490]You dont wanna end up sorry[02:18.490]The way that I\'m feeling everyday[02:20.490](Don\'t you know)[02:21.490]No no no no[02:23.490]There\'s no home for the broken heart[02:26.00](Don\'t you know)[02:26.490]No no no no[02:29.00]There\'s no home for the broken[02:31.490]Oh[02:32.490]You don\'t wanna lose at love[02:34.490]It\'s only gonna hurt too much[02:37.00]I\'m telling you[02:37.490]You don\'t wanna lose at love[02:40.00]It\'s only gonna hurt too much[02:42.490]I\'m telling you[02:43.490]You don\'t wanna lose at love[02:45.490]Cause There\'s no home for the broken heart[02:47.490]About that girl[02:49.490]The one I let get away', 'superadmin', '2018-06-29 22:08:54', 'superadmin', '2018-07-17 15:14:11', ''),
	(35, 4, '云烟成雨', '房东的猫', 'http://music.163.com/song/media/outer/url?id=513360721.mp3', 'http://p1.music.126.net/DSTg1dR7yKsyGq4IK3NL8A==/109951163046050093.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:08:54', '', '2018-06-29 22:08:54', ''),
	(36, 4, '给陌生的你听 ', 'G.G(张思源)', 'http://music.163.com/song/media/outer/url?id=562594322.mp3', 'http://p1.music.126.net/LMPuItVrjn1Vi5c8vZZ90Q==/109951163309729098.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:08:54', '', '2018-06-29 22:08:54', ''),
	(37, 4, '喜欢', '阿肆', 'http://music.163.com/song/media/outer/url?id=526464145.mp3', 'http://p1.music.126.net/BA0bFrD0cK4YDSYublCThA==/109951163093942268.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:08:54', '', '2018-06-29 22:08:54', ''),
	(38, 4, '爱你', '陈芳语', 'http://music.163.com/song/media/outer/url?id=22852057.mp3', 'http://p1.music.126.net/0Xvz_4oS4YLCvWtQcXU05Q==/17867063951755098.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:08:54', '', '2018-06-29 22:08:54', ''),
	(39, 4, '后来的我们', '五月天', 'http://music.163.com/song/media/outer/url?id=553310243.mp3', 'http://p1.music.126.net/s6bXQX0M-H9EoeqGfr4wrg==/109951163250238942.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:08:54', '', '2018-06-29 22:08:54', ''),
	(40, 4, '后来', '刘若英', 'http://music.163.com/song/media/outer/url?id=254574.mp3', 'http://p1.music.126.net/eBF7bHnJYBUfOFrJ_7SUfw==/109951163351825356.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:08:54', '', '2018-06-29 22:08:54', ''),
	(41, 4, '我们不一样', '大壮', 'http://music.163.com/song/media/outer/url?id=482395261.mp3', 'http://p1.music.126.net/e8rrwkOED4RbeaKuaVOcJA==/18997361904874206.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:08:54', '', '2018-06-29 22:08:54', ''),
	(42, 4, '水手', '郑智化', 'http://music.163.com/song/media/outer/url?id=190381.mp3', 'http://p1.music.126.net/_pXP5r15lQW2iRhucclG9w==/52776558150323.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:08:54', '', '2018-06-29 22:08:54', ''),
	(43, 4, '海阔天空', 'Beyond', 'http://music.163.com/song/media/outer/url?id=400162138.mp3', 'http://p1.music.126.net/a9oLdcFPhqQyuouJzG2mAQ==/3273246124149810.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:08:54', '', '2018-06-29 22:08:54', ''),
	(44, 4, '思君黯然', '电视剧《天龙八部》插曲', 'http://music.163.com/song/media/outer/url?id=27927021.mp3', 'http://p1.music.126.net/eZ5I2GSgKeKQR7jWpFZFiA==/3386495814252023.jpg?param=300x300', NULL, 'superadmin', '2018-06-29 22:20:08', '', '2018-06-29 22:20:08', ''),
	(47, 4, '不仅仅是喜欢', '青柠', 'http://music.163.com/song/media/outer/url?id=563069979.mp3', 'http://p1.music.126.net/f4-ZyLjp50S2R3rG09w0-g==/109951163302845405.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 15:17:35', '', '2018-07-20 15:17:35', ''),
	(48, 4, 'Despacito (Remix)', 'Luis Fonsi / Daddy Yankee / Justin Bieber', 'http://music.163.com/song/media/outer/url?id=472361096.mp3', 'http://p1.music.126.net/vA4UF75gS1Qpyx07B0acrw==/18521273371761277.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 15:29:04', '', '2018-07-20 15:29:04', ''),
	(49, 4, 'Brother Louie', 'Modern Talking', 'http://music.163.com/song/media/outer/url?id=4175444.mp3', 'http://p1.music.126.net/l8KFEReYE5VPF8iohanhcg==/1777910302123477.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 15:30:14', '', '2018-07-20 15:30:14', ''),
	(50, 4, 'Time', 'MKJ', 'http://music.163.com/song/media/outer/url?id=33035611.mp3', 'http://p1.music.126.net/c7vJlx2v-J4gIk67zs2ZDw==/7941772488435204.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 15:32:19', '', '2018-07-20 15:32:19', ''),
	(51, 4, 'いつも何度でも', '宗次郎', 'http://music.163.com/song/media/outer/url?id=480353.mp3', 'http://p1.music.126.net/ygxAeYxxXPONww041tylMw==/5996736418028563.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:26', '', '2018-07-20 16:01:26', ''),
	(52, 4, '故乡的原风景', '宗次郎', 'http://music.163.com/song/media/outer/url?id=393685.mp3', 'http://p1.music.126.net/qHKvdeYzTqIOxcGKnrfaPQ==/72567767449767.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:26', '', '2018-07-20 16:01:26', ''),
	(53, 4, '爱的回归线', '陈韵若 / 陈每文', 'http://music.163.com/song/media/outer/url?id=25639007.mp3', 'http://p1.music.126.net/CrPfLVU881-kSrab_HxuoA==/644313813916636.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:26', '', '2018-07-20 16:01:26', ''),
	(54, 4, 'Cry On My Shoulder', 'Deutschland sucht den Superstar / Various Artists', 'http://music.163.com/song/media/outer/url?id=17194024.mp3', 'http://p1.music.126.net/_1SSamf87l4mo77TZiWCWQ==/576144092962639.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:26', '', '2018-07-20 16:01:26', ''),
	(55, 4, '小幸运', '田馥甄', 'http://music.163.com/song/media/outer/url?id=33206214.mp3', 'http://p1.music.126.net/7Y4fr1KatzK2xELl_wnkHw==/109951163281534779.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:26', '', '2018-07-20 16:01:26', ''),
	(56, 4, '刚好遇见你', '李玉刚', 'http://music.163.com/song/media/outer/url?id=439915614.mp3', 'http://p1.music.126.net/lDyytkTaPYVTb1Vpide6AA==/18591642115187138.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:26', '', '2018-07-20 16:01:26', ''),
	(57, 4, '好春光', '吴彤', 'http://music.163.com/song/media/outer/url?id=27562927.mp3', 'http://p1.music.126.net/f72rHrToCES-nccfJqGtYA==/5737251673804479.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:26', '', '2018-07-20 16:01:26', ''),
	(58, 4, '梦醒时分', '伍佰', 'http://music.163.com/song/media/outer/url?id=156284.mp3', 'http://p1.music.126.net/L570AKxOSH6U4vEIMoHGXQ==/45079976751506.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:26', '', '2018-07-20 16:01:26', ''),
	(59, 4, 'Reality', 'Richard Sanderson', 'http://music.163.com/song/media/outer/url?id=1921734.mp3', 'http://p1.music.126.net/-qwHJ415WkbhIRlqJpwWpQ==/1765815674209004.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:26', '', '2018-07-20 16:01:26', ''),
	(60, 4, '壮志在我胸', '成龙', 'http://music.163.com/song/media/outer/url?id=64392.mp3', 'http://p1.music.126.net/gmjxNbZgGejTwDLSatYD-w==/645413325516792.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:01:27', '', '2018-07-20 16:01:27', ''),
	(61, 4, '向天再借五百年', '韩磊', 'http://music.163.com/song/media/outer/url?id=93666.mp3', 'http://p1.music.126.net/MsjB1mwEjSzidqcesbwz3w==/591537255755598.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(62, 4, '大男人', '腾格尔', 'http://music.163.com/song/media/outer/url?id=28406582.mp3', 'http://p1.music.126.net/Nl0RTYfKGynZsS89SKpjdQ==/3385396303311359.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(63, 4, '我欲成仙', '刘欢', 'http://music.163.com/song/media/outer/url?id=145982.mp3', 'http://p1.music.126.net/TJAyXjjIG--gMPEGOpLn2Q==/129742372078414.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(64, 4, '天地孤影任我行', '陈勋奇', 'http://music.163.com/song/media/outer/url?id=393697.mp3', 'http://p1.music.126.net/qHKvdeYzTqIOxcGKnrfaPQ==/72567767449767.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(65, 4, '永远永远', '李翊君', 'http://music.163.com/song/media/outer/url?id=258134.mp3', 'http://p1.music.126.net/7cXnZIDy5zhgN04oLecBPg==/109951162793114.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(66, 4, '难念的经', '周华健', 'http://music.163.com/song/media/outer/url?id=5271858.mp3', 'http://p1.music.126.net/n_7R-J0uWaBPBkm7aVsA_Q==/122045790701114.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(67, 4, '倩女幽魂', '张国荣', 'http://music.163.com/song/media/outer/url?id=188175.mp3', 'http://p1.music.126.net/cmvsHFnVKXO409hZdrbacA==/102254581395221.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(68, 4, '男儿当自强', '成龙', 'http://music.163.com/song/media/outer/url?id=32688174.mp3', 'http://p1.music.126.net/15IMKrk4XXVhtSavDyTRIg==/7986852464676272.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(69, 4, '我的祖国', '郭兰英', 'http://music.163.com/song/media/outer/url?id=236405.mp3', 'http://p1.music.126.net/LnCU0OQrDUnZ8Qq45BCPWQ==/32985348849298.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(70, 4, '当年情', '张国荣', 'http://music.163.com/song/media/outer/url?id=188451.mp3', 'http://p1.music.126.net/FEgl2i8gDkOdppr5Ko3kEA==/69269232562640.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(71, 4, '只要有你', '那英 / 孙楠', 'http://music.163.com/song/media/outer/url?id=4878242.mp3', 'http://p1.music.126.net/RaLFV45m3BjMdZ0pQIGPLg==/18890709277096465.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(72, 4, '归去来', '希莉娜依 / 胡兵', 'http://music.163.com/song/media/outer/url?id=5276250.mp3', 'http://p1.music.126.net/ytVaPRWaeaLtm88Wg9ysdg==/52776558150319.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:40', '', '2018-07-20 16:49:40', ''),
	(73, 4, '六月的雨', '胡歌', 'http://music.163.com/song/media/outer/url?id=92774.mp3', 'http://p1.music.126.net/95TcQghGMiaAl5363ZTJbA==/109951163200250165.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:41', '', '2018-07-20 16:49:41', ''),
	(74, 4, '女儿情', '李玲玉', 'http://music.163.com/song/media/outer/url?id=29775440.mp3', 'http://p1.music.126.net/kKhH3gKHB4AwVFrcbaU6Yg==/3275445140634067.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:49:41', '', '2018-07-20 16:49:41', ''),
	(75, 4, '好久不见', '李小龙', 'http://music.163.com/song/media/outer/url?id=28678042.mp3', 'http://p1.music.126.net/TUAISNMUjX1Dw9hptF-R2Q==/5852700394902604.jpg?param=300x300', NULL, 'superadmin', '2018-07-20 16:59:31', '', '2018-07-20 16:59:31', ''),
	(76, 4, '我要你', '任素汐', 'http://music.163.com/song/media/outer/url?id=437292675.mp3', 'http://p1.music.126.net/dDV995SIeG5-IN1eYq6FOg==/3300733912593978.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 12:15:37', '', '2018-07-30 12:15:37', ''),
	(77, 4, '英雄的黎明', '横山菁児', 'http://music.163.com/song/media/outer/url?id=393705.mp3', 'http://p1.music.126.net/qHKvdeYzTqIOxcGKnrfaPQ==/72567767449767.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 12:15:37', '', '2018-07-30 12:15:37', ''),
	(78, 4, '人生何处不相逢', '陈慧娴', 'http://music.163.com/song/media/outer/url?id=212253.mp3', 'http://p1.music.126.net/SQvpqlVrUamK46F49dCJ5g==/109951163032107598.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 12:15:37', '', '2018-07-30 12:15:37', ''),
	(79, 4, '心爱', '金学峰', 'http://music.163.com/song/media/outer/url?id=166317.mp3', 'http://p1.music.126.net/EN2oaemrTlTvP-rlo5dP2A==/86861418607028.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 12:15:37', '', '2018-07-30 12:15:37', ''),
	(80, 4, 'Never Say Goodbye', 'Mario / 朴素彬 / 송보람 / 고은주', 'http://music.163.com/song/media/outer/url?id=5412258.mp3', 'http://p1.music.126.net/Qdy9558DfPQY58CU86NCnA==/746568395266031.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 12:15:37', '', '2018-07-30 12:15:37', ''),
	(81, 4, 'The Day You Went Away', 'M2M', 'http://music.163.com/song/media/outer/url?id=3026369.mp3', 'http://p1.music.126.net/pETQnye5ooWtzXSCC0qbeQ==/1744924953286126.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 12:15:37', '', '2018-07-30 12:15:37', ''),
	(82, 4, 'Pretty Boy', 'M2M', 'http://music.163.com/song/media/outer/url?id=5134011.mp3', 'http://p1.music.126.net/Ny5AEURZGTbeJBKNS9TflQ==/1658063534698769.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 12:15:37', '', '2018-07-30 12:15:37', ''),
	(83, 4, 'As Long as You Love Me', 'Backstreet Boys', 'http://music.163.com/song/media/outer/url?id=3950792.mp3', 'http://p1.music.126.net/P-2uAbQrgtIZfYy8HxuY2g==/19069929672343699.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 12:15:37', '', '2018-07-30 12:15:37', ''),
	(84, 4, 'Exodus', 'Maksim Mrvica', 'http://music.163.com/song/media/outer/url?id=1696336.mp3', 'http://p1.music.126.net/eNFhIgV8pF5zp5tRHSyyVg==/705886465073362.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 12:15:37', '', '2018-07-30 12:15:37', ''),
	(85, 4, 'Far Away From Home', 'Groove Coverage', 'http://music.163.com/song/media/outer/url?id=4083399.mp3', 'http://p1.music.126.net/VoSY-_z1arhvzVwyW8gClw==/6641050232567186.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 13:41:56', '', '2018-07-30 13:41:56', ''),
	(86, 4, 'She', 'Groove Coverage', 'http://music.163.com/song/media/outer/url?id=4083642.mp3', 'http://p1.music.126.net/8dnZQOUVyem-hM2SB45SQA==/768558627860128.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 13:41:56', '', '2018-07-30 13:41:56', ''),
	(87, 4, '世界が終るまでは', 'WANDS', 'http://music.163.com/song/media/outer/url?id=26508150.mp3', 'http://p1.music.126.net/yrUkfSTai4X75Teo9pisKg==/2423323627679092.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 13:41:57', '', '2018-07-30 13:41:57', ''),
	(88, 4, 'See You Again', 'Wiz Khalifa / Charlie Puth', 'http://music.163.com/song/media/outer/url?id=30953009.mp3', 'http://p1.music.126.net/JIc9X91OSH-7fUZqVfQXAQ==/7731765766799133.jpg?param=300x300', NULL, 'superadmin', '2018-07-30 13:41:57', '', '2018-07-30 13:41:57', '');
/*!40000 ALTER TABLE `music_musiclist` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_blob_triggers
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_blob_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `blob_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_blob_triggers: ~0 rows (approximately)
/*!40000 ALTER TABLE `qrtz_blob_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_blob_triggers` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_calendars
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE IF NOT EXISTS `qrtz_calendars` (
  `sched_name` varchar(120) NOT NULL,
  `calendar_name` varchar(200) NOT NULL,
  `calendar` blob NOT NULL,
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_calendars: ~0 rows (approximately)
/*!40000 ALTER TABLE `qrtz_calendars` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_calendars` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_cron_triggers
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_cron_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `cron_expression` varchar(200) NOT NULL,
  `time_zone_id` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_cron_triggers: ~2 rows (approximately)
/*!40000 ALTER TABLE `qrtz_cron_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_cron_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `cron_expression`, `time_zone_id`) VALUES
	('RZspiderScheduler', 'TASK_1', 'DEFAULT', '0/10 * * * * ?', 'Asia/Shanghai'),
	('RZspiderScheduler', 'TASK_2', 'DEFAULT', '0/20 * * * * ?', 'Asia/Shanghai');
/*!40000 ALTER TABLE `qrtz_cron_triggers` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_fired_triggers
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_fired_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `entry_id` varchar(95) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `fired_time` bigint(13) NOT NULL,
  `sched_time` bigint(13) NOT NULL,
  `priority` int(11) NOT NULL,
  `state` varchar(16) NOT NULL,
  `job_name` varchar(200) DEFAULT NULL,
  `job_group` varchar(200) DEFAULT NULL,
  `is_nonconcurrent` varchar(1) DEFAULT NULL,
  `requests_recovery` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_fired_triggers: ~0 rows (approximately)
/*!40000 ALTER TABLE `qrtz_fired_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_fired_triggers` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_job_details
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE IF NOT EXISTS `qrtz_job_details` (
  `sched_name` varchar(120) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `job_class_name` varchar(250) NOT NULL,
  `is_durable` varchar(1) NOT NULL,
  `is_nonconcurrent` varchar(1) NOT NULL,
  `is_update_data` varchar(1) NOT NULL,
  `requests_recovery` varchar(1) NOT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_job_details: ~2 rows (approximately)
/*!40000 ALTER TABLE `qrtz_job_details` DISABLE KEYS */;
INSERT INTO `qrtz_job_details` (`sched_name`, `job_name`, `job_group`, `description`, `job_class_name`, `is_durable`, `is_nonconcurrent`, `is_update_data`, `requests_recovery`, `job_data`) VALUES
	('RZspiderScheduler', 'TASK_1', 'DEFAULT', NULL, 'com.rzspider.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', _binary 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61703FE8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D6170133F3F760A3F00025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC13F603F000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A3F4B59741903000078707708000001622C3FE078707070700000000174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC3F3F00014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC3F0B94E03F00007870000000000000000174000672795461736B74000A72794E6F506172616D737400007800),
	('RZspiderScheduler', 'TASK_2', 'DEFAULT', NULL, 'com.rzspider.project.monitor.job.util.ScheduleJob', '0', '0', '0', '0', _binary 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61703FE8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D6170133F3F760A3F00025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC13F603F000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A3F4B59741903000078707708000001622C3FE078707070700000000174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC3F3F00014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC3F0B94E03F00007870000000000000000274000672795461736B7400087279506172616D7374000272797800);
/*!40000 ALTER TABLE `qrtz_job_details` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_locks
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE IF NOT EXISTS `qrtz_locks` (
  `sched_name` varchar(120) NOT NULL,
  `lock_name` varchar(40) NOT NULL,
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_locks: ~3 rows (approximately)
/*!40000 ALTER TABLE `qrtz_locks` DISABLE KEYS */;
INSERT INTO `qrtz_locks` (`sched_name`, `lock_name`) VALUES
	('RZspiderScheduler', 'STATE_ACCESS'),
	('RZspiderScheduler', 'TRIGGER_ACCESS');
/*!40000 ALTER TABLE `qrtz_locks` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_paused_trigger_grps
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE IF NOT EXISTS `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_paused_trigger_grps: ~0 rows (approximately)
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_paused_trigger_grps` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_scheduler_state
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE IF NOT EXISTS `qrtz_scheduler_state` (
  `sched_name` varchar(120) NOT NULL,
  `instance_name` varchar(200) NOT NULL,
  `last_checkin_time` bigint(13) NOT NULL,
  `checkin_interval` bigint(13) NOT NULL,
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_scheduler_state: ~2 rows (approximately)
/*!40000 ALTER TABLE `qrtz_scheduler_state` DISABLE KEYS */;
INSERT INTO `qrtz_scheduler_state` (`sched_name`, `instance_name`, `last_checkin_time`, `checkin_interval`) VALUES
	('RZspiderScheduler', 'APCNSHA7Y6HDN21533785350057', 1533788835256, 15000);
/*!40000 ALTER TABLE `qrtz_scheduler_state` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_simple_triggers
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_simple_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `repeat_count` bigint(7) NOT NULL,
  `repeat_interval` bigint(12) NOT NULL,
  `times_triggered` bigint(10) NOT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_simple_triggers: ~0 rows (approximately)
/*!40000 ALTER TABLE `qrtz_simple_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simple_triggers` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_simprop_triggers
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_simprop_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `str_prop_1` varchar(512) DEFAULT NULL,
  `str_prop_2` varchar(512) DEFAULT NULL,
  `str_prop_3` varchar(512) DEFAULT NULL,
  `int_prop_1` int(11) DEFAULT NULL,
  `int_prop_2` int(11) DEFAULT NULL,
  `long_prop_1` bigint(20) DEFAULT NULL,
  `long_prop_2` bigint(20) DEFAULT NULL,
  `dec_prop_1` decimal(13,4) DEFAULT NULL,
  `dec_prop_2` decimal(13,4) DEFAULT NULL,
  `bool_prop_1` varchar(1) DEFAULT NULL,
  `bool_prop_2` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_simprop_triggers: ~0 rows (approximately)
/*!40000 ALTER TABLE `qrtz_simprop_triggers` DISABLE KEYS */;
/*!40000 ALTER TABLE `qrtz_simprop_triggers` ENABLE KEYS */;

-- Dumping structure for table rzspider.qrtz_triggers
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE IF NOT EXISTS `qrtz_triggers` (
  `sched_name` varchar(120) NOT NULL,
  `trigger_name` varchar(200) NOT NULL,
  `trigger_group` varchar(200) NOT NULL,
  `job_name` varchar(200) NOT NULL,
  `job_group` varchar(200) NOT NULL,
  `description` varchar(250) DEFAULT NULL,
  `next_fire_time` bigint(13) DEFAULT NULL,
  `prev_fire_time` bigint(13) DEFAULT NULL,
  `priority` int(11) DEFAULT NULL,
  `trigger_state` varchar(16) NOT NULL,
  `trigger_type` varchar(8) NOT NULL,
  `start_time` bigint(13) NOT NULL,
  `end_time` bigint(13) DEFAULT NULL,
  `calendar_name` varchar(200) DEFAULT NULL,
  `misfire_instr` smallint(2) DEFAULT NULL,
  `job_data` blob,
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- Dumping data for table rzspider.qrtz_triggers: ~2 rows (approximately)
/*!40000 ALTER TABLE `qrtz_triggers` DISABLE KEYS */;
INSERT INTO `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`, `job_name`, `job_group`, `description`, `next_fire_time`, `prev_fire_time`, `priority`, `trigger_state`, `trigger_type`, `start_time`, `end_time`, `calendar_name`, `misfire_instr`, `job_data`) VALUES
	('RZspiderScheduler', 'TASK_1', 'DEFAULT', 'TASK_1', 'DEFAULT', NULL, 1527143680000, -1, 5, 'PAUSED', 'CRON', 1527143677000, 0, NULL, 0, _binary 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61703FE8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D6170133F3F760A3F00025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC13F603F000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A3F4B59741903000078707708000001622C3FE078707070700000000174000E302F3130202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E697A0E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC3F3F00014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC3F0B94E03F00007870000000000000000174000672795461736B74000A72794E6F506172616D737400007800),
	('RZspiderScheduler', 'TASK_2', 'DEFAULT', 'TASK_2', 'DEFAULT', NULL, 1527143680000, -1, 5, 'PAUSED', 'CRON', 1527143677000, 0, NULL, 0, _binary 0xACED0005737200156F72672E71756172747A2E4A6F62446174614D61709FB083E8BFA9B0CB020000787200266F72672E71756172747A2E7574696C732E537472696E674B65794469727479466C61674D61703FE8C3FBC55D280200015A0013616C6C6F77735472616E7369656E74446174617872001D6F72672E71756172747A2E7574696C732E4469727479466C61674D6170133F3F760A3F00025A000564697274794C00036D617074000F4C6A6176612F7574696C2F4D61703B787001737200116A6176612E7574696C2E486173684D61700507DAC13F603F000246000A6C6F6164466163746F724900097468726573686F6C6478703F4000000000000C7708000000100000000174000D4A4F425F504152414D5F4B455973720028636F6D2E72756F79692E70726F6A6563742E6D6F6E69746F722E6A6F622E646F6D61696E2E4A6F6200000000000000010200074900067374617475734C000E63726F6E45787072657373696F6E7400124C6A6176612F6C616E672F537472696E673B4C00086A6F6247726F757071007E00094C00056A6F6249647400104C6A6176612F6C616E672F4C6F6E673B4C00076A6F624E616D6571007E00094C000A6D6574686F644E616D6571007E00094C0006706172616D7371007E000978720029636F6D2E72756F79692E6672616D65776F726B2E7765622E646F6D61696E2E42617365456E7469747900000000000000010200064C0008637265617465427971007E00094C000A63726561746554696D657400104C6A6176612F7574696C2F446174653B4C000672656D61726B71007E00094C000B73656172636856616C756571007E00094C0008757064617465427971007E00094C000A75706461746554696D6571007E000C787074000561646D696E7372000E6A6176612E7574696C2E44617465686A3F4B59741903000078707708000001622C3FE078707070700000000174000E302F3230202A202A202A202A203F740018E7B3BBE7BB9FE9BB98E8AEA4EFBC88E69C89E58F82EFBC897372000E6A6176612E6C616E672E4C6F6E673B8BE490CC3F3F00014A000576616C7565787200106A6176612E6C616E672E4E756D62657286AC3F0B94E03F00007870000000000000000274000672795461736B7400087279506172616D7374000272797800);
/*!40000 ALTER TABLE `qrtz_triggers` ENABLE KEYS */;

-- Dumping structure for table rzspider.spider_code_type
DROP TABLE IF EXISTS `spider_code_type`;
CREATE TABLE IF NOT EXISTS `spider_code_type` (
  `spider_code_type_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '爬虫代码类型ID',
  `custom_spider_type` int(11) DEFAULT NULL COMMENT '爬虫代码类型标志ＩＤ',
  `spider_code_type_name` varchar(50) NOT NULL COMMENT '爬虫代码类型名称',
  `spider_code_type_folder` varchar(50) NOT NULL COMMENT '爬虫代码类型对应目录',
  `status` int(1) DEFAULT '1' COMMENT '爬虫代码类型状态',
  PRIMARY KEY (`spider_code_type_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='爬虫代码类型详情表';

-- Dumping data for table rzspider.spider_code_type: ~4 rows (approximately)
/*!40000 ALTER TABLE `spider_code_type` DISABLE KEYS */;
INSERT INTO `spider_code_type` (`spider_code_type_id`, `custom_spider_type`, `spider_code_type_name`, `spider_code_type_folder`, `status`) VALUES
	(1, 0, 'JAVA代码', 'javacode', 0),
	(2, 1, 'PYTHON代码', 'pythoncode', 0),
	(3, 2, 'JAVASCRIPT代码', 'jscode', 0),
	(6, 3, 'JAR包', 'jarfile', 0);
/*!40000 ALTER TABLE `spider_code_type` ENABLE KEYS */;

-- Dumping structure for table rzspider.spider_customspider
DROP TABLE IF EXISTS `spider_customspider`;
CREATE TABLE IF NOT EXISTS `spider_customspider` (
  `custom_spider_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自定义爬虫ID',
  `custom_spider_back_id` int(11) NOT NULL COMMENT '自定义爬虫后台编号ID',
  `spider_java_package_prefix` varchar(50) DEFAULT NULL COMMENT 'JAVA爬虫包名前缀',
  `custom_spider_Type` int(1) NOT NULL DEFAULT '0' COMMENT '自定义爬虫类型',
  `spider_default_params` varchar(1000) DEFAULT NULL COMMENT '爬虫默认参数',
  `custom_status` int(1) DEFAULT '0' COMMENT '自定义爬虫状态',
  `run_status` int(1) DEFAULT '1' COMMENT '运行状态',
  `entry_file_name` varchar(100) DEFAULT NULL COMMENT '程序入口文件名',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`custom_spider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='自定义爬虫详情表';

-- Dumping data for table rzspider.spider_customspider: ~0 rows (approximately)
/*!40000 ALTER TABLE `spider_customspider` DISABLE KEYS */;
/*!40000 ALTER TABLE `spider_customspider` ENABLE KEYS */;

-- Dumping structure for table rzspider.spider_data
DROP TABLE IF EXISTS `spider_data`;
CREATE TABLE IF NOT EXISTS `spider_data` (
  `spider_data_id` int(11) NOT NULL AUTO_INCREMENT,
  `task_info_id` int(11) DEFAULT NULL,
  `json_data` text,
  `task_flag` int(11) DEFAULT NULL,
  PRIMARY KEY (`spider_data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='爬虫数据详情表';

-- Dumping data for table rzspider.spider_data: ~0 rows (approximately)
/*!40000 ALTER TABLE `spider_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `spider_data` ENABLE KEYS */;

-- Dumping structure for table rzspider.spider_spiderfiletree
DROP TABLE IF EXISTS `spider_spiderfiletree`;
CREATE TABLE IF NOT EXISTS `spider_spiderfiletree` (
  `filetree_id` int(20) NOT NULL AUTO_INCREMENT COMMENT '文件树id',
  `child_id` int(11) NOT NULL COMMENT '文件树子ID',
  `parent_id` int(11) NOT NULL COMMENT '文件树父ID',
  `custom_spider_id` int(11) NOT NULL COMMENT '自定义爬虫ID',
  `custom_spider_back_id` int(11) NOT NULL COMMENT '自定义爬虫后台编号ID',
  `file_name` varchar(255) DEFAULT NULL COMMENT '文件名',
  `file_path` varchar(255) DEFAULT NULL COMMENT '文件绝对路径',
  `file_content` text COMMENT '文件内容',
  PRIMARY KEY (`filetree_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='文件树信息';

-- Dumping data for table rzspider.spider_spiderfiletree: ~0 rows (approximately)
/*!40000 ALTER TABLE `spider_spiderfiletree` DISABLE KEYS */;
/*!40000 ALTER TABLE `spider_spiderfiletree` ENABLE KEYS */;

-- Dumping structure for table rzspider.spider_spidermanage
DROP TABLE IF EXISTS `spider_spidermanage`;
CREATE TABLE IF NOT EXISTS `spider_spidermanage` (
  `spider_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '爬虫ID',
  `spider_back_id` int(11) NOT NULL COMMENT '爬虫后台编号ID',
  `spider_name` varchar(50) NOT NULL COMMENT '爬虫名称',
  `spider_Type` varchar(50) NOT NULL COMMENT '爬虫类型',
  `create_Type` int(1) DEFAULT '1' COMMENT '爬虫创建类型',
  `spider_Des` varchar(100) DEFAULT '' COMMENT '爬虫描述',
  `spider_Link` varchar(100) DEFAULT '' COMMENT '爬虫网址',
  `spider_default_params` varchar(1000) DEFAULT '' COMMENT '爬虫默认参数',
  `status` int(1) DEFAULT '0' COMMENT '爬虫状态',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`spider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='爬虫详情表';

-- Dumping data for table rzspider.spider_spidermanage: ~0 rows (approximately)
/*!40000 ALTER TABLE `spider_spidermanage` DISABLE KEYS */;
/*!40000 ALTER TABLE `spider_spidermanage` ENABLE KEYS */;

-- Dumping structure for table rzspider.spider_spidertask
DROP TABLE IF EXISTS `spider_spidertask`;
CREATE TABLE IF NOT EXISTS `spider_spidertask` (
  `task_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `task_name` varchar(50) NOT NULL COMMENT '任务名称',
  `spider_id` int(11) NOT NULL COMMENT '爬虫ID',
  `spider_back_id` int(11) NOT NULL COMMENT '爬虫任务后台编号ID',
  `spider_name` varchar(50) NOT NULL COMMENT '爬虫名称',
  `spider_type` varchar(50) NOT NULL COMMENT '爬虫类型',
  `create_Type` int(1) NOT NULL COMMENT '爬虫创建类型',
  `status` int(1) NOT NULL COMMENT '爬虫状态',
  `task_status` int(1) DEFAULT '0' COMMENT '可用状态',
  `job_status` int(1) NOT NULL DEFAULT '1' COMMENT '任务状态',
  `task_execfrequency` int(2) DEFAULT '0' COMMENT '任务执行频次',
  `task_params` varchar(500) DEFAULT NULL COMMENT '任务参数',
  `cron_expression` varchar(500) DEFAULT NULL COMMENT 'cron执行表达式',
  `times` int(11) DEFAULT '1' COMMENT '具体任务频次',
  `task_execfrequency2` int(11) DEFAULT '0' COMMENT '任务频次后缀',
  `first_start_time` varchar(50) DEFAULT NULL COMMENT '首次启动时间',
  `user_id` int(11) DEFAULT '1' COMMENT '用户ID',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`task_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='爬虫任务详情表';

-- Dumping data for table rzspider.spider_spidertask: ~0 rows (approximately)
/*!40000 ALTER TABLE `spider_spidertask` DISABLE KEYS */;
/*!40000 ALTER TABLE `spider_spidertask` ENABLE KEYS */;

-- Dumping structure for table rzspider.spider_spidertaskinfo
DROP TABLE IF EXISTS `spider_spidertaskinfo`;
CREATE TABLE IF NOT EXISTS `spider_spidertaskinfo` (
  `task_info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务详情ID',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `task_name` varchar(50) NOT NULL COMMENT '任务名称',
  `spider_name` varchar(50) NOT NULL COMMENT '爬虫名称',
  `task_status` int(1) DEFAULT '0' COMMENT '任务状态',
  `finish_status` int(1) DEFAULT '0' COMMENT '完成状态',
  `task_params` varchar(500) DEFAULT '' COMMENT '任务参数',
  `start_time` datetime DEFAULT NULL COMMENT '启动时间',
  `end_time` datetime DEFAULT NULL COMMENT '结束时间',
  `consume_time` varchar(50) DEFAULT NULL COMMENT '耗时时间',
  `spider_result` mediumtext COMMENT '爬取结果',
  PRIMARY KEY (`task_info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8 COMMENT='爬虫任务运行记录详情表';

-- Dumping data for table rzspider.spider_spidertaskinfo: ~0 rows (approximately)
/*!40000 ALTER TABLE `spider_spidertaskinfo` DISABLE KEYS */;
/*!40000 ALTER TABLE `spider_spidertaskinfo` ENABLE KEYS */;

-- Dumping structure for table rzspider.spider_spider_list
DROP TABLE IF EXISTS `spider_spider_list`;
CREATE TABLE IF NOT EXISTS `spider_spider_list` (
  `spider_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '爬虫ID',
  `custom_spider_id` int(11) DEFAULT NULL COMMENT '自定义爬虫ID',
  `spider_back_id` int(11) NOT NULL COMMENT '爬虫后台编号ID',
  `status` int(1) DEFAULT '0' COMMENT '爬虫状态',
  `create_type` int(1) DEFAULT '1' COMMENT '爬虫创建类型',
  `custom_spider_type` int(1) DEFAULT NULL COMMENT '自定义爬虫类型',
  `spider_default_params` varchar(1000) DEFAULT NULL COMMENT '爬虫默认参数',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`spider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='总爬虫详情表';

-- Dumping data for table rzspider.spider_spider_list: ~1 rows (approximately)
/*!40000 ALTER TABLE `spider_spider_list` DISABLE KEYS */;
INSERT INTO `spider_spider_list` (`spider_id`, `custom_spider_id`, `spider_back_id`, `status`, `create_type`, `custom_spider_type`, `spider_default_params`, `update_by`, `update_time`) VALUES
	(1, NULL, 10002, 0, 0, 0, '{"websiteId":0,"startPage":1,"endPage":2,"startDateTime":"1992-09-09","endDateTime":"9999-09-09","startPrice":0,"endPrice":99999999,"startArea":0,"endArea":99999999,"landUse":"不限","getDetails":false}', 'admin', '2018-05-31 13:39:12');
/*!40000 ALTER TABLE `spider_spider_list` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_config
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE IF NOT EXISTS `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- Dumping data for table rzspider.sys_config: ~2 rows (approximately)
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', '', '2018-03-16 11:33:00', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow'),
	(2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2018-03-16 11:33:00', '', '2018-03-16 11:33:00', '初始化密码 123456');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_dept
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(20) DEFAULT '' COMMENT '联系电话',
  `email` varchar(20) DEFAULT '' COMMENT '邮箱',
  `status` int(1) DEFAULT '0' COMMENT '部门状态:0正常,1停用',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- Dumping data for table rzspider.sys_dept: ~10 rows (approximately)
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(100, 0, '瑞集团', 0, '瑞', '15888888888', 'rz@qq.com', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00'),
	(101, 100, '研发部门', 1, '瑞', '15888888888', 'rz@qq.com', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00'),
	(102, 100, '市场部门', 2, '瑞', '15888888888', 'rz@qq.com', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00'),
	(103, 100, '测试部门', 3, '瑞', '15888888888', 'rz@qq.com', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00'),
	(104, 100, '财务部门', 4, '瑞', '15888888888', 'rz@qq.com', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00'),
	(105, 100, '运维部门', 5, '瑞', '15888888888', 'rz@qq.com', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00'),
	(106, 101, '研发一部', 1, '瑞', '15888888888', 'rz@qq.com', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00'),
	(107, 101, '研发二部', 2, '瑞', '15888888888', 'rz@qq.com', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00'),
	(108, 102, '市场一部', 1, '瑞', '15888888888', 'rz@qq.com', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00'),
	(109, 102, '市场二部', 2, '瑞', '15888888888', 'rz@qq.com', 1, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_dict_data
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE IF NOT EXISTS `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(500) DEFAULT '' COMMENT '样式属性',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- Dumping data for table rzspider.sys_dict_data: ~38 rows (approximately)
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 1, '男', '0', 'sys_user_sex', 'radio radio-info radio-inline', 'Y', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(2, 2, '女', '1', 'sys_user_sex', 'radio radio-danger radio-inline', 'N', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(3, 1, '显示', '0', 'sys_menu_visible', 'radio radio-info radio-inline', 'Y', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(4, 2, '隐藏', '1', 'sys_menu_visible', 'radio radio-danger radio-inline', 'N', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(5, 1, '正常', '0', 'sys_dept_status', 'radio radio-info radio-inline', 'Y', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(6, 2, '停用', '1', 'sys_dept_status', 'radio radio-danger radio-inline', 'N', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(7, 1, '正常', '0', 'sys_dict_status', 'radio radio-info radio-inline', 'Y', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(8, 2, '停用', '1', 'sys_dict_status', 'radio radio-danger radio-inline', 'N', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(9, 1, '正常', '0', 'sys_post_status', 'radio radio-info radio-inline', 'Y', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(10, 2, '停用', '1', 'sys_post_status', 'radio radio-danger radio-inline', 'N', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(11, 1, '正常', '0', 'sys_job_status', 'radio radio-info radio-inline', 'Y', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(12, 2, '暂停', '1', 'sys_job_status', 'radio radio-danger radio-inline', 'N', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(13, 1, '是', 'Y', 'sys_yes_no', 'radio radio-info radio-inline', 'Y', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(14, 2, '否', 'N', 'sys_yes_no', 'radio radio-danger radio-inline', 'N', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(15, 1, '是', 'Y', 'blog_blogcontent_allow_comment', 'radio radio-info radio-inline', 'Y', 0, 'admin', NULL, 'rz', NULL, ''),
	(16, 2, '否', 'N', 'blog_blogcontent_allow_comment', 'radio radio-danger radio-inline', 'N', 0, 'admin', NULL, 'rz', NULL, ''),
	(17, 1, '是', 'Y', 'blog_blogcontent_ping', 'radio radio-info radio-inline', 'Y', 0, 'admin', NULL, 'rz', NULL, ''),
	(18, 2, '否', 'N', 'blog_blogcontent_ping', 'radio radio-danger radio-inline', 'N', 0, 'admin', NULL, 'rz', NULL, ''),
	(19, 1, '网页版', '0', 'commontool_toolmanage_toolType', 'radio radio-info radio-inline', 'Y', 0, 'admin', NULL, '', NULL, ''),
	(20, 2, '客户端版', '1', 'commontool_toolmanage_toolType', 'radio radio-danger radio-inline', 'N', 0, 'admin', NULL, '', NULL, ''),
	(21, 1, '是', '0', 'commontool_toolmanage_srcDownloadStatus', 'radio radio-info radio-inline', 'Y', 0, 'admin', NULL, '', NULL, ''),
	(22, 2, '否', '1', 'commontool_toolmanage_srcDownloadStatus', 'radio radio-danger radio-inline', 'N', 0, 'admin', NULL, '', NULL, ''),
	(23, 1, '是', '0', 'commontool_toolmanage_execexeDownloadStatus', 'radio radio-info radio-inline', 'Y', 0, 'admin', NULL, '', NULL, ''),
	(24, 2, '否', '1', 'commontool_toolmanage_execexeDownloadStatus', 'radio radio-danger radio-inline', 'N', 0, 'admin', NULL, '', NULL, ''),
	(25, 1, '是', '0', 'commontool_toolmanage_setupexeDownloadStatus', 'radio radio-info radio-inline', 'Y', 0, 'admin', NULL, '', NULL, ''),
	(26, 2, '否', '1', 'commontool_toolmanage_setupexeDownloadStatus', 'radio radio-danger radio-inline', 'N', 0, 'admin', NULL, '', NULL, ''),
	(27, 1, '在线编辑', '0', 'tool_baseset_editType', 'radio radio-info radio-inline', 'Y', 0, '', NULL, '', NULL, ''),
	(28, 2, '文件上传', '1', 'tool_baseset_editType', 'radio radio-danger radio-inline', 'N', 0, '', NULL, '', NULL, ''),
	(29, 1, '是', '0', 'tool_baseset_musicAutoPlay', 'radio radio-info radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:05:42', 'superadmin', '2018-07-17 13:06:09', ''),
	(30, 2, '否', '1', 'tool_baseset_musicAutoPlay', 'radio radio-danger radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:06:30', '', NULL, ''),
	(31, 1, '是', '0', 'tool_baseset_musicLrcStart', 'radio radio-info radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:07:06', '', NULL, ''),
	(32, 2, '否', '1', 'tool_baseset_musicLrcStart', 'radio radio-danger radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:07:24', '', NULL, ''),
	(33, 1, '是', '0', 'tool_baseset_musicShowLrc', 'radio radio-info radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:07:43', '', NULL, ''),
	(34, 2, '否', '1', 'tool_baseset_musicShowLrc', 'radio radio-danger radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:08:00', '', NULL, ''),
	(35, 1, '是', '0', 'tool_baseset_musicFixed', 'radio radio-info radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:08:28', '', NULL, ''),
	(36, 2, '否', '1', 'tool_baseset_musicFixed', 'radio radio-danger radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:08:46', '', NULL, ''),
	(37, 1, '是', '0', 'tool_baseset_musicListFolded', 'radio radio-info radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:09:00', '', NULL, ''),
	(38, 2, '否', '1', 'tool_baseset_musicListFolded', 'radio radio-danger radio-inline', 'Y', 0, 'superadmin', '2018-07-17 13:09:17', '', NULL, '');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_dict_type
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE IF NOT EXISTS `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- Dumping data for table rzspider.sys_dict_type: ~19 rows (approximately)
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '用户性别', 'sys_user_sex', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', '用户性别列表'),
	(2, '菜单状态', 'sys_menu_visible', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', '菜单状态列表'),
	(3, '部门状态', 'sys_dept_status', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', '部门状态列表'),
	(4, '岗位状态', 'sys_post_status', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', '岗位状态列表'),
	(5, '字典状态', 'sys_dict_status', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', '字典状态列表'),
	(6, '任务状态', 'sys_job_status', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', '任务状态列表'),
	(7, '系统是否', 'sys_yes_no', 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', '系统是否列表'),
	(8, '评论状态', 'blog_blogcontent_allow_comment', 0, 'admin', NULL, 'rz', NULL, '评论状态列表'),
	(9, '引用状态', 'blog_blogcontent_ping', 0, 'admin', NULL, 'rz', NULL, ''),
	(10, '工具类型', 'commontool_toolmanage_toolType', 0, 'admin', NULL, '', NULL, '通用工具类型'),
	(11, '源码下载状态', 'commontool_toolmanage_srcDownloadStatus', 0, 'admin', NULL, '', NULL, '工具源码下载状态'),
	(12, '可执行exe下载状态', 'commontool_toolmanage_execexeDownloadStatus', 0, 'admin', NULL, '', NULL, '可执行exe下载状态'),
	(13, '安装版exe下载状态', 'commontool_toolmanage_setupexeDownloadStatus', 0, 'admin', NULL, '', NULL, '安装版exe下载状态'),
	(14, '编辑类型', 'tool_baseset_editType', 0, 'admin', NULL, '', NULL, '编辑类型'),
	(15, '音乐自动播放', 'tool_baseset_musicAutoPlay', 0, 'admin', NULL, '', NULL, ''),
	(16, '是否开启歌词', 'tool_baseset_musicLrcStart', 0, '', NULL, '', NULL, ''),
	(17, '是否显示歌词', 'tool_baseset_musicShowLrc', 0, '', NULL, '', NULL, ''),
	(18, '列表固定底部', 'tool_baseset_musicFixed', 0, '', NULL, '', NULL, ''),
	(19, '列表是否折叠', 'tool_baseset_musicListFolded', 0, '', NULL, '', NULL, '');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_file
DROP TABLE IF EXISTS `sys_file`;
CREATE TABLE IF NOT EXISTS `sys_file` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `type` int(11) DEFAULT NULL COMMENT '文件类型',
  `url` varchar(200) DEFAULT NULL COMMENT 'URL地址',
  `create_date` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='文件上传';

-- Dumping data for table rzspider.sys_file: ~18 rows (approximately)
/*!40000 ALTER TABLE `sys_file` DISABLE KEYS */;
INSERT INTO `sys_file` (`id`, `type`, `url`, `create_date`) VALUES
	(1, 0, '/files/e0222993-3fac-4bcc-a9e5-fdccc454c009.jpg', '2018-06-13 10:35:51'),
	(2, 0, '/files/8109dae6-5a67-453a-94e5-4ff07db27580.jpg', '2018-06-13 10:39:09'),
	(3, 0, '/files/e0edc9a9-7963-40e7-bf72-e666ce3ca224.jpg', '2018-06-13 10:52:22'),
	(4, 0, '/files/580fee3a-68a6-4732-9256-5f3214398c29.jpg', '2018-06-13 10:53:59'),
	(5, 0, '/files/af8c4afe-d524-4d95-8e32-11c947336f2e.jpg', '2018-06-13 10:56:43'),
	(6, 0, '/files/42be6589-df02-4ddd-8db4-b9387b8d9ccd.jpg', '2018-06-26 13:04:51'),
	(7, 0, '/files/2455d475-17b0-4b77-a890-da89d672c37b.jpg', '2018-06-26 13:05:32'),
	(8, 0, '/files/fa894d02-1885-4e82-8516-1fbf73ae7ebe.jpg', '2018-06-27 16:07:02'),
	(9, 0, '/files/30c930f6-51cf-472b-bc85-50571ff66613.jpg', '2018-06-27 17:17:43'),
	(10, 0, '/files/4797519a-5fbc-479f-8ce4-df7e24d9f0d3.jpg', '2018-06-27 17:19:34'),
	(11, 0, '/files/9358b2e3-0b79-4817-b07b-b875e91cb4a7.png', '2018-06-27 17:23:48'),
	(12, 0, '/files/7e667704-f43f-4ce0-a0ca-5385c9119dc8.jpg', '2018-06-27 17:28:42'),
	(13, 0, '/files/8d309650-25ef-48ef-b3bf-333544228bed.png', '2018-06-27 18:44:56'),
	(14, 0, '/files/ba0d933d-309c-4083-9bc7-7f9fc241f522.jpg', '2018-06-27 18:50:06'),
	(15, 0, '/files/69900943-2eec-4f08-86d8-25ea5f66edb9.jpg', '2018-06-28 10:44:08'),
	(16, 0, '/files/d59e7e50-87e6-4d8d-9729-8660720edba7.jpg', '2018-06-29 16:28:52'),
	(17, 0, '/files/fceb0ecb-adf8-47d7-a1f7-c79e8cbd7931.jpg', '2018-06-29 16:39:35'),
	(18, 0, '/files/cd12cbf2-6e2a-49f0-aba5-7f9ac002bfac.jpg', '2018-07-24 17:21:43');
/*!40000 ALTER TABLE `sys_file` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_job
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE IF NOT EXISTS `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `status` int(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- Dumping data for table rzspider.sys_job: ~0 rows (approximately)
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_job_log
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE IF NOT EXISTS `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `is_exception` int(1) DEFAULT '0' COMMENT '是否异常',
  `exception_info` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- Dumping data for table rzspider.sys_job_log: ~0 rows (approximately)
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_logininfor
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE IF NOT EXISTS `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` int(1) DEFAULT '0' COMMENT '登录状态 0成功 1失败',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2043 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- Dumping data for table rzspider.sys_logininfor: ~0 rows (approximately)
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_menu
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT NULL COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '类型:M目录,C菜单,F按钮',
  `visible` int(1) DEFAULT '0' COMMENT '菜单状态:0显示,1隐藏',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1136 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- Dumping data for table rzspider.sys_menu: ~211 rows (approximately)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `menu_type`, `visible`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '系统管理', 0, 1, '#', 'M', 0, '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统管理目录'),
	(2, '系统监控', 0, 2, '#', 'M', 0, '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统监控目录'),
	(3, '系统工具', 0, 3, '#', 'M', 0, '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '系统工具目录'),
	(4, '用户管理', 1, 1, '/system/user', 'C', 0, 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '用户管理菜单'),
	(5, '角色管理', 1, 2, '/system/role', 'C', 0, 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '角色管理菜单'),
	(6, '菜单管理', 1, 3, '/system/menu', 'C', 0, 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '菜单管理菜单'),
	(7, '部门管理', 1, 4, '/system/dept', 'C', 0, 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '部门管理菜单'),
	(8, '岗位管理', 1, 5, '/system/post', 'C', 0, 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '岗位管理菜单'),
	(9, '字典管理', 1, 6, '/system/dict', 'C', 0, 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '字典管理菜单'),
	(10, '参数设置', 1, 7, '/system/config', 'C', 0, 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '参数设置菜单'),
	(11, '操作日志', 2, 1, '/monitor/operlog', 'C', 0, 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '操作日志菜单'),
	(12, '登录日志', 2, 2, '/monitor/logininfor', 'C', 0, 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '登录日志菜单'),
	(13, '在线用户', 2, 3, '/monitor/online', 'C', 0, 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '在线用户菜单'),
	(14, '定时任务', 2, 4, '/monitor/job', 'C', 0, 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '定时任务菜单'),
	(15, '数据监控', 2, 5, '/monitor/data', 'C', 0, 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '数据监控菜单'),
	(16, '表单构建', 3, 1, '/tool/build', 'C', 0, 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '表单构建菜单'),
	(17, '代码生成', 3, 2, '/tool/gen', 'C', 0, 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', '代码生成菜单'),
	(18, '用户查询', 4, 1, '#', 'F', 0, 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(19, '用户新增', 4, 2, '#', 'F', 0, 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(20, '用户修改', 4, 3, '#', 'F', 0, 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(21, '用户删除', 4, 4, '#', 'F', 0, 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(22, '用户保存', 4, 5, '#', 'F', 0, 'system:user:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(23, '批量删除', 4, 6, '#', 'F', 0, 'system:user:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(24, '重置密码', 4, 7, '#', 'F', 0, 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(25, '角色查询', 5, 1, '#', 'F', 0, 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(26, '角色新增', 5, 2, '#', 'F', 0, 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(27, '角色修改', 5, 3, '#', 'F', 0, 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(28, '角色删除', 5, 4, '#', 'F', 0, 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(29, '角色保存', 5, 5, '#', 'F', 0, 'system:role:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(30, '批量删除', 5, 6, '#', 'F', 0, 'system:role:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(31, '菜单查询', 6, 1, '#', 'F', 0, 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(32, '菜单新增', 6, 2, '#', 'F', 0, 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(33, '菜单修改', 6, 3, '#', 'F', 0, 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(34, '菜单删除', 6, 4, '#', 'F', 0, 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(35, '菜单保存', 6, 5, '#', 'F', 0, 'system:menu:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(36, '部门查询', 7, 1, '#', 'F', 0, 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(37, '部门新增', 7, 2, '#', 'F', 0, 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(38, '部门修改', 7, 3, '#', 'F', 0, 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(39, '部门删除', 7, 4, '#', 'F', 0, 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(40, '部门保存', 7, 5, '#', 'F', 0, 'system:dept:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(41, '岗位查询', 8, 1, '#', 'F', 0, 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(42, '岗位新增', 8, 2, '#', 'F', 0, 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(43, '岗位修改', 8, 3, '#', 'F', 0, 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(44, '岗位删除', 8, 4, '#', 'F', 0, 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(45, '岗位保存', 8, 5, '#', 'F', 0, 'system:post:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(46, '批量删除', 8, 6, '#', 'F', 0, 'system:post:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(47, '字典查询', 9, 1, '#', 'F', 0, 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(48, '字典新增', 9, 2, '#', 'F', 0, 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(49, '字典修改', 9, 3, '#', 'F', 0, 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(50, '字典删除', 9, 4, '#', 'F', 0, 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(51, '字典保存', 9, 5, '#', 'F', 0, 'system:dict:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(52, '批量删除', 9, 6, '#', 'F', 0, 'system:dict:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(53, '参数查询', 10, 1, '#', 'F', 0, 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(54, '参数新增', 10, 2, '#', 'F', 0, 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(55, '参数修改', 10, 3, '#', 'F', 0, 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(56, '参数删除', 10, 4, '#', 'F', 0, 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(57, '参数保存', 10, 5, '#', 'F', 0, 'system:config:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(58, '批量删除', 10, 6, '#', 'F', 0, 'system:config:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(59, '操作查询', 11, 1, '#', 'F', 0, 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(60, '批量删除', 11, 2, '#', 'F', 0, 'monitor:operlog:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(61, '详细信息', 11, 3, '#', 'F', 0, 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(62, '登录查询', 12, 1, '#', 'F', 0, 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(63, '批量删除', 12, 2, '#', 'F', 0, 'monitor:logininfor:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(64, '在线查询', 13, 1, '#', 'F', 0, 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(65, '批量强退', 13, 2, '#', 'F', 0, 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(66, '单条强退', 13, 3, '#', 'F', 0, 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(67, '任务查询', 14, 1, '#', 'F', 0, 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(68, '任务新增', 14, 2, '#', 'F', 0, 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(69, '任务修改', 14, 3, '#', 'F', 0, 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(70, '任务删除', 14, 4, '#', 'F', 0, 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(71, '任务保存', 14, 5, '#', 'F', 0, 'monitor:job:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(72, '状态修改', 14, 6, '#', 'F', 0, 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(73, '批量删除', 14, 7, '#', 'F', 0, 'monitor:job:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(74, '生成查询', 16, 1, '#', 'F', 0, 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(75, '生成代码', 16, 2, '#', 'F', 0, 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(76, '网页爬虫', 0, 5, '#', 'M', 0, '', 'fa fa-line-chart', 'admin', '2018-03-16 11:33:00', 'superadmin', '2018-06-12 10:55:43', '系统工具目录'),
	(77, '爬虫管理', 76, 3, '/spider/spidermanage', 'C', 0, 'spider:spidermanage:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-06-08 12:04:12', '用户管理菜单'),
	(78, '爬虫任务', 76, 4, '/spider/spidertask', 'C', 0, 'spider:spidertask:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2018-06-08 12:04:00', '角色管理菜单'),
	(79, '爬虫查询', 77, 1, '#', 'F', 0, 'spider:spidermanage:list', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(80, '爬虫新增', 77, 2, '#', 'F', 0, 'spider:spidermanage:add', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(81, '爬虫修改', 77, 3, '#', 'F', 0, 'spider:spidermanage:edit', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(82, '爬虫删除', 77, 4, '#', 'F', 0, 'spider:spidermanage:remove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(83, '爬虫保存', 77, 5, '#', 'F', 0, 'spider:spidermanage:save', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(84, '批量删除', 77, 6, '#', 'F', 0, 'spider:spidermanage:batchRemove', '#', 'admin', '2018-03-16 11:33:00', 'ry', '2018-03-16 11:33:00', ''),
	(85, '图书管理', 0, 6, '#', 'M', 0, '', 'fa fa-graduation-cap', 'admin', '2018-05-28 09:52:21', 'superadmin', '2018-06-12 10:55:51', '图书管理系统'),
	(1001, '个人图书管理', 85, 1, '/book/bookmanage', 'C', 0, 'book:bookmanage:view', '', 'admin', '2018-05-28 09:55:54', 'admin', '2018-05-28 10:00:53', ''),
	(1002, '图书查询', 1001, 1, '#', 'F', 0, 'book:bookmanage:list', '', 'admin', '2018-05-28 10:00:27', '', NULL, ''),
	(1003, '图书新增', 1001, 2, '#', 'F', 0, 'book:bookmanage:add', '', 'admin', '2018-05-28 10:01:35', 'admin', '2018-05-28 10:04:32', ''),
	(1004, '图书修改', 1001, 3, '#', 'F', 0, 'book:bookmanage:edit', '', 'admin', '2018-05-28 10:01:59', 'admin', '2018-05-28 10:04:42', ''),
	(1005, '图书删除', 1001, 4, '#', 'F', 0, 'book:bookmanage:remove', '', 'admin', '2018-05-28 10:02:22', 'admin', '2018-05-28 10:04:53', ''),
	(1006, '图书保存', 1001, 5, '#', 'F', 0, 'book:bookmanage:save', '', 'admin', '2018-05-28 10:02:44', 'admin', '2018-05-28 10:05:04', ''),
	(1007, '图书批量删除', 1001, 6, '#', 'F', 0, 'book:bookmanage:batchRemove', '', 'admin', '2018-05-28 10:03:48', 'admin', '2018-05-28 10:05:15', ''),
	(1008, '图书详情', 1001, 7, '#', 'F', 0, 'book:bookmanage:detail', '', 'admin', '2018-05-28 12:22:22', '', NULL, ''),
	(1009, '批量上传', 1001, 8, '#', 'F', 0, 'book:bookmanage:batchAdd', '', 'admin', '2018-05-28 14:49:34', '', NULL, ''),
	(1010, '意向图书管理', 85, 2, '/book/intention', 'C', 0, 'book:intention:view', '', 'admin', '2018-05-29 09:59:20', 'admin', '2018-05-29 09:59:56', ''),
	(1011, '意向图书查询', 1010, 1, '#', 'F', 0, 'book:intention:list', '', 'admin', '2018-05-29 10:00:28', '', NULL, ''),
	(1012, '意向图书新增', 1010, 2, '#', 'F', 0, 'book:intention:add', '', 'admin', '2018-05-29 10:02:11', 'admin', '2018-05-29 10:02:30', ''),
	(1013, '意向图书修改', 1010, 3, '#', 'F', 0, 'book:intention:edit', '', 'admin', '2018-05-29 10:03:22', '', NULL, ''),
	(1014, '意向图书删除', 1010, 4, '#', 'F', 0, 'book:intention:remove', '', 'admin', '2018-05-29 10:03:54', '', NULL, ''),
	(1015, '意向图书保存', 1010, 5, '#', 'F', 0, 'book:intention:save', '', 'admin', '2018-05-29 10:04:42', '', NULL, ''),
	(1016, '意向图书批量删除', 1010, 6, '#', 'F', 0, 'book:intention:batchRemove', '', 'admin', '2018-05-29 10:05:36', '', NULL, ''),
	(1017, '意向图书批量上传', 1010, 8, '#', 'F', 0, 'book:intention:batchAdd', '', 'admin', '2018-05-29 10:06:52', 'admin', '2018-05-29 10:07:51', ''),
	(1018, '意向图书详情', 1010, 7, '#', 'F', 0, 'book:intention:detail', '', 'admin', '2018-05-29 10:07:40', '', NULL, ''),
	(1019, '爬虫任务查询', 78, 1, '#', 'F', 0, 'spider:spidertask:list', '', 'admin', '2018-05-29 10:49:05', '', NULL, ''),
	(1020, '爬虫任务新增', 78, 2, '#', 'F', 0, 'spider:spidertask:add', '', 'admin', '2018-05-29 10:51:16', '', NULL, ''),
	(1021, '爬虫任务修改', 78, 3, '#', 'F', 0, 'spider:spidertask:edit', '', 'admin', '2018-05-29 10:51:51', '', NULL, ''),
	(1022, '爬虫任务删除', 78, 4, '#', 'F', 0, 'spider:spidertask:remove', '', 'admin', '2018-05-29 10:53:00', 'admin', '2018-05-29 16:10:44', ''),
	(1023, '爬虫任务保存', 78, 5, '#', 'F', 0, 'spider:spidertask:save', '', 'admin', '2018-05-29 10:53:29', '', NULL, ''),
	(1024, '爬虫任务批量删除', 78, 6, '#', 'F', 0, 'spider:spidertask:batchRemove', '', 'admin', '2018-05-29 10:54:24', '', NULL, ''),
	(1026, '爬虫参数获取', 78, 7, '#', 'F', 0, 'spider:spidertask:params', '', 'admin', '2018-05-29 17:44:19', 'admin', '2018-05-30 16:08:20', ''),
	(1027, '任务详情状态修改', 78, 8, '', 'F', 0, 'spider:spidertask:spidertaskinfo:changeStatus', '', 'admin', '2018-05-29 17:56:48', 'admin', '2018-06-06 13:30:02', ''),
	(1028, '爬虫参数修改', 78, 9, '', 'F', 0, 'spider:spidertask:saveParams', '', 'admin', '2018-05-30 16:08:51', '', NULL, ''),
	(1029, '下载模板', 1001, 9, '', 'F', 0, 'book:bookmanage:downExcelTemplate', '', 'admin', '2018-05-31 15:34:58', '', NULL, ''),
	(1030, '批量保存', 1001, 10, '', 'F', 0, 'book:bookmanage:batchSave', '', 'admin', '2018-05-31 15:35:21', '', NULL, ''),
	(1031, '批量解析Excel回显', 1001, 11, '', 'F', 0, 'book:bookmanage:batchAnalyzeList', '', 'admin', '2018-05-31 15:40:45', '', NULL, ''),
	(1034, '意向图书下载模板', 1010, 9, '', 'F', 0, 'book:intention:downExcelTemplate', '', 'admin', '2018-06-01 14:37:25', '', NULL, ''),
	(1035, '意向图书批量保存', 1010, 10, '', 'F', 0, 'book:intention:batchSave', '', 'admin', '2018-06-01 14:38:05', '', NULL, ''),
	(1036, '意向图书批量解析回显', 1010, 11, '', 'F', 0, 'book:intention:batchAnalyzeList', '', 'admin', '2018-06-01 14:38:41', '', NULL, ''),
	(1037, '批量导出', 1001, 12, '', 'F', 0, 'book:bookmanage:batchExport', '', 'admin', '2018-06-01 16:15:46', '', NULL, ''),
	(1038, '意向图书批量导出', 1010, 12, '', 'F', 0, 'book:intention:batchExport', '', 'admin', '2018-06-01 18:02:35', '', NULL, ''),
	(1039, '自定义爬虫', 76, 2, '/spider/customspider', 'C', 0, 'spider:customspider:view', '', 'admin', '2018-06-01 22:58:23', 'admin', '2018-06-08 12:03:48', ''),
	(1040, '自定义爬虫查询', 1039, 1, '', 'F', 0, 'spider:customspider:list', '', 'admin', '2018-06-01 23:00:29', '', NULL, ''),
	(1041, '自定义爬虫新增', 1039, 2, '', 'F', 0, 'spider:customspider:add', '', 'admin', '2018-06-01 23:01:30', '', NULL, ''),
	(1042, '自定义爬虫修改', 1039, 3, '', 'F', 0, 'spider:customspider:edit', '', 'admin', '2018-06-01 23:02:15', '', NULL, ''),
	(1043, '自定义爬虫删除', 1039, 4, '', 'F', 0, 'spider:customspider:remove', '', 'admin', '2018-06-01 23:03:13', '', NULL, ''),
	(1044, '自定义爬虫保存', 1039, 5, '', 'F', 0, 'spider:customspider:save', '', 'admin', '2018-06-01 23:03:47', '', NULL, ''),
	(1045, '自定义爬虫批量删除', 1039, 6, '', 'F', 0, 'spider:customspider:batchRemove', '', 'admin', '2018-06-01 23:04:34', '', NULL, ''),
	(1046, '自定义爬虫编写', 1039, 7, '/spider/customspider/code', 'C', 0, 'spider:customspider:code:view', '', 'admin', '2018-06-03 11:55:27', 'superadmin', '2018-07-05 10:09:49', ''),
	(1048, '添加爬虫任务', 78, 10, '', 'F', 0, 'spider:spidertask:startTask', '', 'admin', '2018-06-05 16:30:44', 'superadmin', '2018-06-20 17:00:14', ''),
	(1049, '爬虫任务详情', 78, 11, '', 'F', 0, 'spider:spidertask:spidertaskinfo:list', '', 'admin', '2018-06-05 16:31:49', 'admin', '2018-06-05 18:20:46', ''),
	(1050, '爬虫任务详情删除', 78, 12, '', 'F', 0, 'spider:spidertask:spidertaskinfo:remove', '', 'admin', '2018-06-06 09:21:03', '', NULL, ''),
	(1051, '爬虫任务详情批量删除', 78, 13, '', 'F', 0, 'spider:spidertask:spidertaskinfo:batchRemove', '', 'admin', '2018-06-06 09:21:46', '', NULL, ''),
	(1052, '爬虫任务详情下载', 78, 14, '', 'F', 0, 'spider:spidertask:spidertaskinfo:downloadData', '', 'admin', '2018-06-06 09:22:12', 'superadmin', '2018-06-21 17:00:18', ''),
	(1053, '爬虫任务详情任务启动', 78, 15, '', 'F', 0, 'spider:spidertask:spidertaskinfo:start', '', 'admin', '2018-06-06 14:23:53', 'admin', '2018-06-06 14:24:47', ''),
	(1054, '爬虫任务详情爬虫中止', 78, 16, '', 'F', 0, 'spider:spidertask:spidertaskinfo:stop', '', 'admin', '2018-06-06 14:24:33', 'admin', '2018-06-06 14:24:58', ''),
	(1055, '爬虫代码类型', 76, 1, '/spider/codeType', 'C', 0, 'spider:codeType:view', '', 'admin', '2018-06-08 09:39:50', 'admin', '2018-06-08 12:03:37', ''),
	(1056, '代码类型查询', 1055, 1, '', 'F', 0, 'spider:codeType:list', '', 'admin', '2018-06-08 09:43:57', '', NULL, ''),
	(1057, '代码类型新增', 1055, 2, '', 'F', 0, 'spider:codeType:add', '', 'admin', '2018-06-08 09:44:32', '', NULL, ''),
	(1058, '代码类型删除', 1055, 3, '', 'F', 0, 'spider:codeType:remove', '', 'admin', '2018-06-08 09:45:02', '', NULL, ''),
	(1059, '代码类型修改', 1055, 4, '', 'F', 0, 'spider:codeType:edit', '', 'admin', '2018-06-08 09:46:48', '', NULL, ''),
	(1060, '代码类型保存', 1055, 5, '', 'F', 0, 'spider:codeType:save', '', 'admin', '2018-06-08 09:47:17', '', NULL, ''),
	(1061, '代码类型批量删除', 1055, 6, '', 'F', 0, 'spider:codeType:batchRemove', '', 'admin', '2018-06-08 09:47:57', '', NULL, ''),
	(1062, '博客管理', 0, 4, '', 'M', 0, '', 'fa fa-feed', 'superadmin', '2018-06-12 10:55:30', '', NULL, ''),
	(1063, '网站管理', 1062, 1, '/blog/blogcontent/add', 'C', 0, 'blog:blogcontent:add', '', 'superadmin', '2018-06-12 10:57:32', 'superadmin', '2018-06-13 08:50:43', ''),
	(1064, '文章管理', 1062, 2, '/blog/blogcontent', 'C', 0, 'blog:blogcontent:view', '', 'superadmin', '2018-06-12 10:58:39', 'superadmin', '2018-06-13 11:30:07', ''),
	(1065, '文章新增', 1064, 1, '', 'F', 0, 'blog:blogcontent:add', '', 'superadmin', '2018-06-12 10:59:31', 'superadmin', '2018-06-12 11:08:34', ''),
	(1066, '文章编辑', 1064, 2, '', 'F', 0, 'blog:blogcontent:edit', '', 'superadmin', '2018-06-12 10:59:52', 'superadmin', '2018-06-12 11:08:45', ''),
	(1067, '文章删除', 1064, 3, '', 'F', 0, 'blog:blogcontent:remove', '', 'superadmin', '2018-06-12 11:00:12', 'superadmin', '2018-06-12 11:08:55', ''),
	(1068, '文章批量删除', 1064, 4, '', 'F', 0, 'blog:blogcontent:batchRemove', '', 'superadmin', '2018-06-12 11:00:42', 'superadmin', '2018-06-12 11:09:06', ''),
	(1069, '文章查询', 1064, 5, '', 'F', 0, 'blog:blogcontent:list', '', 'superadmin', '2018-06-12 12:27:35', '', NULL, ''),
	(1070, '文章保存', 1064, 6, '', 'F', 0, 'blog:blogcontent:save', '', 'superadmin', '2018-06-12 13:45:04', '', NULL, ''),
	(1071, '通用工具', 0, 7, '', 'M', 0, '', 'fa fa-wrench', 'superadmin', '2018-06-13 11:18:16', '', NULL, ''),
	(1072, '简单游戏', 0, 8, '', 'M', 0, '', 'fa fa-paper-plane', 'superadmin', '2018-06-13 11:22:02', '', NULL, ''),
	(1073, '聊天工具', 0, 9, '', 'M', 0, '', 'fa fa-comments', 'superadmin', '2018-06-13 11:25:20', '', NULL, ''),
	(1074, '工具管理', 1071, 1, '/commontool/toolmanage', 'C', 0, 'commontool:toolmanage:view', '', 'superadmin', '2018-06-13 12:35:41', '', NULL, ''),
	(1075, '工具查询', 1074, 1, '', 'F', 0, 'commontool:toolmanage:list', '', 'superadmin', '2018-06-13 12:36:34', '', NULL, ''),
	(1076, '工具新增', 1074, 2, '', 'F', 0, 'commontool:toolmanage:add', '', 'superadmin', '2018-06-13 12:36:54', '', NULL, ''),
	(1077, '工具修改', 1074, 3, '', 'F', 0, 'commontool:toolmanage:edit', '', 'superadmin', '2018-06-13 12:37:18', '', NULL, ''),
	(1078, '工具保存', 1074, 4, '', 'F', 0, 'commontool:toolmanage:save', '', 'superadmin', '2018-06-13 12:37:39', '', NULL, ''),
	(1079, '工具删除', 1074, 5, '', 'F', 0, 'commontool:toolmanage:remove', '', 'superadmin', '2018-06-13 12:37:58', '', NULL, ''),
	(1080, '工具批量删除', 1074, 6, '', 'F', 0, 'commontool:toolmanage:batchRemove', '', 'superadmin', '2018-06-13 12:38:25', '', NULL, ''),
	(1081, '工具文件上传', 1074, 7, '', 'F', 0, 'commontool:toolmanage:uploadtoolfile', '', 'superadmin', '2018-06-13 12:47:59', '', NULL, ''),
	(1082, '工具列表', 1071, 2, '/commontool/toollist', 'C', 0, 'commontool:toollist:view', '', 'superadmin', '2018-06-13 16:07:01', '', NULL, ''),
	(1083, '工具列表查询', 1082, 1, '', 'F', 0, 'commontool:toollist:list', '', 'superadmin', '2018-06-13 16:07:44', '', NULL, ''),
	(1084, '工具列表新增', 1082, 2, '', 'F', 0, 'commontool:toollist:add', '', 'superadmin', '2018-06-13 16:08:40', '', NULL, ''),
	(1085, '工具列表修改', 1082, 3, '', 'F', 0, 'commontool:toollist:edit', '', 'superadmin', '2018-06-13 16:09:08', '', NULL, ''),
	(1086, '工具列表保存', 1082, 4, '', 'F', 0, 'commontool:toollist:save', '', 'superadmin', '2018-06-13 16:09:46', '', NULL, ''),
	(1087, '工具列表删除', 1082, 5, '', 'F', 0, 'commontool:toollist:remove', '', 'superadmin', '2018-06-13 16:10:20', '', NULL, ''),
	(1088, '工具列表批量删除', 1082, 6, '', 'F', 0, 'commontool:toollist:batchRemove', '', 'superadmin', '2018-06-13 16:10:47', '', NULL, ''),
	(1089, '工具启动', 1082, 7, '', 'F', 0, 'commontool:toollist:run', '', 'superadmin', '2018-06-13 17:19:17', '', NULL, ''),
	(1090, '基础设置', 3, 3, '/tool/baseset', 'C', 0, 'tool:baseset:view', '', 'superadmin', '2018-06-14 13:56:32', 'superadmin', '2018-06-22 13:24:47', ''),
	(1091, '游戏管理', 1072, 1, '/commongame/gamemanage', 'C', 0, 'commongame:gamemanage:view', '', 'superadmin', '2018-06-15 08:44:44', '', NULL, ''),
	(1092, '游戏列表', 1072, 2, '/commongame/gamelist', 'C', 0, 'commongame:gamelist:view', '', 'superadmin', '2018-06-15 08:46:14', '', NULL, ''),
	(1093, '游戏查询', 1091, 1, '', 'F', 0, 'commongame:gamemanage:list', '', 'superadmin', '2018-06-15 08:46:57', '', NULL, ''),
	(1094, '游戏新增', 1091, 2, '', 'F', 0, 'commongame:gamemanage:add', '', 'superadmin', '2018-06-15 08:47:18', '', NULL, ''),
	(1095, '游戏保存', 1091, 3, '', 'F', 0, 'commongame:gamemanage:save', '', 'superadmin', '2018-06-15 08:47:41', '', NULL, ''),
	(1096, '游戏修改', 1091, 4, '', 'F', 0, 'commongame:gamemanage:edit', '', 'superadmin', '2018-06-15 08:48:02', '', NULL, ''),
	(1097, '游戏删除', 1091, 5, '', 'F', 0, 'commongame:gamemanage:remove', '', 'superadmin', '2018-06-15 08:48:25', '', NULL, ''),
	(1098, '游戏批量删除', 1091, 6, '', 'F', 0, 'commongame:gamemanage:batchRemove', '', 'superadmin', '2018-06-15 08:48:52', 'superadmin', '2018-06-15 08:49:09', ''),
	(1099, '游戏列表查询', 1092, 1, '', 'F', 0, 'commongame:gamelist:list', '', 'superadmin', '2018-06-15 08:49:48', 'superadmin', '2018-06-15 08:52:54', ''),
	(1100, '游戏列表新增', 1092, 2, '', 'F', 0, 'commongame:gamelist:add', '', 'superadmin', '2018-06-15 08:50:10', 'superadmin', '2018-06-15 08:53:16', ''),
	(1101, '游戏列表保存', 1092, 3, '', 'F', 0, 'commongame:gamelist:save', '', 'superadmin', '2018-06-15 08:50:35', 'superadmin', '2018-06-15 08:53:31', ''),
	(1102, '游戏列表修改', 1092, 4, '', 'F', 0, 'commongame:gamelist:edit', '', 'superadmin', '2018-06-15 08:50:54', 'superadmin', '2018-06-15 08:53:44', ''),
	(1103, '游戏列表删除', 1092, 5, '', 'F', 0, 'commongame:gamelist:remove', '', 'superadmin', '2018-06-15 08:51:35', '', NULL, ''),
	(1104, '游戏列表批量删除', 1092, 6, '', 'F', 0, 'commongame:gamelist:batchRemove', '', 'superadmin', '2018-06-15 08:52:10', '', NULL, ''),
	(1105, '游戏启动', 1092, 7, '', 'F', 0, 'commongame:gamelist:run', '', 'superadmin', '2018-06-15 08:52:38', '', NULL, ''),
	(1106, '工具源码下载', 1082, 8, '', 'F', 0, 'commontool:toollist:downSrcFile', '', 'superadmin', '2018-06-15 14:10:54', '', NULL, ''),
	(1107, '工具可执行exe下载', 1082, 9, '', 'F', 0, 'commontool:toollist:downExecexeFile', '', 'superadmin', '2018-06-15 14:11:43', '', NULL, ''),
	(1108, '工具安装版exe下载', 1082, 10, '', 'F', 0, 'commontool:toollist:downSetupexeFile', '', 'superadmin', '2018-06-15 14:12:14', '', NULL, ''),
	(1109, '游戏源码下载', 1092, 8, '', 'F', 0, 'commongame:gamelist:downSrcFile', '', 'superadmin', '2018-06-15 14:26:52', '', NULL, ''),
	(1110, '游戏可执行exe下载', 1092, 9, '', 'F', 0, 'commongame:gamelist:downExecexeFile', '', 'superadmin', '2018-06-15 14:27:16', '', NULL, ''),
	(1111, '游戏安装版exe下载', 1092, 10, '', 'F', 0, 'commongame:gamelist:downSetupexeFile', '', 'superadmin', '2018-06-15 14:27:39', '', NULL, ''),
	(1113, '基础设置查询', 1090, 1, '', 'F', 0, 'tool:baseset:list', '', 'superadmin', '2018-06-23 13:05:21', '', NULL, ''),
	(1114, '基础设置新增', 1090, 2, '', 'F', 0, 'tool:baseset:add', '', 'superadmin', '2018-06-23 13:07:37', '', NULL, ''),
	(1115, '基础设置保存', 1090, 3, '', 'F', 0, 'tool:baseset:save', '', 'superadmin', '2018-06-23 13:08:15', '', NULL, ''),
	(1116, '基础设置修改', 1090, 4, '', 'F', 0, 'tool:baseset:edit', '', 'superadmin', '2018-06-23 13:08:56', '', NULL, ''),
	(1117, '基础设置删除', 1090, 5, '', 'F', 0, 'tool:baseset:remove', '', 'superadmin', '2018-06-23 13:09:29', '', NULL, ''),
	(1118, '基础设置批量删除', 1090, 6, '', 'F', 0, 'tool:baseset:batchRemove', '', 'superadmin', '2018-06-23 13:09:58', '', NULL, ''),
	(1119, 'JAVA代码示例修改', 1090, 7, '', 'F', 0, 'tool:baseset:detailedit:spiderJavaCodeExampleEdit', '', 'superadmin', '2018-06-23 13:45:20', 'superadmin', '2018-06-27 09:03:25', ''),
	(1120, 'PYTHON代码示例修改', 1090, 8, '', 'F', 0, 'tool:baseset:detailedit:spiderPythonCodeExampleEdit', '', 'superadmin', '2018-06-23 13:46:18', 'superadmin', '2018-06-27 09:03:45', ''),
	(1121, 'JAVASCRIPT代码示例修改', 1090, 9, '', 'F', 0, 'tool:baseset:detailedit:spiderJavascriptCodeExampleEdit', '', 'superadmin', '2018-06-23 13:47:35', 'superadmin', '2018-06-27 09:04:05', ''),
	(1122, '主题设置启用', 1090, 10, '', 'F', 0, 'tool:baseset:startUse', '', 'superadmin', '2018-06-23 13:48:30', '', NULL, ''),
	(1127, '爬虫文件运行', 1046, 1, '', 'F', 0, 'spider:customspider:code:run', '', 'superadmin', '2018-07-05 10:05:16', '', NULL, ''),
	(1128, '爬虫文件新建', 1046, 2, '', 'F', 0, 'spider:customspider:code:newFile', '', 'superadmin', '2018-07-05 10:06:09', 'superadmin', '2018-07-05 10:12:15', ''),
	(1129, '爬虫文件删除', 1046, 3, '', 'F', 0, 'spider:customspider:code:deleteFile', '', 'superadmin', '2018-07-05 10:12:41', '', NULL, ''),
	(1130, '爬虫文件导出', 1046, 4, '', 'F', 0, 'spider:customspider:code:exportFile', '', 'superadmin', '2018-07-05 10:13:20', '', NULL, ''),
	(1131, '爬虫文件上传', 1046, 5, '', 'F', 0, 'spider:customspider:code:importFile', '', 'superadmin', '2018-07-05 10:13:49', '', NULL, ''),
	(1132, '爬虫文件保存', 1046, 6, '', 'F', 0, 'spider:customspider:code:fileSave', '', 'superadmin', '2018-07-05 11:30:22', 'superadmin', '2018-07-05 11:32:13', ''),
	(1133, '基础设置清除缓存', 1090, 10, '', 'F', 0, 'tool:baseset:clear', '', 'superadmin', '2018-07-16 12:03:34', '', NULL, ''),
	(1134, '爬虫文件打开', 1046, 7, '', 'F', 0, 'spider:customspider:code:openFile', '', 'superadmin', '2018-08-07 00:26:01', 'superadmin', '2018-08-07 00:30:52', ''),
	(1135, '查询爬虫名称类型', 78, 17, '', 'F', 0, 'spider:spidertask:spiderTypeAndNameList', '', 'superadmin', '2018-08-07 21:03:59', 'superadmin', '2018-08-07 21:04:33', '');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_oper_log
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE IF NOT EXISTS `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `action` varchar(100) DEFAULT '' COMMENT '功能请求',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `channel` varchar(20) DEFAULT '' COMMENT '来源渠道',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态 0正常 1异常',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- Dumping data for table rzspider.sys_oper_log: ~1 rows (approximately)
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `action`, `method`, `channel`, `login_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_param`, `status`, `error_msg`, `oper_time`) VALUES
	(1, '监控管理', '登录日志-批量删除', 'com.rzspider.project.monitor.logininfor.controller.LogininforController.batchRemove()', 'web', 'superadmin', '瑞集团', '/monitor/logininfor/batchRemove', '192.168.1.52', '{"ids[]":["2042","2041","2040","2039","2038","2037","2036","2035"]}', 0, NULL, '2018-08-08 21:24:10');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_post
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE IF NOT EXISTS `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(100) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` int(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- Dumping data for table rzspider.sys_post: ~4 rows (approximately)
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 'ceo', '董事长', 1, 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(2, 'se', '项目经理', 2, 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(3, 'hr', '人力资源', 3, 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', ''),
	(4, 'user', '普通员工', 4, 0, 'admin', '2018-03-16 11:33:00', 'rz', '2018-03-16 11:33:00', '');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_role
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE IF NOT EXISTS `sys_role` (
  `role_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(10) NOT NULL COMMENT '显示顺序',
  `status` int(1) DEFAULT '0' COMMENT '角色状态:0正常,1禁用',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- Dumping data for table rzspider.sys_role: ~4 rows (approximately)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '管理员', 'admin', 2, 0, 'admin', '2018-03-16 11:33:00', 'superadmin', '2018-08-07 21:07:20', '管理员'),
	(2, '普通角色', 'common', 3, 0, 'admin', '2018-03-16 11:33:00', 'superadmin', '2018-08-07 21:07:42', '普通角色'),
	(3, '超级管理员', 'superadmin', 1, 0, 'admin', '2018-06-10 11:35:15', 'superadmin', '2018-08-07 21:07:31', '最大管理员'),
	(4, '测试管理员', 'testadmin', 4, 0, 'superadmin', '2018-08-07 00:17:11', 'superadmin', '2018-08-07 21:07:54', '');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_role_menu
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- Dumping data for table rzspider.sys_role_menu: ~573 rows (approximately)
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(1, 3),
	(1, 16),
	(1, 17),
	(1, 74),
	(1, 75),
	(1, 76),
	(1, 77),
	(1, 78),
	(1, 79),
	(1, 80),
	(1, 81),
	(1, 82),
	(1, 83),
	(1, 84),
	(1, 85),
	(1, 1001),
	(1, 1002),
	(1, 1003),
	(1, 1004),
	(1, 1005),
	(1, 1006),
	(1, 1007),
	(1, 1008),
	(1, 1009),
	(1, 1010),
	(1, 1011),
	(1, 1012),
	(1, 1013),
	(1, 1014),
	(1, 1015),
	(1, 1016),
	(1, 1017),
	(1, 1018),
	(1, 1019),
	(1, 1020),
	(1, 1021),
	(1, 1022),
	(1, 1023),
	(1, 1024),
	(1, 1026),
	(1, 1027),
	(1, 1028),
	(1, 1029),
	(1, 1030),
	(1, 1031),
	(1, 1034),
	(1, 1035),
	(1, 1036),
	(1, 1037),
	(1, 1038),
	(1, 1039),
	(1, 1040),
	(1, 1041),
	(1, 1042),
	(1, 1043),
	(1, 1044),
	(1, 1045),
	(1, 1046),
	(1, 1048),
	(1, 1049),
	(1, 1050),
	(1, 1051),
	(1, 1052),
	(1, 1053),
	(1, 1054),
	(1, 1055),
	(1, 1056),
	(1, 1057),
	(1, 1058),
	(1, 1059),
	(1, 1060),
	(1, 1061),
	(1, 1062),
	(1, 1063),
	(1, 1064),
	(1, 1065),
	(1, 1066),
	(1, 1067),
	(1, 1068),
	(1, 1069),
	(1, 1070),
	(1, 1071),
	(1, 1072),
	(1, 1074),
	(1, 1075),
	(1, 1076),
	(1, 1077),
	(1, 1078),
	(1, 1079),
	(1, 1080),
	(1, 1081),
	(1, 1082),
	(1, 1083),
	(1, 1084),
	(1, 1085),
	(1, 1086),
	(1, 1087),
	(1, 1088),
	(1, 1089),
	(1, 1090),
	(1, 1091),
	(1, 1092),
	(1, 1093),
	(1, 1094),
	(1, 1095),
	(1, 1096),
	(1, 1097),
	(1, 1098),
	(1, 1099),
	(1, 1100),
	(1, 1101),
	(1, 1102),
	(1, 1103),
	(1, 1104),
	(1, 1105),
	(1, 1106),
	(1, 1107),
	(1, 1108),
	(1, 1109),
	(1, 1110),
	(1, 1111),
	(1, 1113),
	(1, 1114),
	(1, 1115),
	(1, 1116),
	(1, 1117),
	(1, 1118),
	(1, 1119),
	(1, 1120),
	(1, 1121),
	(1, 1122),
	(1, 1127),
	(1, 1128),
	(1, 1129),
	(1, 1130),
	(1, 1131),
	(1, 1132),
	(1, 1133),
	(1, 1134),
	(1, 1135),
	(2, 76),
	(2, 78),
	(2, 85),
	(2, 1001),
	(2, 1002),
	(2, 1003),
	(2, 1004),
	(2, 1005),
	(2, 1006),
	(2, 1007),
	(2, 1008),
	(2, 1009),
	(2, 1010),
	(2, 1011),
	(2, 1012),
	(2, 1013),
	(2, 1014),
	(2, 1015),
	(2, 1016),
	(2, 1017),
	(2, 1018),
	(2, 1019),
	(2, 1020),
	(2, 1021),
	(2, 1022),
	(2, 1023),
	(2, 1024),
	(2, 1026),
	(2, 1027),
	(2, 1028),
	(2, 1029),
	(2, 1030),
	(2, 1031),
	(2, 1034),
	(2, 1035),
	(2, 1036),
	(2, 1037),
	(2, 1038),
	(2, 1048),
	(2, 1049),
	(2, 1050),
	(2, 1051),
	(2, 1052),
	(2, 1053),
	(2, 1054),
	(2, 1071),
	(2, 1072),
	(2, 1082),
	(2, 1083),
	(2, 1084),
	(2, 1085),
	(2, 1086),
	(2, 1087),
	(2, 1088),
	(2, 1089),
	(2, 1092),
	(2, 1099),
	(2, 1100),
	(2, 1101),
	(2, 1102),
	(2, 1103),
	(2, 1104),
	(2, 1105),
	(2, 1106),
	(2, 1107),
	(2, 1108),
	(2, 1109),
	(2, 1110),
	(2, 1111),
	(2, 1135),
	(3, 1),
	(3, 2),
	(3, 3),
	(3, 4),
	(3, 5),
	(3, 6),
	(3, 7),
	(3, 8),
	(3, 9),
	(3, 10),
	(3, 11),
	(3, 12),
	(3, 13),
	(3, 14),
	(3, 15),
	(3, 16),
	(3, 17),
	(3, 18),
	(3, 19),
	(3, 20),
	(3, 21),
	(3, 22),
	(3, 23),
	(3, 24),
	(3, 25),
	(3, 26),
	(3, 27),
	(3, 28),
	(3, 29),
	(3, 30),
	(3, 31),
	(3, 32),
	(3, 33),
	(3, 34),
	(3, 35),
	(3, 36),
	(3, 37),
	(3, 38),
	(3, 39),
	(3, 40),
	(3, 41),
	(3, 42),
	(3, 43),
	(3, 44),
	(3, 45),
	(3, 46),
	(3, 47),
	(3, 48),
	(3, 49),
	(3, 50),
	(3, 51),
	(3, 52),
	(3, 53),
	(3, 54),
	(3, 55),
	(3, 56),
	(3, 57),
	(3, 58),
	(3, 59),
	(3, 60),
	(3, 61),
	(3, 62),
	(3, 63),
	(3, 64),
	(3, 65),
	(3, 66),
	(3, 67),
	(3, 68),
	(3, 69),
	(3, 70),
	(3, 71),
	(3, 72),
	(3, 73),
	(3, 74),
	(3, 75),
	(3, 76),
	(3, 77),
	(3, 78),
	(3, 79),
	(3, 80),
	(3, 81),
	(3, 82),
	(3, 83),
	(3, 84),
	(3, 85),
	(3, 1001),
	(3, 1002),
	(3, 1003),
	(3, 1004),
	(3, 1005),
	(3, 1006),
	(3, 1007),
	(3, 1008),
	(3, 1009),
	(3, 1010),
	(3, 1011),
	(3, 1012),
	(3, 1013),
	(3, 1014),
	(3, 1015),
	(3, 1016),
	(3, 1017),
	(3, 1018),
	(3, 1019),
	(3, 1020),
	(3, 1021),
	(3, 1022),
	(3, 1023),
	(3, 1024),
	(3, 1026),
	(3, 1027),
	(3, 1028),
	(3, 1029),
	(3, 1030),
	(3, 1031),
	(3, 1034),
	(3, 1035),
	(3, 1036),
	(3, 1037),
	(3, 1038),
	(3, 1039),
	(3, 1040),
	(3, 1041),
	(3, 1042),
	(3, 1043),
	(3, 1044),
	(3, 1045),
	(3, 1046),
	(3, 1048),
	(3, 1049),
	(3, 1050),
	(3, 1051),
	(3, 1052),
	(3, 1053),
	(3, 1054),
	(3, 1055),
	(3, 1056),
	(3, 1057),
	(3, 1058),
	(3, 1059),
	(3, 1060),
	(3, 1061),
	(3, 1062),
	(3, 1063),
	(3, 1064),
	(3, 1065),
	(3, 1066),
	(3, 1067),
	(3, 1068),
	(3, 1069),
	(3, 1070),
	(3, 1071),
	(3, 1072),
	(3, 1074),
	(3, 1075),
	(3, 1076),
	(3, 1077),
	(3, 1078),
	(3, 1079),
	(3, 1080),
	(3, 1081),
	(3, 1082),
	(3, 1083),
	(3, 1084),
	(3, 1085),
	(3, 1086),
	(3, 1087),
	(3, 1088),
	(3, 1089),
	(3, 1090),
	(3, 1091),
	(3, 1092),
	(3, 1093),
	(3, 1094),
	(3, 1095),
	(3, 1096),
	(3, 1097),
	(3, 1098),
	(3, 1099),
	(3, 1100),
	(3, 1101),
	(3, 1102),
	(3, 1103),
	(3, 1104),
	(3, 1105),
	(3, 1106),
	(3, 1107),
	(3, 1108),
	(3, 1109),
	(3, 1110),
	(3, 1111),
	(3, 1113),
	(3, 1114),
	(3, 1115),
	(3, 1116),
	(3, 1117),
	(3, 1118),
	(3, 1119),
	(3, 1120),
	(3, 1121),
	(3, 1122),
	(3, 1127),
	(3, 1128),
	(3, 1129),
	(3, 1130),
	(3, 1131),
	(3, 1132),
	(3, 1133),
	(3, 1134),
	(3, 1135),
	(4, 2),
	(4, 3),
	(4, 11),
	(4, 12),
	(4, 13),
	(4, 14),
	(4, 16),
	(4, 17),
	(4, 59),
	(4, 60),
	(4, 61),
	(4, 62),
	(4, 63),
	(4, 64),
	(4, 65),
	(4, 66),
	(4, 67),
	(4, 68),
	(4, 69),
	(4, 70),
	(4, 71),
	(4, 72),
	(4, 73),
	(4, 74),
	(4, 75),
	(4, 76),
	(4, 77),
	(4, 78),
	(4, 79),
	(4, 80),
	(4, 81),
	(4, 82),
	(4, 83),
	(4, 84),
	(4, 85),
	(4, 1001),
	(4, 1002),
	(4, 1003),
	(4, 1004),
	(4, 1005),
	(4, 1006),
	(4, 1007),
	(4, 1008),
	(4, 1009),
	(4, 1010),
	(4, 1011),
	(4, 1012),
	(4, 1013),
	(4, 1014),
	(4, 1015),
	(4, 1016),
	(4, 1017),
	(4, 1018),
	(4, 1019),
	(4, 1020),
	(4, 1021),
	(4, 1022),
	(4, 1023),
	(4, 1024),
	(4, 1026),
	(4, 1027),
	(4, 1028),
	(4, 1029),
	(4, 1030),
	(4, 1031),
	(4, 1034),
	(4, 1035),
	(4, 1036),
	(4, 1037),
	(4, 1038),
	(4, 1039),
	(4, 1040),
	(4, 1041),
	(4, 1046),
	(4, 1048),
	(4, 1049),
	(4, 1050),
	(4, 1051),
	(4, 1052),
	(4, 1053),
	(4, 1054),
	(4, 1055),
	(4, 1056),
	(4, 1057),
	(4, 1060),
	(4, 1062),
	(4, 1063),
	(4, 1064),
	(4, 1065),
	(4, 1066),
	(4, 1067),
	(4, 1068),
	(4, 1069),
	(4, 1070),
	(4, 1071),
	(4, 1072),
	(4, 1074),
	(4, 1075),
	(4, 1076),
	(4, 1077),
	(4, 1078),
	(4, 1079),
	(4, 1080),
	(4, 1081),
	(4, 1082),
	(4, 1083),
	(4, 1084),
	(4, 1085),
	(4, 1086),
	(4, 1087),
	(4, 1088),
	(4, 1089),
	(4, 1090),
	(4, 1091),
	(4, 1092),
	(4, 1093),
	(4, 1094),
	(4, 1095),
	(4, 1096),
	(4, 1097),
	(4, 1098),
	(4, 1099),
	(4, 1100),
	(4, 1101),
	(4, 1102),
	(4, 1103),
	(4, 1104),
	(4, 1105),
	(4, 1106),
	(4, 1107),
	(4, 1108),
	(4, 1109),
	(4, 1110),
	(4, 1111),
	(4, 1113),
	(4, 1114),
	(4, 1115),
	(4, 1116),
	(4, 1117),
	(4, 1118),
	(4, 1119),
	(4, 1120),
	(4, 1121),
	(4, 1122),
	(4, 1127),
	(4, 1128),
	(4, 1129),
	(4, 1130),
	(4, 1131),
	(4, 1132),
	(4, 1133),
	(4, 1134),
	(4, 1135);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_user
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE IF NOT EXISTS `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(20) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) DEFAULT '' COMMENT '登录账号',
  `user_name` varchar(30) DEFAULT '' COMMENT '用户昵称',
  `email` varchar(100) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(20) DEFAULT '' COMMENT '手机号码',
  `sex` char(20) DEFAULT '0' COMMENT '用户性别:0男,1女',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(100) DEFAULT '' COMMENT '密码',
  `salt` varchar(100) DEFAULT '' COMMENT '盐加密',
  `user_type` char(1) DEFAULT 'N' COMMENT '类型:Y默认用户,N非默认用户',
  `status` int(1) DEFAULT '0' COMMENT '帐号状态:0正常,1禁用',
  `refuse_des` varchar(500) DEFAULT '' COMMENT '拒绝登录描述',
  `login_ip` varchar(100) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=105 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- Dumping data for table rzspider.sys_user: ~5 rows (approximately)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `user_type`, `status`, `refuse_des`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(1, 106, 'admin', 'Rico', 'rico@163.com', '15888888888', '0', '', 'b39d7d68004c5546b927bbabdc30cc16', 'fb6d6c', 'N', 0, '正常', '192.168.1.52', '2018-08-09 12:24:40', 'admin', '2018-03-16 11:33:00', 'admin', '2018-08-08 21:22:37'),
	(101, 100, 'superadmin', '超级管理员', 'rz@qq.com', '17715359390', '0', '', '31de4572d5fb263f5823b65aa3d1e878', 'b8596c', 'N', 0, '', '192.168.1.52', '2018-08-09 12:26:00', 'admin', '2018-06-10 11:41:59', 'admin', '2018-08-08 21:23:56'),
	(102, 103, 'guest1', '客户测试1', 'guest1@qq.com', '15688888888', '0', '', 'dee80551590f22306734e05c773a24fe', '22c1bd', 'N', 0, '', '192.168.1.52', '2018-08-09 12:25:39', 'superadmin', '2018-06-10 11:49:23', '', '2018-08-08 21:23:36'),
	(103, 104, 'guest2', '客户测试2', 'guest2@qq.com', '15608888888', '0', '', '33d155fdfd3f7e4cf5c40a93a2bb18b7', 'd44ff9', 'N', 0, '', '192.168.1.52', '2018-08-08 17:20:08', 'superadmin', '2018-06-10 11:50:11', '', '2018-08-08 02:18:04'),
	(104, 106, 'testadmin', '测试管理员', '23123456@qq.com', '15612345678', '0', '', 'd2fe7f6567786e839c90c93832a139c5', '4ba1f2', 'N', 0, '', '192.168.1.52', '2018-08-09 12:25:07', 'superadmin', '2018-08-07 00:19:10', '', '2018-08-08 21:23:03');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_user_online
DROP TABLE IF EXISTS `sys_user_online`;
CREATE TABLE IF NOT EXISTS `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestsamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- Dumping data for table rzspider.sys_user_online: ~1 rows (approximately)
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` (`sessionId`, `login_name`, `dept_name`, `ipaddr`, `browser`, `os`, `status`, `start_timestsamp`, `last_access_time`, `expire_time`) VALUES
	('096a42ab-8bb2-4c14-800c-8a09bce5042f', 'superadmin', '瑞集团', '192.168.1.52', 'Chrome', 'Windows 7', 'on_line', '2018-08-09 12:25:52', '2018-08-09 12:26:00', 1800000);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_user_post
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE IF NOT EXISTS `sys_user_post` (
  `user_id` varchar(64) NOT NULL COMMENT '用户ID',
  `post_id` varchar(64) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- Dumping data for table rzspider.sys_user_post: ~5 rows (approximately)
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
	('1', '2'),
	('101', '1'),
	('102', '4'),
	('103', '4'),
	('104', '2');
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;

-- Dumping structure for table rzspider.sys_user_role
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- Dumping data for table rzspider.sys_user_role: ~5 rows (approximately)
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(101, 3),
	(102, 2),
	(103, 2),
	(104, 4);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

-- Dumping structure for table rzspider.tool_baseset
DROP TABLE IF EXISTS `tool_baseset`;
CREATE TABLE IF NOT EXISTS `tool_baseset` (
  `baseset_id` int(5) NOT NULL AUTO_INCREMENT,
  `theme_name` varchar(20) NOT NULL COMMENT '主题名称',
  `loginbg_name` mediumblob COMMENT '登录背景名称',
  `loginbg_file_name` varchar(50) DEFAULT NULL COMMENT '上传背景图片名字',
  `loginbg_type` int(1) NOT NULL DEFAULT '0' COMMENT '登录背景类型',
  `home_introduction` mediumtext COMMENT '首页介绍',
  `spider_java_package_prefix` varchar(16) DEFAULT '' COMMENT '爬虫java代码包名前缀',
  `spider_java_code_example` text COMMENT '爬虫java代码示例',
  `spider_python_code_example` text COMMENT '爬虫python代码示例',
  `spider_javascript_code_example` text COMMENT '爬虫javascript代码示例',
  `download_file_name_prefix` varchar(16) DEFAULT '' COMMENT '下载文件名前缀',
  `spider_website_manual` text COMMENT '网站使用手册内容',
  `spider_use_manual` text COMMENT '爬虫使用手册内容',
  `spider_website_manual_type` int(1) NOT NULL DEFAULT '0' COMMENT '网站手册类型',
  `spider_use_manual_type` int(1) NOT NULL DEFAULT '0' COMMENT '爬虫手册类型',
  `show_music_tool_status` int(1) DEFAULT '0' COMMENT '是否显示音乐插件',
  `music_info` text COMMENT '音乐内容',
  `music_auto_play` int(1) NOT NULL DEFAULT '1' COMMENT '音乐自动播放',
  `music_lrc_start` int(1) NOT NULL DEFAULT '1' COMMENT '音乐是否开启歌词',
  `music_show_lrc` int(1) NOT NULL DEFAULT '1' COMMENT '音乐是否显示歌词',
  `music_fixed` int(1) NOT NULL DEFAULT '0' COMMENT '音乐是否固定底部',
  `music_list_folded` int(1) NOT NULL DEFAULT '0' COMMENT '音乐列表是否折叠',
  `music_list_max_height` int(11) NOT NULL DEFAULT '240' COMMENT '音乐列表最大高度',
  `status` int(1) DEFAULT '0' COMMENT '可用状态',
  `use_status` int(1) DEFAULT '1' COMMENT '使用状态',
  `create_by` varchar(50) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(50) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`baseset_id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='基础设置详情';

-- Dumping data for table rzspider.tool_baseset: ~2 rows (approximately)
/*!40000 ALTER TABLE `tool_baseset` DISABLE KEYS */;
INSERT INTO `tool_baseset` (`baseset_id`, `theme_name`, `loginbg_name`, `loginbg_file_name`, `loginbg_type`, `home_introduction`, `spider_java_package_prefix`, `spider_java_code_example`, `spider_python_code_example`, `spider_javascript_code_example`, `download_file_name_prefix`, `spider_website_manual`, `spider_use_manual`, `spider_website_manual_type`, `spider_use_manual_type`, `show_music_tool_status`, `music_info`, `music_auto_play`, `music_lrc_start`, `music_show_lrc`, `music_fixed`, `music_list_folded`, `music_list_max_height`, `status`, `use_status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(4, '默认主题', _binary 0x30, 'b01c582a-f33f-4085-9ab6-f34a633f0640.jpg', 2, '	<div style="padding: 10px 0 20px 10px;">\n			<h2>&nbsp;&nbsp;&nbsp;一.项目介绍</h2>\n			<ul style="margin-left: 25px;">\n				<li>此项目建立在开源项目bootdo和若依系统基础上，如有侵权请及时与我联系，其详情请见：<a href="https://gitee.com/lcg0124/bootdo.git" target="_blank">https://gitee.com/lcg0124/bootdo.git</a>，<a href="https://gitee.com/y_project/RuoYi" target="_blank">https://gitee.com/y_project/RuoYi</a></li>\n				<li>Springboot作为基础框架，使用mybatis作为持久层框架，使用官方推荐的thymeleaf做为模板引擎，shiro作为安全框架详情请见：<a href="https://github.com/search?utf8=%E2%9C%93&amp;q=springboot&amp;type=" target="_blank">https://github.com/search?utf8=%E2%9C%93&amp;q=springboot&amp;type=</a></li>\n				<li>在此基础上，添加爬虫目录，工具目录，游戏目录以及聊天系统，添加网址设置等</li>\n				<li>为什么不叫crawler而叫spider，因为喜欢Spider-Man！</li>\n				<li>此项目源码请见：<a href="https://github.com/rzspider" target="_blank">https://github.com/rzspider</a></li>\n			</ul>\n\n			<h2>&nbsp;&nbsp;&nbsp;二.使用方式</h2>\n			<h3 style="margin-left: 50px;">1.基本功能</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本功能使用请见：<a href="https://gitee.com/lcg0124/bootdo.git" target="_blank">https://gitee.com/lcg0124/bootdo.git</a>，<a href="https://github.com/lcg0124/bootdo.git" target="_blank">https://github.com/lcg0124/bootdo.git</a></li>\n			</ul>\n			<h3 style="margin-left: 50px;">2.网页爬虫</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：此爬虫系统内置5个已写好爬虫，后台ID分别是10001-10005，请不要随意修改，支持语言JAVA,JAVASCRIPT,PYTHON等，可自定义，但后台安全需要另行配置</li>\n				<li>权限认知：超级管理员和管理员可以定义爬虫类型和添加编写自定义爬虫，普通用户可添加已有的爬虫管理及爬虫任务</li>\n				<li>自定义爬虫：接口已写好，源码资源文件已内置文件流的jar包和源码，以及连接数据库的jar包和源码，自定义爬虫有示例代码，后台编译运行，注意安全</li>\n				<li>爬虫任务：添加爬虫任务可修改默认参数，爬虫管理自带一个默认参数，请根据格式修改内容，可设置任务启动频次</li>\n				<li>启动任务：定时任务和固有频次任务会自动添加至任务详情并启动，只执行一次的任务需设置启动时间并启用任务，每次任务详情ID表示一次任务，对应启动会覆盖原有数据</li>\n				<li>导出数据：数据格式以excel为主，内置爬虫及自定义爬虫可解析则以excel输出，无法解析的则以文本格式输出，下载包括准确任务数据以及未筛选全数据，可选择下载</li>\n				<li>其他认知：内置爬虫使用htmlunit，后台ID段是10001-19999，自定义爬虫后台ID段是20001-29999</li>\n			</ul>\n			<h3 style="margin-left: 50px;">3.图书管理</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：此系统属个人系统，未添加借阅管理，可自行添加，支持批量上传，请下载模板以供参考，支持导出excel</li>\n			</ul>\n			<h3 style="margin-left: 50px;">4.通用工具</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：已内置了几个简单的工具，如二维码生成，解析，计算器，OCR，文本格式化，代码格式化等等，可自定义添加，需修改代码</li>\n				<li>权限认知：超级管理员和管理员可以添加工具，普通员工可添加已有工具并运行和下载</li>\n				<li>添加工具：分为网页版和客户端版工具，网页版可包含客户端，网页版可直接运行，可上传源码，安装包等，但对应文件只能一个</li>\n				<li>启用工具：工具启用都是网页版，下载的源码及安装版等则属于客户端版，但上传文件可自行添加</li>\n			</ul>\n			<h3 style="margin-left: 50px;">5.简单游戏</h3>\n			<ul style="margin-left: 35px;">\n				<li>与通用工具目录相同，使用同上</li>\n			</ul>\n			<h3 style="margin-left: 50px;">6.聊天工具</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：尚未完善</li>\n			</ul>\n			<h3 style="margin-left: 50px;">7.配置文件</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：基本配置详见bootdo和若依系统源码</li>\n				<li>添加配置：主要是文件application.yml的filepath配置</li>\n				<li>详情配置：uploadPath：上传图片文件所在位置，必填。uploadCachePath：缓存文件夹，必填。uploadToolPath：上传工具文件所在位置，必填。\n					uploadGamePath：上传游戏文件所在位置。customSpiderPath：自定义爬虫文件所在位置，必填。javaCompilerPath：java编译器所在位置（tool.jar目录），选填，不填则默认系统编译器。jreRunPath：java运行环境（jre）所在位置（jre目录），选填，不填则使用系统java环境。后期将简化配置，使用默认文件夹</li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">8.基础设置</h3><ul style="margin-left: 35px;"><li>基础设置即主题设置，包括登录背景设置，首页介绍，代码包名前缀，示例代码，手册，音乐插件设置等等</li><li>登录背景可设置内置特效，首页介绍即首页显示内容，代码包名前缀即自定义爬虫代码包名，示例代码即创建自定义爬虫时的默认代码，手册即介绍，音乐插件使用zplayer，鸣谢！</li><li>系统工具有清理缓存功能，会将配置文件下无用文件清除，数据库中自定义爬虫测试数据清除等等</li></ul><ul style="margin-left: 35px;">\n			</ul>\n			<h3 style="margin-left: 50px;">9.注意事项</h3>\n			<ul style="margin-left: 35px;">\n				<li>配置文件不要只写盘符，尽量使用不同的文件夹，目录均不添加斜杠“/”“”</li>\n				<li>自定义爬虫是将前台书写的代码传到后台编译运行，需要自行设置服务器安全，或者修改源码</li>\n				<li>系统工具有清理缓存功能，会将配置文件下无用文件清除，因此配置文件的目录一定要慎配</li>\n			</ul>\n\n			<h2>&nbsp;&nbsp;&nbsp;三.联系方式</h2>\n			<h3 style="margin-left: 50px;">1.基本方式</h3>\n			<ul style="margin-left: 35px;">\n				<li>此项目建立在开源项目bootdo和若依系统基础上，点击链接加入群聊【BootDo交流二群】：<a href="https://jq.qq.com/?_wv=1027&amp;k=5M659N4">614726589</a>【若依交流二群】：1389287 感谢！</li>\n				<li>本人联系方式，QQ：<a href="https://jq.qq.com/?_wv=1027&amp;k=5M659N4">2320095772</a></li>\n				<li>邮箱，QQ邮箱：2320095772@qq.com</li>\n			</ul>\n			\n		</div>', 'rico', 'import java.util.List;\n\nimport javacustomspider.JavaCustomSpiderUtils;\n\n/**\n * 爬虫JAVA代码示例\n * \n * @author rico\n * @date 2018-06-04 \n * 爬虫的入口类，请勿删除或更改入口\n * 内置一个jar包，对象JavaCustomSpiderUtils提供数据库连接插入和json转换等方法\n */\npublic class MainSpider {\n	// 主方法，args的第一个参数args[0]即创建爬虫时的默认参数，格式为json\n	// 第二个参数是任务详情id taskInfoId，此参数无需设置，正式执行任务时将自动获取，只需要向数据库插入数据时指定\n	// 第三个参数是任务标志，测试环境是0，正式环境是1,2表示全部数据\n	// 第二和第三个参数可在代码中自行更改指定\n	public static void main(String[] args) {\n		// 获取参数\n		String spiderDefaultParams = args[0];\n		// 此参数不需要另行设置，插入数据库时直接使用\n		String taskInfoId = args[1];\n		int taskFlag = Integer.valueOf(args[2]);\n		// 以上三个参数均可自行指定\n		System.out.println(spiderDefaultParams);\n		System.out.println(taskInfoId);\n		System.out.println(taskFlag);\n\n		// 可解析参数为对象，数组，list，以list为示例\n		List<String> sdpList = null;\n		if (spiderDefaultParams != null && !"".equals(spiderDefaultParams)) {\n			sdpList = JavaCustomSpiderUtils.jsonStringToList(spiderDefaultParams);\n		}\n		System.out.println(sdpList);\n\n		/**\n		 * 以下逻辑使用参数或不使用参数开始爬虫主逻辑， 获取数据，目前仅限文本信息，不支持图片音频视频\n		 * \n		 */\n\n		// 假设爬取的数据转化为最简单的json，每一条json即一条数据\n		String jsonData = "{\\"name\\":\\"testspiderdata\\",\\"age\\":18,\\"address\\":\\"SuZhou\\"}";\n\n		// MySql数据库连接信息\n		String ip = "192.168.1.140";\n		String dbname = "rzspider";\n		String user = "root";\n		String password = "root";\n\n		// 实例化一个工具对象\n		JavaCustomSpiderUtils jcsu = new JavaCustomSpiderUtils(ip, dbname, user, password);\n		// 插入一条数据\n		boolean success = false;\n		for (int i = 0; i < 10; i++) {\n			success = jcsu.insertDataToMysql(taskInfoId, jsonData, taskFlag);\n			try {\n				Thread.sleep(1000);\n			} catch (InterruptedException e) {\n				e.printStackTrace();\n			}\n		}\n		System.out.println(success);\n		// 至此一个完整的Java爬虫完成，下载数据将会自动以jsonkey作为Excel字段，value作为值，\n		// 所以json的key尽量要一目了然\n	}\n}', 'print("test python");', 'console.log("test nodejs");', 'rico', '	<div style="padding: 10px 0 20px 10px;">\n			<h2>&nbsp;&nbsp;&nbsp;一.项目介绍</h2>\n			<ul style="margin-left: 25px;">\n				<li>此项目建立在开源项目bootdo和若依系统基础上，如有侵权请及时与我联系，其详情请见：<a href="https://gitee.com/lcg0124/bootdo.git" target="_blank">https://gitee.com/lcg0124/bootdo.git</a>，<a href="https://gitee.com/y_project/RuoYi" target="_blank">https://gitee.com/y_project/RuoYi</a></li>\n				<li>Springboot作为基础框架，使用mybatis作为持久层框架，使用官方推荐的thymeleaf做为模板引擎，shiro作为安全框架详情请见：<a href="https://github.com/search?utf8=%E2%9C%93&amp;q=springboot&amp;type=" target="_blank">https://github.com/search?utf8=%E2%9C%93&amp;q=springboot&amp;type=</a></li>\n				<li>在此基础上，添加爬虫目录，工具目录，游戏目录以及聊天系统，添加网址设置等</li>\n				<li>为什么不叫crawler而叫spider，因为喜欢Spider-Man！</li>\n				<li>此项目源码请见：<a href="https://github.com/rzspider" target="_blank">https://github.com/rzspider</a></li>\n			</ul>\n\n			<h2>&nbsp;&nbsp;&nbsp;二.使用方式</h2>\n			<h3 style="margin-left: 50px;">1.基本功能</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本功能使用请见：<a href="https://gitee.com/lcg0124/bootdo.git" target="_blank">https://gitee.com/lcg0124/bootdo.git</a>，<a href="https://github.com/lcg0124/bootdo.git" target="_blank">https://github.com/lcg0124/bootdo.git</a></li>\n			</ul>\n			<h3 style="margin-left: 50px;">2.网页爬虫</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：此爬虫系统内置5个已写好爬虫，后台ID分别是10001-10005，请不要随意修改，支持语言JAVA,JAVASCRIPT,PYTHON等，可自定义，但后台安全需要另行配置</li>\n				<li>权限认知：超级管理员和管理员可以定义爬虫类型和添加编写自定义爬虫，普通用户可添加已有的爬虫管理及爬虫任务</li>\n				<li>自定义爬虫：接口已写好，源码资源文件已内置文件流的jar包和源码，以及连接数据库的jar包和源码，自定义爬虫有示例代码，后台编译运行，注意安全</li>\n				<li>爬虫任务：添加爬虫任务可修改默认参数，爬虫管理自带一个默认参数，请根据格式修改内容，可设置任务启动频次</li>\n				<li>启动任务：定时任务和固有频次任务会自动添加至任务详情并启动，只执行一次的任务需设置启动时间并启用任务，每次任务详情ID表示一次任务，对应启动会覆盖原有数据</li>\n				<li>导出数据：数据格式以excel为主，内置爬虫及自定义爬虫可解析则以excel输出，无法解析的则以文本格式输出，下载包括准确任务数据以及未筛选全数据，可选择下载</li>\n				<li>其他认知：内置爬虫使用htmlunit，后台ID段是10001-19999，自定义爬虫后台ID段是20001-29999</li>\n			</ul>\n			<h3 style="margin-left: 50px;">3.图书管理</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：此系统属个人系统，未添加借阅管理，可自行添加，支持批量上传，请下载模板以供参考，支持导出excel</li>\n			</ul>\n			<h3 style="margin-left: 50px;">4.通用工具</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：已内置了几个简单的工具，如二维码生成，解析，计算器，OCR，文本格式化，代码格式化等等，可自定义添加，需修改代码</li>\n				<li>权限认知：超级管理员和管理员可以添加工具，普通员工可添加已有工具并运行和下载</li>\n				<li>添加工具：分为网页版和客户端版工具，网页版可包含客户端，网页版可直接运行，可上传源码，安装包等，但对应文件只能一个</li>\n				<li>启用工具：工具启用都是网页版，下载的源码及安装版等则属于客户端版，但上传文件可自行添加</li>\n			</ul>\n			<h3 style="margin-left: 50px;">5.简单游戏</h3>\n			<ul style="margin-left: 35px;">\n				<li>与通用工具目录相同，使用同上</li>\n			</ul>\n			<h3 style="margin-left: 50px;">6.聊天工具</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：尚未完善</li>\n			</ul>\n			<h3 style="margin-left: 50px;">7.配置文件</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：基本配置详见bootdo和若依系统源码</li>\n				<li>添加配置：主要是文件application.yml的filepath配置</li>\n				<li>详情配置：uploadPath：上传图片文件所在位置，必填。uploadCachePath：缓存文件夹，必填。uploadToolPath：上传工具文件所在位置，必填。\n					uploadGamePath：上传游戏文件所在位置。customSpiderPath：自定义爬虫文件所在位置，必填。javaCompilerPath：java编译器所在位置（tool.jar目录），选填，不填则默认系统编译器。jreRunPath：java运行环境（jre）所在位置（jre目录），选填，不填则使用系统java环境。后期将简化配置，使用默认文件夹</li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">8.基础设置</h3><ul style="margin-left: 35px;"><li>基础设置即主题设置，包括登录背景设置，首页介绍，代码包名前缀，示例代码，手册，音乐插件设置等等</li><li>登录背景可设置内置特效，首页介绍即首页显示内容，代码包名前缀即自定义爬虫代码包名，示例代码即创建自定义爬虫时的默认代码，手册即介绍，音乐插件使用zplayer，鸣谢！</li><li>系统工具有清理缓存功能，会将配置文件下无用文件清除，数据库中自定义爬虫测试数据清除等等</li></ul><ul style="margin-left: 35px;">\n			</ul>\n			<h3 style="margin-left: 50px;">9.注意事项</h3>\n			<ul style="margin-left: 35px;">\n				<li>配置文件不要只写盘符，尽量使用不同的文件夹，目录均不添加斜杠“/”“”</li>\n				<li>自定义爬虫是将前台书写的代码传到后台编译运行，需要自行设置服务器安全，或者修改源码</li>\n				<li>系统工具有清理缓存功能，会将配置文件下无用文件清除，因此配置文件的目录一定要慎配</li>\n			</ul>\n\n			<h2>&nbsp;&nbsp;&nbsp;三.联系方式</h2>\n			<h3 style="margin-left: 50px;">1.基本方式</h3>\n			<ul style="margin-left: 35px;">\n				<li>此项目建立在开源项目bootdo和若依系统基础上，点击链接加入群聊【BootDo交流二群】：<a href="https://jq.qq.com/?_wv=1027&amp;k=5M659N4">614726589</a>【若依交流二群】：1389287 感谢！</li>\n				<li>本人联系方式，QQ：<a href="https://jq.qq.com/?_wv=1027&amp;k=5M659N4">2320095772</a></li>\n				<li>邮箱，QQ邮箱：2320095772@qq.com</li>\n			</ul>\n			\n		</div>', '<p><br></p>', 0, 0, 0, '[{"title":"讲真的","author":"曾惜","url":"http://music.163.com/song/media/outer/url?id=30987293.mp3","pic":"http://p1.music.126.net/cd9tDyVMq7zzYFbkr0gZcw==/2885118513459477.jpg?param=300x300","lrc":"[by:却连一句我爱你都不能说出口]\\\\n[ti:讲真的]\\\\n[ar:曾惜]\\\\n[al:不要你为难]\\\\n[by:冰城离殇]\\\\n[00:00] 作曲 : 何诗蒙\\\\n[00:01] 作词 : 黄然\\\\n[00:18]今夜特别漫长\\\\n[00:21]有个号码一直被存放\\\\n[00:25]源自某种倔强\\\\n[00:30]不舍删去又不敢想\\\\n[00:33]明明对你念念不忘\\\\n[00:37]思前想后愈发紧张\\\\n[00:41]无法深藏\\\\n[00:43]爱没爱过想听你讲\\\\n[00:48]讲真的\\\\n[00:51]会不会是我 被鬼迷心窍了\\\\n[00:54]敷衍了太多 我怎么不难过\\\\n[00:58]要你亲口说 别只剩沉默\\\\n[01:03]或许你早就回答了我\\\\n[01:06]讲真的\\\\n[01:08]想得不可得 是最难割舍的\\\\n[01:11]各自好好过 也好过一直拖\\\\n[01:15]自作多情了 好吧我认了\\\\n[01:19]至少能换来释怀洒脱\\\\n[01:23]没丢失掉自我\\\\n[01:42]今夜特别漫长\\\\n[01:44]有个号码一直被存放\\\\n[01:49]源自某种倔强\\\\n[01:53]不舍删去又不敢想\\\\n[01:57]明明对你念念不忘\\\\n[02:01]思前想后愈发紧张\\\\n[02:05]无法深藏\\\\n[02:08]爱没爱过想听你讲\\\\n[02:13]讲真的\\\\n[02:15]会不会是我 被鬼迷心窍了\\\\n[02:19]敷衍了太多 我怎么不难过\\\\n[02:23]要你亲口说 别只剩沉默\\\\n[02:27]或许你早就回答了我\\\\n[02:30]讲真的\\\\n[02:32]想得不可得 是最难割舍的\\\\n[02:35]各自好好过 也好过一直拖\\\\n[02:40]自作多情了 好吧我认了\\\\n[02:44]至少能换来释怀洒脱\\\\n[02:47]没丢失掉自我\\\\n[03:04]讲真的\\\\n[03:05]会不会是我 被鬼迷心窍了\\\\n[03:09]敷衍了太多 我怎么不难过\\\\n[03:14]要你亲口说 别只剩沉默\\\\n[03:18]或许你早就回答了我\\\\n[03:21]讲真的\\\\n[03:22]想得不可得 是最难割舍的\\\\n[03:26]各自好好过 也好过一直拖\\\\n[03:30]自作多情了 好吧我认了\\\\n[03:35]至少能换来释怀洒脱\\\\n[03:38]没丢失掉自我\\\\n"},{"title":"学猫叫","author":"小潘潘","url":"http://music.163.com/song/media/outer/url?id=554191055.mp3","pic":"http://p1.music.126.net/D1Ov-XMAwUzsr16mQk95fA==/109951163256119128.jpg?param=300x300","lrc":"[00:00.00] 作曲 : 小峰峰[00:01.00] 作词 : 小峰峰[00:05.03]编曲：吕宏斌&塞米七[00:05.28]和声：小峰峰[00:05.45]混音：陈秋洁[00:05.63]制作人：小峰峰[00:05.85]唱片：麦袭时代[00:06.40]OP：百纳娱乐[00:06.93][00:07.96]小潘潘：[00:08.31]我们一起学猫叫[00:10.58]一起喵喵喵喵喵[00:12.60]在你面前撒个娇[00:14.71]哎呦喵喵喵喵喵[00:16.77]我的心脏砰砰跳[00:18.85]迷恋上你的坏笑[00:21.31]你不说爱我我就喵喵喵[00:24.10][00:24.75]小峰峰：[00:26.17]每天都需要你的拥抱[00:29.08]珍惜在一起的每分每秒[00:33.35]你对我多重要[00:35.21]我想你比我更知道[00:38.00]你就是我的女主角[00:41.34][00:41.80]小潘潘：[00:42.80]有时候我懒的像只猫[00:45.69]脾气不好时又张牙舞爪[00:50.10]你总是温柔的[00:51.96]能把我的心融化掉[00:54.65]我想要当你的小猫猫[00:59.93][01:00.38]合：[01:00.70]我们一起学猫叫[01:02.69]一起喵喵喵喵喵[01:04.72]在你面前撒个娇[01:06.81]哎呦喵喵喵喵喵[01:08.82]我的心脏砰砰跳[01:10.79]迷恋上你的坏笑[01:13.42]你不说爱我我就喵喵喵[01:16.86][01:17.23]我们一起学猫叫[01:19.30]一起喵喵喵喵喵[01:21.45]我要穿你的外套[01:23.55]闻你身上的味道[01:25.62]想要变成你的猫[01:27.68]赖在你怀里睡着[01:30.17]每天都贪恋着你的好[01:33.85][01:50.67]小潘潘：[01:51.73]有时候我懒的像只猫[01:54.62]脾气不好时又张牙舞爪[01:58.95]你总是温柔的[02:01.07]能把我的心融化掉[02:03.62]我想要当你的小猫猫[02:07.97][02:09.19]合：[02:09.49]我们一起学猫叫[02:11.49]一起喵喵喵喵喵[02:13.55]在你面前撒个娇[02:15.55]哎呦喵喵喵喵喵[02:17.72]我的心脏砰砰跳[02:19.77]迷恋上你的坏笑[02:22.28]你不说爱我我就喵喵喵[02:26.01][02:26.21]我们一起学猫叫[02:28.30]一起喵喵喵喵喵[02:30.30]我要穿你的外套[02:32.38]闻你身上的味道[02:34.58]想要变成你的猫[02:36.56]赖在你怀里睡着[02:39.02]每天都贪恋着你的好[02:42.40][02:42.85]我们一起学猫叫[02:44.84]一起喵喵喵喵喵[02:46.89]在你面前撒个娇[02:49.02]哎呦喵喵喵喵喵[02:51.14]我的心脏砰砰跳[02:53.32]迷恋上你的坏笑[02:55.75]你不说爱我我就喵喵喵[02:59.12][02:59.47]我们一起学猫叫[03:01.59]一起喵喵喵喵喵[03:03.66]我要穿你的外套[03:05.82]闻你身上的味道[03:07.88]想要变成你的猫[03:09.98]赖在你怀里睡着[03:12.37]每天都贪恋着你的好"},{"title":"莎啦啦","author":"蒋雪璇","url":"http://music.163.com/song/media/outer/url?id=537510674.mp3","pic":"http://p1.music.126.net/t633x_KG8Zcd6SNf7xZdYA==/109951163142569560.jpg?param=300x300","lrc":"[00:00.00] 作曲 : 蒋雪璇[00:01.00] 作词 : 蒋雪璇[00:04.43]编曲：伍华/江潮[00:05.34]录音：Ethan/付威[00:06.30]混音：Ethan[00:07.23]和声：常玮[00:08.08]制作人：伍华[00:08.97]监制：潇喆Sean[00:09.89]OP：腾研国际[00:11.30]夕阳西下 蝴蝶回家[00:16.24]落叶惊风 缠绵飘荡[00:21.09]黑幕拉下 光阴睡下[00:26.21]你要去哪 带上我吧吧吧吧吧[00:32.14]你说希望陪我到老[00:34.57]就算撒娇变成唠叨[00:37.09]就算无法轻盈舞蹈[00:39.60]爱的小船也不会抛锚[00:41.89]你说我是你命中的妖[00:44.45]才会让你神魂颠倒[00:46.86]你要和我唱一曲歌谣[00:49.32]忘记糟糕忘掉烦恼[00:54.43]wosha shalala la[00:56.89]wosha shalala[00:59.34]wosha shalala la[01:01.89]wosha shalala[01:04.32]wosha shalala la[01:06.72]wosha shalala[01:09.15]wosha shalala la[01:11.71]wosha shalala la la[01:35.48]咖啡奶茶 多味情话[01:40.42]淡淡眼妆 相思相望[01:45.39]心事绵长 指尖微凉[01:50.39]把我送送送送给你啦[01:56.20]我们一起去无人小岛[01:58.69]像退江湖般的逍遥[02:01.16]养个猫猫 种个花草[02:03.25]有你在就不觉得无聊[02:06.07]一起吃早餐吃到夜宵[02:08.64]你身强体壮我心灵手巧[02:11.18]管那野兽卖弄风骚[02:13.50]不用担心你被她带跑[02:16.02]wosha shalala la[02:18.52]wosha shalala[02:21.03]wosha shalala la[02:23.51]wosha shalala[02:25.92]wosha shalala la[02:28.38]wosha shalala[02:30.94]wosha shalala la[02:33.35]wosha shalala[02:35.77]wosha shalala la[02:38.32]wosha shalala[02:40.80]wosha shalala la[02:43.26]wosha shalala[02:45.69]wosha shalala la[02:48.17]wosha shalala[02:50.61]wosha shalala la[02:53.11]wosha shalala la la[02:57.39]"},{"title":"That Girl","author":"Olly Murs","url":"http://music.163.com/song/media/outer/url?id=440208476.mp3","pic":"http://p1.music.126.net/_dPhSlbDz23MjXUEYeBGRw==/18820340533734696.jpg?param=300x300","lrc":"[by:刺客辣条之法与鲨][00:00.00]There\'s a girl but I let her get away[00:05.40]It\'s all my fault cause pride got in the way[00:11.40]And I\'d be lying if I said I was ok[00:16.00]About that girl the one I let get away[00:21.00]I keep saying no[00:23.00]This can\'t be the way we\'re supposed to be[00:26.00]I keep saying no[00:29.00]There\'s gotta be a way to get you close to me[00:31.00]Now I know you gotta[00:33.490]Speak up if you want somebody[00:36.490]Can\'t let him get away, oh no[00:38.490]You don\'t wanna end up sorry[00:41.490]The way that I\'m feeling everyday[00:43.490](Don\'t you know)[00:44.00]No no no no[00:46.490]There\'s no home for the broken heart[00:50.490](Don\'t you know)[00:50.00]No no no no[00:52.490]There\'s no home for the broken[00:53.490]There\'s a girl but I let her get away[00:59.490]It\'s my fault cause I said I needed space[01:04.490]I\'ve been torturing myself night and day[01:10.490]About that girl, the one I let get away[01:15.490]I keep saying no[01:17.490]This can\'t be the way it was supposed to be[01:20.490]I keep saying no[01:23.490]There\'s gotta be a way to get you[01:24.490]There\'s gotta be a way to get you[01:25.490]Close to me[00:26.490]You gotta[01:27.490]Speak up if you want somebody[01:30.490]Can\'t let him get away, oh no[01:32.490]You don\'t wanna end up sorry[01:35.490]The way that I\'m feeling everyday[01:37.490](Don\'t you know)[01:38.490]No no no no[01:40.490]There\'s no home for the broken heart[01:42.490](Don\'t you know)[01:43.490]No no no no[01:45.490]There\'s no home for the broken[01:48.490]No home for me[01:51.490]No home cause I\'m broken[01:53.490]No room to breathe[01:55.490]And I got no one to bla-ame[01:59.490]No home for me[02:02.490]No home cause I\'m broken[02:03.490]About that girl[02:05.490]The one I let get away[02:09.490]So you better[02:10.490]Speak up if you want somebody[02:13.490]You can\'t let him get away oh no[02:16.490]You dont wanna end up sorry[02:18.490]The way that I\'m feeling everyday[02:20.490](Don\'t you know)[02:21.490]No no no no[02:23.490]There\'s no home for the broken heart[02:26.00](Don\'t you know)[02:26.490]No no no no[02:29.00]There\'s no home for the broken[02:31.490]Oh[02:32.490]You don\'t wanna lose at love[02:34.490]It\'s only gonna hurt too much[02:37.00]I\'m telling you[02:37.490]You don\'t wanna lose at love[02:40.00]It\'s only gonna hurt too much[02:42.490]I\'m telling you[02:43.490]You don\'t wanna lose at love[02:45.490]Cause There\'s no home for the broken heart[02:47.490]About that girl[02:49.490]The one I let get away"},{"title":"云烟成雨","author":"房东的猫","url":"http://music.163.com/song/media/outer/url?id=513360721.mp3","pic":"http://p1.music.126.net/DSTg1dR7yKsyGq4IK3NL8A==/109951163046050093.jpg?param=300x300","lrc":null},{"title":"给陌生的你听 ","author":"G.G(张思源)","url":"http://music.163.com/song/media/outer/url?id=562594322.mp3","pic":"http://p1.music.126.net/LMPuItVrjn1Vi5c8vZZ90Q==/109951163309729098.jpg?param=300x300","lrc":null},{"title":"喜欢","author":"阿肆","url":"http://music.163.com/song/media/outer/url?id=526464145.mp3","pic":"http://p1.music.126.net/BA0bFrD0cK4YDSYublCThA==/109951163093942268.jpg?param=300x300","lrc":null},{"title":"爱你","author":"陈芳语","url":"http://music.163.com/song/media/outer/url?id=22852057.mp3","pic":"http://p1.music.126.net/0Xvz_4oS4YLCvWtQcXU05Q==/17867063951755098.jpg?param=300x300","lrc":null},{"title":"后来的我们","author":"五月天","url":"http://music.163.com/song/media/outer/url?id=553310243.mp3","pic":"http://p1.music.126.net/s6bXQX0M-H9EoeqGfr4wrg==/109951163250238942.jpg?param=300x300","lrc":null},{"title":"后来","author":"刘若英","url":"http://music.163.com/song/media/outer/url?id=254574.mp3","pic":"http://p1.music.126.net/eBF7bHnJYBUfOFrJ_7SUfw==/109951163351825356.jpg?param=300x300","lrc":null},{"title":"我们不一样","author":"大壮","url":"http://music.163.com/song/media/outer/url?id=482395261.mp3","pic":"http://p1.music.126.net/e8rrwkOED4RbeaKuaVOcJA==/18997361904874206.jpg?param=300x300","lrc":null},{"title":"水手","author":"郑智化","url":"http://music.163.com/song/media/outer/url?id=190381.mp3","pic":"http://p1.music.126.net/_pXP5r15lQW2iRhucclG9w==/52776558150323.jpg?param=300x300","lrc":null},{"title":"海阔天空","author":"Beyond","url":"http://music.163.com/song/media/outer/url?id=400162138.mp3","pic":"http://p1.music.126.net/a9oLdcFPhqQyuouJzG2mAQ==/3273246124149810.jpg?param=300x300","lrc":null},{"title":"思君黯然","author":"电视剧《天龙八部》插曲","url":"http://music.163.com/song/media/outer/url?id=27927021.mp3","pic":"http://p1.music.126.net/eZ5I2GSgKeKQR7jWpFZFiA==/3386495814252023.jpg?param=300x300","lrc":null},{"title":"不仅仅是喜欢","author":"青柠","url":"http://music.163.com/song/media/outer/url?id=563069979.mp3","pic":"http://p1.music.126.net/f4-ZyLjp50S2R3rG09w0-g==/109951163302845405.jpg?param=300x300","lrc":null},{"title":"Despacito (Remix)","author":"Luis Fonsi / Daddy Yankee / Justin Bieber","url":"http://music.163.com/song/media/outer/url?id=472361096.mp3","pic":"http://p1.music.126.net/vA4UF75gS1Qpyx07B0acrw==/18521273371761277.jpg?param=300x300","lrc":null},{"title":"Brother Louie","author":"Modern Talking","url":"http://music.163.com/song/media/outer/url?id=4175444.mp3","pic":"http://p1.music.126.net/l8KFEReYE5VPF8iohanhcg==/1777910302123477.jpg?param=300x300","lrc":null},{"title":"Time","author":"MKJ","url":"http://music.163.com/song/media/outer/url?id=33035611.mp3","pic":"http://p1.music.126.net/c7vJlx2v-J4gIk67zs2ZDw==/7941772488435204.jpg?param=300x300","lrc":null},{"title":"いつも何度でも","author":"宗次郎","url":"http://music.163.com/song/media/outer/url?id=480353.mp3","pic":"http://p1.music.126.net/ygxAeYxxXPONww041tylMw==/5996736418028563.jpg?param=300x300","lrc":null},{"title":"故乡的原风景","author":"宗次郎","url":"http://music.163.com/song/media/outer/url?id=393685.mp3","pic":"http://p1.music.126.net/qHKvdeYzTqIOxcGKnrfaPQ==/72567767449767.jpg?param=300x300","lrc":null},{"title":"爱的回归线","author":"陈韵若 / 陈每文","url":"http://music.163.com/song/media/outer/url?id=25639007.mp3","pic":"http://p1.music.126.net/CrPfLVU881-kSrab_HxuoA==/644313813916636.jpg?param=300x300","lrc":null},{"title":"Cry On My Shoulder","author":"Deutschland sucht den Superstar / Various Artists","url":"http://music.163.com/song/media/outer/url?id=17194024.mp3","pic":"http://p1.music.126.net/_1SSamf87l4mo77TZiWCWQ==/576144092962639.jpg?param=300x300","lrc":null},{"title":"小幸运","author":"田馥甄","url":"http://music.163.com/song/media/outer/url?id=33206214.mp3","pic":"http://p1.music.126.net/7Y4fr1KatzK2xELl_wnkHw==/109951163281534779.jpg?param=300x300","lrc":null},{"title":"刚好遇见你","author":"李玉刚","url":"http://music.163.com/song/media/outer/url?id=439915614.mp3","pic":"http://p1.music.126.net/lDyytkTaPYVTb1Vpide6AA==/18591642115187138.jpg?param=300x300","lrc":null},{"title":"好春光","author":"吴彤","url":"http://music.163.com/song/media/outer/url?id=27562927.mp3","pic":"http://p1.music.126.net/f72rHrToCES-nccfJqGtYA==/5737251673804479.jpg?param=300x300","lrc":null},{"title":"梦醒时分","author":"伍佰","url":"http://music.163.com/song/media/outer/url?id=156284.mp3","pic":"http://p1.music.126.net/L570AKxOSH6U4vEIMoHGXQ==/45079976751506.jpg?param=300x300","lrc":null},{"title":"Reality","author":"Richard Sanderson","url":"http://music.163.com/song/media/outer/url?id=1921734.mp3","pic":"http://p1.music.126.net/-qwHJ415WkbhIRlqJpwWpQ==/1765815674209004.jpg?param=300x300","lrc":null},{"title":"壮志在我胸","author":"成龙","url":"http://music.163.com/song/media/outer/url?id=64392.mp3","pic":"http://p1.music.126.net/gmjxNbZgGejTwDLSatYD-w==/645413325516792.jpg?param=300x300","lrc":null},{"title":"向天再借五百年","author":"韩磊","url":"http://music.163.com/song/media/outer/url?id=93666.mp3","pic":"http://p1.music.126.net/MsjB1mwEjSzidqcesbwz3w==/591537255755598.jpg?param=300x300","lrc":null},{"title":"大男人","author":"腾格尔","url":"http://music.163.com/song/media/outer/url?id=28406582.mp3","pic":"http://p1.music.126.net/Nl0RTYfKGynZsS89SKpjdQ==/3385396303311359.jpg?param=300x300","lrc":null},{"title":"我欲成仙","author":"刘欢","url":"http://music.163.com/song/media/outer/url?id=145982.mp3","pic":"http://p1.music.126.net/TJAyXjjIG--gMPEGOpLn2Q==/129742372078414.jpg?param=300x300","lrc":null},{"title":"天地孤影任我行","author":"陈勋奇","url":"http://music.163.com/song/media/outer/url?id=393697.mp3","pic":"http://p1.music.126.net/qHKvdeYzTqIOxcGKnrfaPQ==/72567767449767.jpg?param=300x300","lrc":null},{"title":"永远永远","author":"李翊君","url":"http://music.163.com/song/media/outer/url?id=258134.mp3","pic":"http://p1.music.126.net/7cXnZIDy5zhgN04oLecBPg==/109951162793114.jpg?param=300x300","lrc":null},{"title":"难念的经","author":"周华健","url":"http://music.163.com/song/media/outer/url?id=5271858.mp3","pic":"http://p1.music.126.net/n_7R-J0uWaBPBkm7aVsA_Q==/122045790701114.jpg?param=300x300","lrc":null},{"title":"倩女幽魂","author":"张国荣","url":"http://music.163.com/song/media/outer/url?id=188175.mp3","pic":"http://p1.music.126.net/cmvsHFnVKXO409hZdrbacA==/102254581395221.jpg?param=300x300","lrc":null},{"title":"男儿当自强","author":"成龙","url":"http://music.163.com/song/media/outer/url?id=32688174.mp3","pic":"http://p1.music.126.net/15IMKrk4XXVhtSavDyTRIg==/7986852464676272.jpg?param=300x300","lrc":null},{"title":"我的祖国","author":"郭兰英","url":"http://music.163.com/song/media/outer/url?id=236405.mp3","pic":"http://p1.music.126.net/LnCU0OQrDUnZ8Qq45BCPWQ==/32985348849298.jpg?param=300x300","lrc":null},{"title":"当年情","author":"张国荣","url":"http://music.163.com/song/media/outer/url?id=188451.mp3","pic":"http://p1.music.126.net/FEgl2i8gDkOdppr5Ko3kEA==/69269232562640.jpg?param=300x300","lrc":null},{"title":"只要有你","author":"那英 / 孙楠","url":"http://music.163.com/song/media/outer/url?id=4878242.mp3","pic":"http://p1.music.126.net/RaLFV45m3BjMdZ0pQIGPLg==/18890709277096465.jpg?param=300x300","lrc":null},{"title":"归去来","author":"希莉娜依 / 胡兵","url":"http://music.163.com/song/media/outer/url?id=5276250.mp3","pic":"http://p1.music.126.net/ytVaPRWaeaLtm88Wg9ysdg==/52776558150319.jpg?param=300x300","lrc":null},{"title":"六月的雨","author":"胡歌","url":"http://music.163.com/song/media/outer/url?id=92774.mp3","pic":"http://p1.music.126.net/95TcQghGMiaAl5363ZTJbA==/109951163200250165.jpg?param=300x300","lrc":null},{"title":"女儿情","author":"李玲玉","url":"http://music.163.com/song/media/outer/url?id=29775440.mp3","pic":"http://p1.music.126.net/kKhH3gKHB4AwVFrcbaU6Yg==/3275445140634067.jpg?param=300x300","lrc":null},{"title":"好久不见","author":"李小龙","url":"http://music.163.com/song/media/outer/url?id=28678042.mp3","pic":"http://p1.music.126.net/TUAISNMUjX1Dw9hptF-R2Q==/5852700394902604.jpg?param=300x300","lrc":null},{"title":"我要你","author":"任素汐","url":"http://music.163.com/song/media/outer/url?id=437292675.mp3","pic":"http://p1.music.126.net/dDV995SIeG5-IN1eYq6FOg==/3300733912593978.jpg?param=300x300","lrc":null},{"title":"英雄的黎明","author":"横山菁児","url":"http://music.163.com/song/media/outer/url?id=393705.mp3","pic":"http://p1.music.126.net/qHKvdeYzTqIOxcGKnrfaPQ==/72567767449767.jpg?param=300x300","lrc":null},{"title":"人生何处不相逢","author":"陈慧娴","url":"http://music.163.com/song/media/outer/url?id=212253.mp3","pic":"http://p1.music.126.net/SQvpqlVrUamK46F49dCJ5g==/109951163032107598.jpg?param=300x300","lrc":null},{"title":"心爱","author":"金学峰","url":"http://music.163.com/song/media/outer/url?id=166317.mp3","pic":"http://p1.music.126.net/EN2oaemrTlTvP-rlo5dP2A==/86861418607028.jpg?param=300x300","lrc":null},{"title":"Never Say Goodbye","author":"Mario / 朴素彬 / 송보람 / 고은주","url":"http://music.163.com/song/media/outer/url?id=5412258.mp3","pic":"http://p1.music.126.net/Qdy9558DfPQY58CU86NCnA==/746568395266031.jpg?param=300x300","lrc":null},{"title":"The Day You Went Away","author":"M2M","url":"http://music.163.com/song/media/outer/url?id=3026369.mp3","pic":"http://p1.music.126.net/pETQnye5ooWtzXSCC0qbeQ==/1744924953286126.jpg?param=300x300","lrc":null},{"title":"Pretty Boy","author":"M2M","url":"http://music.163.com/song/media/outer/url?id=5134011.mp3","pic":"http://p1.music.126.net/Ny5AEURZGTbeJBKNS9TflQ==/1658063534698769.jpg?param=300x300","lrc":null},{"title":"As Long as You Love Me","author":"Backstreet Boys","url":"http://music.163.com/song/media/outer/url?id=3950792.mp3","pic":"http://p1.music.126.net/P-2uAbQrgtIZfYy8HxuY2g==/19069929672343699.jpg?param=300x300","lrc":null},{"title":"Exodus","author":"Maksim Mrvica","url":"http://music.163.com/song/media/outer/url?id=1696336.mp3","pic":"http://p1.music.126.net/eNFhIgV8pF5zp5tRHSyyVg==/705886465073362.jpg?param=300x300","lrc":null},{"title":"Far Away From Home","author":"Groove Coverage","url":"http://music.163.com/song/media/outer/url?id=4083399.mp3","pic":"http://p1.music.126.net/VoSY-_z1arhvzVwyW8gClw==/6641050232567186.jpg?param=300x300","lrc":null},{"title":"She","author":"Groove Coverage","url":"http://music.163.com/song/media/outer/url?id=4083642.mp3","pic":"http://p1.music.126.net/8dnZQOUVyem-hM2SB45SQA==/768558627860128.jpg?param=300x300","lrc":null},{"title":"世界が終るまでは","author":"WANDS","url":"http://music.163.com/song/media/outer/url?id=26508150.mp3","pic":"http://p1.music.126.net/yrUkfSTai4X75Teo9pisKg==/2423323627679092.jpg?param=300x300","lrc":null},{"title":"See You Again","author":"Wiz Khalifa / Charlie Puth","url":"http://music.163.com/song/media/outer/url?id=30953009.mp3","pic":"http://p1.music.126.net/JIc9X91OSH-7fUZqVfQXAQ==/7731765766799133.jpg?param=300x300","lrc":null}]', 1, 1, 1, 0, 0, 240, 0, 0, 'superadmin', '2018-06-23 15:24:17', 'superadmin', '2018-08-07 00:06:53', ''),
	(12, '默认主题2', _binary '', NULL, 0, '<h2 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0);">&nbsp; &nbsp;一.项目介绍</h2><ul style="margin-left: 25px;"><li>此项目建立在开源项目bootdo和若依系统基础上，如有侵权请及时与我联系，其详情请见：<a href="https://gitee.com/lcg0124/bootdo.git" target="_blank">https://gitee.com/lcg0124/bootdo.git</a>，<a href="https://gitee.com/y_project/RuoYi" target="_blank">https://gitee.com/y_project/RuoYi</a></li><li>Springboot作为基础框架，使用mybatis作为持久层框架，使用官方推荐的thymeleaf做为模板引擎，shiro作为安全框架详情请见：<a href="https://github.com/search?utf8=%E2%9C%93&amp;q=springboot&amp;type=" target="_blank" style="color: rgb(119, 119, 119); outline: 0px;">https://github.com/search?utf8=%E2%9C%93&amp;q=springboot&amp;type=</a></li><li>在此基础上，添加爬虫目录，工具目录，游戏目录以及聊天系统，添加网址设置等</li><li>为什么不叫crawler而叫spider，因为喜欢Spider-Man！</li><li>此项目源码请见：<a href="https://github.com/rzspider" target="_blank">https://github.com/rzspider</a></li></ul><h2 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;二.使用方式</h2><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">1.基本功能</h3><ul style="margin-left: 35px;"><li>基本功能使用请见：<a href="https://gitee.com/lcg0124/bootdo.git" target="_blank">https://gitee.com/lcg0124/bootdo.git</a>，<a href="https://github.com/lcg0124/bootdo.git" target="_blank">https://github.com/lcg0124/bootdo.git</a></li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">2.网页爬虫</h3><ul style="margin-left: 35px;"><li>基本认知：此爬虫系统内置5个已写好爬虫，后台ID分别是10001-10005，请不要随意修改，支持语言JAVA,JAVASCRIPT,PYTHON等，可自定义，但后台安全需要另行配置</li><li>权限认知：超级管理员和管理员可以定义爬虫类型和添加编写自定义爬虫，普通用户可添加已有的爬虫管理及爬虫任务</li><li>自定义爬虫：接口已写好，源码资源文件已内置文件流的jar包和源码，以及连接数据库的jar包和源码，自定义爬虫有示例代码，后台编译运行，注意安全</li><li>爬虫任务：添加爬虫任务可修改默认参数，爬虫管理自带一个默认参数，请根据格式修改内容，可设置任务启动频次</li><li>启动任务：定时任务和固有频次任务会自动添加至任务详情并启动，只执行一次的任务需手动添加至任务详情，每次任务详情ID表示一次任务，对应启动会覆盖原有数据</li><li>导出数据：数据格式以excel为主，内置爬虫及自定义爬虫可解析则以excel输出，无法解析的则以文本格式输出，下载包括准确任务数据以及未筛选全数据，可选择下载</li><li>其他认知：内置爬虫使用htmlunit，后台ID段是10001-19999，自定义爬虫后台ID段是20001-29999</li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">3.图书管理</h3><ul style="margin-left: 35px;"><li>基本认知：此系统属个人系统，未添加借阅管理，可自行添加，支持批量上传，请下载模板以供参考，支持导出excel</li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">4.通用工具</h3><ul style="margin-left: 35px;"><li>基本认知：已内置了几个简单的工具，如截图，计算器，OCR，二维码等等，可自定义添加，需修改代码</li><li>权限认知：超级管理员和管理员可以添加工具，普通员工可添加已有工具并运行和下载</li><li>添加工具：分为网页版和客户端版工具，网页版可包含客户端，网页版可直接运行，可上传源码，安装包等，但对应文件只能一个</li><li>启用工具：工具启用都是网页版，下载的源码及安装版等则属于客户端版，但上传文件可自行添加</li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">5.简单游戏</h3><ul style="margin-left: 35px;"><li>与通用工具目录相同，使用同上</li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">6.聊天工具</h3><ul style="margin-left: 35px;"><li>基本认知：尚未完善</li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">7.配置文件</h3><ul style="margin-left: 35px;"><li>基本认知：基本配置详见bootdo和若依系统源码</li><li>添加配置：主要是文件application.yml的filepath配置</li><li>详情配置：uploadPath：上传图片文件所在位置，必填。uploadToolPath：上传工具文件所在位置，必填。 uploadGamePath：上传游戏文件所在位置。customSpiderPath：自定义爬虫文件所在位置，必填。javaCompilerPath：java编译器所在位置（tool.jar目录），选填，不填则默认系统编译器。jreRunPath：java运行环境（jre）所在位置（jre目录），选填，不填则使用系统java环境</li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">8.注意事项</h3><ul style="margin-left: 35px;"><li>配置文件不要只写盘符，尽量使用不同的文件夹，目录均不添加斜杠“/”“”</li><li>自定义爬虫是将前台书写的代码传到后台编译运行，需要自行设置服务器安全，或者修改源码</li><li>系统工具有清理缓存功能，会将配置文件下无用文件清除，因此配置文件的目录一定要慎配</li></ul><h2 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0);">&nbsp;&nbsp;&nbsp;三.联系方式</h2><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">1.基本方式</h3><ul style="margin-left: 35px;"><li>此项目建立在开源项目bootdo和若依系统基础上，点击链接加入群聊【BootDo交流二群】：<a href="https://jq.qq.com/?_wv=1027&amp;k=5M659N4">614726589</a></li><li>本人联系方式，QQ：<a href="https://jq.qq.com/?_wv=1027&amp;k=5M659N4">2320095772</a></li><li>邮箱，QQ邮箱：2320095772@qq.com</li></ul>', '', 'import java.util.List;\n\nimport javacustomspider.JavaCustomSpiderUtils;\n\n/**\n * 爬虫JAVA代码示例\n * \n * @author rico\n * @date 2018-06-04 \n * 爬虫的入口类，请勿删除或更改入口\n * 内置一个jar包，对象JavaCustomSpiderUtils提供数据库连接插入和json转换等方法\n */\npublic class MainSpider {\n	// 主方法，args的第一个参数args[0]即创建爬虫时的默认参数，格式为json\n	// 第二个参数是任务详情id taskInfoId，此参数无需设置，正式执行任务时将自动获取，只需要向数据库插入数据时指定\n	// 第三个参数是任务标志，测试环境是0，正式环境是1,2表示全部数据\n	// 第二和第三个参数可在代码中自行更改指定\n	public static void main(String[] args) {\n		// 获取参数\n		String spiderDefaultParams = args[0];\n		// 此参数不需要另行设置，插入数据库时直接使用\n		String taskInfoId = args[1];\n		int taskFlag = Integer.valueOf(args[2]);\n		// 以上三个参数均可自行指定\n		System.out.println(spiderDefaultParams);\n		System.out.println(taskInfoId);\n		System.out.println(taskFlag);\n\n		// 可解析参数为对象，数组，list，以list为示例\n		List<String> sdpList = null;\n		if (spiderDefaultParams != null && !"".equals(spiderDefaultParams)) {\n			sdpList = JavaCustomSpiderUtils.jsonStringToList(spiderDefaultParams);\n		}\n		System.out.println(sdpList);\n\n		/**\n		 * 以下逻辑使用参数或不使用参数开始爬虫主逻辑， 获取数据，目前仅限文本信息，不支持图片音频视频\n		 * \n		 */\n\n		// 假设爬取的数据转化为最简单的json，每一条json即一条数据\n		String jsonData = "{\\"name\\":\\"testspiderdata\\",\\"age\\":18,\\"address\\":\\"SuZhou\\"}";\n\n		// MySql数据库连接信息\n		String ip = "192.168.1.140";\n		String dbname = "rzspider";\n		String user = "root";\n		String password = "root";\n\n		// 实例化一个工具对象\n		JavaCustomSpiderUtils jcsu = new JavaCustomSpiderUtils(ip, dbname, user, password);\n		// 插入一条数据\n		boolean success = false;\n		for (int i = 0; i < 10; i++) {\n			success = jcsu.insertDataToMysql(taskInfoId, jsonData, taskFlag);\n			try {\n				Thread.sleep(1000);\n			} catch (InterruptedException e) {\n				e.printStackTrace();\n			}\n		}\n		System.out.println(success);\n		// 至此一个完整的Java爬虫完成，下载数据将会自动以jsonkey作为Excel字段，value作为值，\n		// 所以json的key尽量要一目了然\n	}\n}', NULL, NULL, '', '	<div style="padding: 10px 0 20px 10px;">\n			<h2>&nbsp;&nbsp;&nbsp;一.项目介绍</h2>\n			<ul style="margin-left: 25px;">\n				<li>此项目建立在开源项目bootdo和若依系统基础上，如有侵权请及时与我联系，其详情请见：<a href="https://gitee.com/lcg0124/bootdo.git" target="_blank">https://gitee.com/lcg0124/bootdo.git</a>，<a href="https://gitee.com/y_project/RuoYi" target="_blank">https://gitee.com/y_project/RuoYi</a></li>\n				<li>Springboot作为基础框架，使用mybatis作为持久层框架，使用官方推荐的thymeleaf做为模板引擎，shiro作为安全框架详情请见：<a href="https://github.com/search?utf8=%E2%9C%93&amp;q=springboot&amp;type=" target="_blank">https://github.com/search?utf8=%E2%9C%93&amp;q=springboot&amp;type=</a></li>\n				<li>在此基础上，添加爬虫目录，工具目录，游戏目录以及聊天系统，添加网址设置等</li>\n				<li>为什么不叫crawler而叫spider，因为喜欢Spider-Man！</li>\n				<li>此项目源码请见：<a href="https://github.com/rzspider" target="_blank">https://github.com/rzspider</a></li>\n			</ul>\n\n			<h2>&nbsp;&nbsp;&nbsp;二.使用方式</h2>\n			<h3 style="margin-left: 50px;">1.基本功能</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本功能使用请见：<a href="https://gitee.com/lcg0124/bootdo.git" target="_blank">https://gitee.com/lcg0124/bootdo.git</a>，<a href="https://github.com/lcg0124/bootdo.git" target="_blank">https://github.com/lcg0124/bootdo.git</a></li>\n			</ul>\n			<h3 style="margin-left: 50px;">2.网页爬虫</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：此爬虫系统内置5个已写好爬虫，后台ID分别是10001-10005，请不要随意修改，支持语言JAVA,JAVASCRIPT,PYTHON等，可自定义，但后台安全需要另行配置</li>\n				<li>权限认知：超级管理员和管理员可以定义爬虫类型和添加编写自定义爬虫，普通用户可添加已有的爬虫管理及爬虫任务</li>\n				<li>自定义爬虫：接口已写好，源码资源文件已内置文件流的jar包和源码，以及连接数据库的jar包和源码，自定义爬虫有示例代码，后台编译运行，注意安全</li>\n				<li>爬虫任务：添加爬虫任务可修改默认参数，爬虫管理自带一个默认参数，请根据格式修改内容，可设置任务启动频次</li>\n				<li>启动任务：定时任务和固有频次任务会自动添加至任务详情并启动，只执行一次的任务需设置启动时间并启用任务，每次任务详情ID表示一次任务，对应启动会覆盖原有数据</li>\n				<li>导出数据：数据格式以excel为主，内置爬虫及自定义爬虫可解析则以excel输出，无法解析的则以文本格式输出，下载包括准确任务数据以及未筛选全数据，可选择下载</li>\n				<li>其他认知：内置爬虫使用htmlunit，后台ID段是10001-19999，自定义爬虫后台ID段是20001-29999</li>\n			</ul>\n			<h3 style="margin-left: 50px;">3.图书管理</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：此系统属个人系统，未添加借阅管理，可自行添加，支持批量上传，请下载模板以供参考，支持导出excel</li>\n			</ul>\n			<h3 style="margin-left: 50px;">4.通用工具</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：已内置了几个简单的工具，如二维码生成，解析，计算器，OCR，文本格式化，代码格式化等等，可自定义添加，需修改代码</li>\n				<li>权限认知：超级管理员和管理员可以添加工具，普通员工可添加已有工具并运行和下载</li>\n				<li>添加工具：分为网页版和客户端版工具，网页版可包含客户端，网页版可直接运行，可上传源码，安装包等，但对应文件只能一个</li>\n				<li>启用工具：工具启用都是网页版，下载的源码及安装版等则属于客户端版，但上传文件可自行添加</li>\n			</ul>\n			<h3 style="margin-left: 50px;">5.简单游戏</h3>\n			<ul style="margin-left: 35px;">\n				<li>与通用工具目录相同，使用同上</li>\n			</ul>\n			<h3 style="margin-left: 50px;">6.聊天工具</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：尚未完善</li>\n			</ul>\n			<h3 style="margin-left: 50px;">7.配置文件</h3>\n			<ul style="margin-left: 35px;">\n				<li>基本认知：基本配置详见bootdo和若依系统源码</li>\n				<li>添加配置：主要是文件application.yml的filepath配置</li>\n				<li>详情配置：uploadPath：上传图片文件所在位置，必填。uploadCachePath：缓存文件夹，必填。uploadToolPath：上传工具文件所在位置，必填。\n					uploadGamePath：上传游戏文件所在位置。customSpiderPath：自定义爬虫文件所在位置，必填。javaCompilerPath：java编译器所在位置（tool.jar目录），选填，不填则默认系统编译器。jreRunPath：java运行环境（jre）所在位置（jre目录），选填，不填则使用系统java环境。后期将简化配置，使用默认文件夹</li></ul><h3 style="font-family: &quot;Helvetica Neue&quot;, Helvetica, &quot;PingFang SC&quot;, 微软雅黑, Tahoma, Arial, sans-serif; color: rgb(0, 0, 0); margin-left: 50px;">8.基础设置</h3><ul style="margin-left: 35px;"><li>基础设置即主题设置，包括登录背景设置，首页介绍，代码包名前缀，示例代码，手册，音乐插件设置等等</li><li>登录背景可设置内置特效，首页介绍即首页显示内容，代码包名前缀即自定义爬虫代码包名，示例代码即创建自定义爬虫时的默认代码，手册即介绍，音乐插件使用zplayer，鸣谢！</li><li>系统工具有清理缓存功能，会将配置文件下无用文件清除，数据库中自定义爬虫测试数据清除等等</li></ul><ul style="margin-left: 35px;">\n			</ul>\n			<h3 style="margin-left: 50px;">9.注意事项</h3>\n			<ul style="margin-left: 35px;">\n				<li>配置文件不要只写盘符，尽量使用不同的文件夹，目录均不添加斜杠“/”“”</li>\n				<li>自定义爬虫是将前台书写的代码传到后台编译运行，需要自行设置服务器安全，或者修改源码</li>\n				<li>系统工具有清理缓存功能，会将配置文件下无用文件清除，因此配置文件的目录一定要慎配</li>\n			</ul>\n\n			<h2>&nbsp;&nbsp;&nbsp;三.联系方式</h2>\n			<h3 style="margin-left: 50px;">1.基本方式</h3>\n			<ul style="margin-left: 35px;">\n				<li>此项目建立在开源项目bootdo和若依系统基础上，点击链接加入群聊【BootDo交流二群】：<a href="https://jq.qq.com/?_wv=1027&amp;k=5M659N4">614726589</a>【若依交流二群】：1389287 感谢！</li>\n				<li>本人联系方式，QQ：<a href="https://jq.qq.com/?_wv=1027&amp;k=5M659N4">2320095772</a></li>\n				<li>邮箱，QQ邮箱：2320095772@qq.com</li>\n			</ul>\n			\n		</div>', NULL, 0, 0, 1, NULL, 1, 1, 1, 0, 0, 250, 0, 1, 'superadmin', '2018-06-29 22:13:02', 'superadmin', '2018-08-07 00:06:41', '');
/*!40000 ALTER TABLE `tool_baseset` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
