# Open-Falcon Docker Demo

## 部署
* **请只在测试环境使用此 Demo**
* 拉取镜像

```
docker pull frostynova/open-falcon-docker
```
* 使用仓库中的 `run.sh` 运行镜像
* 修改 `/data/open-falcon/conf` 中的配置文件：
	* `portal.py` 替换 `UIC_ADDRESS` 的 `external` 部分为 Host IP
	* `fe.cfg` 替换如下部分 IP 为 Host IP	
	
```
    "shortcut": {
        "falconPortal": "http://127.0.0.1:5050/",
        "falconDashboard": "http://127.0.0.1:8081/",
        "falconAlarm": "http://127.0.0.1:6060/"
    }
```

* 重启修改了配置的组件：

```
docker exec frostynova/open-falcon-docker supervisorctl restart fe
docker exec frostynova/open-falcon-docker supervisorctl restart portal
```	

* 访问 Host IP 的 8080 端口即可
* 使用 `http://hostip:8080/root?password=abc` 将 `root` 密码重置为 `abc`
* 在需要监控的主机部署 [agent](https://github.com/open-falcon/doc/wiki/Install-Graph-components#agent)，修改其配置文件：
	* `transfer` 的 `enabled` 设为 `true`，`addr` 修改为：`Host IP:8433`
	* `heartbeat` 的  `enabled` 设为 `true`，`addr` 修改为：`Host IP:6030`
* 启动 `agent`

## 注意

* 为了便于部署，除了 `agent` 其他组件都放在了一起，由 `supervisord` 控制，牺牲了 HA 和扩展性
* `volume` 了四个目录，分别是：
	* 所有配置文件：`/data/open-falcon/conf`
    * 监控数据文件：`/data/open-falcon/data`
    * 数据库文件：`/data/open-falcon/mysql`
    * 所有日志文件：`/data/open-falcon/logs`
* 未做细致的清理工作，镜像大小接近 `1G`
* 本地 Build 请使用 `local` 分支