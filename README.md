# RZSpider2.0
## 一.项目介绍
此项目建立在开源项目bootdo和若依系统基础上，如有侵权请及时与我联系，其详情请见：https://gitee.com/lcg0124/bootdo.git，https://gitee.com/y_project/RuoYi  
Springboot作为基础框架，使用mybatis作为持久层框架，使用官方推荐的thymeleaf做为模板引擎，shiro作为安全框架详情请见：https://github.com/search?utf8=%E2%9C%93&q=springboot&type=  
在此基础上，添加爬虫目录，工具目录，游戏目录以及聊天系统，添加网址设置等  
为什么不叫crawler而叫spider，因为喜欢Spider-Man！  
此项目源码请见：https://github.com/rzspider/RZSpider2.0/  
## 二.使用方式
### 1.基本功能
基本功能使用请见：https://gitee.com/lcg0124/bootdo.git，https://github.com/lcg0124/bootdo.git
### 2.网页爬虫
基本认知：此爬虫系统内置5个已写好爬虫，后台ID分别是10001-10005，请不要随意修改，支持语言JAVA,JAVASCRIPT,PYTHON等，可自定义，但后台安全需要另行配置  
权限认知：超级管理员和管理员可以定义爬虫类型和添加编写自定义爬虫，普通用户可添加已有的爬虫管理及爬虫任务  
自定义爬虫：接口已写好，源码资源文件已内置文件流的jar包和源码，以及连接数据库的jar包和源码，自定义爬虫有示例代码，后台编译运行，注意安全  
爬虫任务：添加爬虫任务可修改默认参数，爬虫管理自带一个默认参数，请根据格式修改内容，可设置任务启动频次  
启动任务：定时任务和固有频次任务会自动添加至任务详情并启动，只执行一次的任务需设置启动时间并启用任务，每次任务详情ID表示一次任务，对应启动会覆盖原有数据  
导出数据：数据格式以excel为主，内置爬虫及自定义爬虫可解析则以excel输出，无法解析的则以文本格式输出，下载包括准确任务数据以及未筛选全数据，可选择下载  
其他认知：内置爬虫使用htmlunit，后台ID段是10001-19999，自定义爬虫后台ID段是20001-29999  
### 3.图书管理
基本认知：此系统属个人系统，未添加借阅管理，可自行添加，支持批量上传，请下载模板以供参考，支持导出excel
### 4.通用工具
基本认知：已内置了几个简单的工具，如二维码生成，解析，计算器，OCR，文本格式化，代码格式化等等，可自定义添加，需修改代码  
权限认知：超级管理员和管理员可以添加工具，普通员工可添加已有工具并运行和下载  
添加工具：分为网页版和客户端版工具，网页版可包含客户端，网页版可直接运行，可上传源码，安装包等，但对应文件只能一个  
启用工具：工具启用都是网页版，下载的源码及安装版等则属于客户端版，但上传文件可自行添加  
### 5.简单游戏
与通用工具目录相同，使用同上
### 6.聊天工具
基本认知：尚未完善
### 7.配置文件
基本认知：基本配置详见bootdo和若依系统源码  
添加配置：主要是文件application.yml的filepath配置  
详情配置：uploadPath：上传图片文件所在位置，必填。uploadCachePath：缓存文件夹，必填。uploadToolPath：上传工具文件所在位置，必填。 uploadGamePath：上传游戏文件所在位置。customSpiderPath：自定义爬虫文件所在位置，必填。javaCompilerPath：java编译器所在位置（tool.jar目录），选填，不填则默认系统编译器。jreRunPath：java运行环境（jre）所在位置（jre目录），选填，不填则使用系统java环境。后期将简化配置，使用默认文件夹  
### 8.基础设置
基础设置即主题设置，包括登录背景设置，首页介绍，代码包名前缀，示例代码，手册，音乐插件设置等等  
登录背景可设置内置特效，首页介绍即首页显示内容，代码包名前缀即自定义爬虫代码包名，示例代码即创建自定义爬虫时的默认代码，手册即介绍，音乐插件使用zplayer，鸣谢！  
系统工具有清理缓存功能，会将配置文件下无用文件清除，数据库中自定义爬虫测试数据清除等等  
### 9.注意事项
配置文件不要只写盘符，尽量使用不同的文件夹，目录均不添加斜杠“/”“”  
自定义爬虫是将前台书写的代码传到后台编译运行，需要自行设置服务器安全，或者修改源码  
系统工具有清理缓存功能，会将配置文件下无用文件清除，因此配置文件的目录一定要慎配  
## 三.联系方式
### 1.基本方式
此项目建立在开源项目bootdo和若依系统基础上，点击链接加入群聊【BootDo交流二群】：614726589【若依交流二群】：1389287 感谢！
本人联系方式，QQ：2320095772
邮箱，QQ邮箱：2320095772@qq.com
## 四.项目截图
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120334.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120414.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120451.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120507.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120601.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120611.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120629.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120638.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120651.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120707.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809120732.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809121526.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809121547.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809121609.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809121653.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809121735.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809121823.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809121844.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809121956.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809122045.png) 
![](https://github.com/ricozhou/RZSpider2.0/raw/master/RZSpider2.0/image/20180809122145.png) 
