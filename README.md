# ssm-crud
一个基于ssm框架的员工管理的练习

![ssm-cruc](https://img2018.cnblogs.com/blog/1411662/201811/1411662-20181129224523844-1220616053.png)

如有需要请参考文章：[地址](https://www.cnblogs.com/famine/p/9778171.html)


### 简述：

从BootStrap构成的页面发送Ajax请求到tomcat，tomcat将请求交个对应项目。

SpringMVC的前端控制器，接受到请求判断是否能处理请求，能则调用Controller的某个方法，返回json数据，Controller调用Service层逻辑，Service通常需要调用Dao层的数据库操作，而Dao是由MyBatis逆向工程（MBG）生成和一些我们自己修改添加的Mapper接口。

Mapper的实现又是有Spring容器启动时，我们配置好的自动扫描器扫描到ioc容器中。

这使得我们可以Autowired（自动装配）Service等实例来方便的使用。

当然，还少不了Maven的项目依赖的管理。

### 难点：

1. 分页操作，初步接触，还是有一点点复杂吧。
2. 新增、修改，引入数据校验的操作（前端，后端），这是一个比较复杂的逻辑。
