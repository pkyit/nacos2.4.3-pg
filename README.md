### 这是nacos2.4.3适配postgresql数据库
### 先得把依赖和maven插件全部安装到位不报红才行
<img width="2559" height="1341" alt="image" src="https://github.com/user-attachments/assets/f8aef39d-3fa8-4366-80a5-8004e49a5ced" />

#### 拉取源码后在项目根目录下运行：
```shell
   mvn -Prelease-nacos -Dmaven.test.skip=true -Dpmd.skip=true -Drat.skip=true -Dcheckstyle.skip=true clean install -U
```
##### docker镜像：
1、      docker pull --platform=linux/amd64 registry.aliyuncs.com/pkyit/nacos:2.4.3-pg
2、      docker pull --platform=linux/arm64 registry.aliyuncs.com/pkyit/nacos:2.4.3-pg
