# 1
mkdir ~/clash; cd ~/clash;
wget "https://9d18r.big-files.make-w0rld-static.club:8000/file/ikuuu-static-release/clash-linux/clash-linux-1.0.1/clash-linux-amd64.gz" -O clash-linux-amd64.gz;
gzip -d clash-linux-amd64.gz;
mv clash-linux-amd64 clash;
chmod +x clash;
# 2
wget -O config.yaml "https://pllzv.no-mad-world.club/link/aKVdo3SGeAw6gjWa?clash=3";


# 3
cd ~/clash
wget https://github.com/haishanh/yacd/archive/gh-pages.zip
unzip gh-pages.zip
mv yacd-gh-pages clash-ui

# 4
# 将以下配置放入clash的config.yaml
# external-controller: 0.0.0.0:9090
# external-ui: /home/admin/clash/clash-ui /绝对/路径/或/相对/路径
#
