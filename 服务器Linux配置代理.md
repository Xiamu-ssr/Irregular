# 一、安装软件
首先安装Clash，Linux无GUI直接下载Clash-core就行

> 注意：Clash于2023-11-02左右进行了删库，将不再维护此软件。

在github上搜索后找到符合自己机器架构的版本，下载下来即可，里面就一个文件，把它传到服务器上。

[clash-core Github搜索链接](https://github.com/search?q=clash-core&type=repositories)

博主这里用的是amd64

![在这里插入图片描述](https://img-blog.csdnimg.cn/ab70f3da931c44c19a81accb01060d6c.png)

# 二、运行Clash
文件传到服务器后，重命名为clash

然后`chmod 777 clash`权限全开

然后`./clash`直接运行，会显示如下提示，

```html
INFO[0000] Can't find config, create a initial config file 
INFO[0000] Can't find MMDB, start download
FATA[0030] Initial configuration directory error: can't initial MMDB: can't download MMDB: Get "https://cdn.jsdelivr.net/gh/Dreamacro/maxmind-geoip@release/Country.mmdb": dial tcp 93.46.8.90:443: i/o timeout
```
但是作者已经删库了，所以`Country.mmdb`需要自己去网上找备份。

[这里提供一份目前(2023-11-12)还能使用的备份](https://github.com/SukkaW/Koolshare-Clash/blob/master/koolclash/koolclash/config/Country.mmdb)

`Country.mmdb`下载后，创建`~/config/clash`文件夹，把`Country.mmdb`移入其中

然后再在其中创建`config.yaml`文件，这个文件存放的就是配置文件。

如果恰好你的windows电脑有`Clash for Windows`软件，那么如下图点击Edit，将内容复制到`config.yaml`即可

![在这里插入图片描述](https://img-blog.csdnimg.cn/66c70dd1b5874aa9aed36db937e1bdad.png)

`config.yaml`中可以设置代理端口，偷懒的话就`mixed-port`把所有模式都设置在同一个端口。

![在这里插入图片描述](https://img-blog.csdnimg.cn/9850350c33134f82b5c8cd4ca3b31ff3.png)

然后在回去在命令行中执行`./clash`即可，代理程序算是跑起来了。

# 三、使用代理
使用代理的方法各种各样，但是不变的是代理的地址就是`127.0.0.1:7890`。

其中包括全局代理，或者单次命令代理。

### 1. 全局代理
全局代理就在环境变量中设置代理信息，网上有很多博客，最常见的就是将代理信息写到~/.bashrc中，一登录就加载环境，等等，不展开描述。

[这里给出一篇相关博客](https://zhuanlan.zhihu.com/p/46973701)

### 2.Proxychains4单条命令代理
安装Proxychains4，可以用包管理器安装或者从github上下载源码编译安装都可以，具体网上有很多教程。

安装好后，把`proxychains4`这个可执行文件加载到环境变量中，或者用绝对路径去运行它，同时用-f 去指定配置文件位置，配置文件名为`proxychains4.conf`，具体端口设置在文件最下面，例子如图，意思是让被代理的命令流量走`127.0.0.1:7890`，而这个端口正好有clash程序在监听，所以流量就进入clash，然后由clash进行流量代理。

![在这里插入图片描述](https://img-blog.csdnimg.cn/0255c7019f4a4939831fc377f81ac9f8.png)

一个运行命令例子如下

在一个终端中开启clash程序

```bash
./clash
```
在另一个终端运行命令
```bash
proxychains4 -f /etc/proxychains4.conf curl -v www.google.com
```
