import dao.IAccountdao;
import dao.IProfileDao;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import service.AccountService;

import vo.*;
import daoiml.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath*:applicationContext*.xml", "classpath*:spring/spring-mvc.xml" })
public class TestAccountDao extends BaseJunit4Test{
   @Autowired
    IAccountdao iAccountdao;
    @Autowired
    IProfileDao iProfileDao;

    @Test
    public void testgetProfileBytid(){
        Profile p=iProfileDao.getProfileBytid(1);
        System.out.println(p);
    }
    @Test
    public void testSelectAccount(){
       // ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
        //SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");//IAccountdao iAccountdao=(IAccountdao)ac.getBean("IAccountdao");
        Account acc;
       // IAccountdao iAccountdao=(IAccountdao)ac.getBean("IAccountdao");
        acc= iAccountdao.getAccount("1");
        System.out.println(acc.toString());
    }
    @Test
    public void testInsertsAccount(){
        // ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
        //SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");//IAccountdao iAccountdao=(IAccountdao)ac.getBean("IAccountdao");
        Account acc=new Account();
        acc.setPassword("123");
        acc.setName("hello");
        // IAccountdao iAccountdao=(IAccountdao)ac.getBean("IAccountdao");
        iAccountdao.insertAccount(acc);
        Account b=iAccountdao.getAccount(acc.getName());
        System.out.println(b.toString());
    }

    @Test
    public void testInsertAccount() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
        SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");



        for(int i=3;i<100;i++) {
            SqlSession sqlSession = factory.openSession();
            Account acc = new Account();
            acc.setName(""+i);
            acc.setPassword(""+i);
            try {
                sqlSession.insert("dao.IAccountdao.insertAccount", acc);

            } finally {
                sqlSession.close();
            }
            System.out.println(acc.getPassword() + "    " + acc.getName());
        }
    }
}
