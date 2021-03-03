# srsServerDocker
基于 Nginx 和 docker 的 srs 直播服务器

a srs media server based on nginx and docker



运行

How to run



```bash
git clone https://github.com/picpic2013/srsServerDocker.git
cd srsServerDocker
docker build -t mysrs:v1 .
docker run -d --name srs -p 1935:1935 mysrs:v1
```



OBS 设置

OBS Settings

服务器：rtmp://`your ip`/live/

串流密钥：[your password]
