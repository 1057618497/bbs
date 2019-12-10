import org.junit.runner.RunWith;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.transaction.annotation.Transactional;

/*
 * spring整合Junit4单元测试基类，
 * 其他类实现该类可以省略一些注解配置。
 * */
//使用junit4进行单元测试
@SuppressWarnings("deprecation")
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath*:applicationContext*.xml", "classpath*:spring/spring-mvc.xml" })
//当然 你可以声明一个事务管理 每个单元测试都进行事务回滚 无论成功与否
@Rollback(value=true)
@Transactional(transactionManager = "transactionManager")
//加载配置文件,这里写你自己的spring配置文件的存放目录
public class BaseJunit4Test {
    //进行测试时，将测试类继承该类
    //注入service对象
    //然后在方法上使用@Test，@RollBack，@Transaction等注解单独修饰
}