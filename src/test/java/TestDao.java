/*import dao.IAccountdao;
import dao.IProfileDao;
import dao.IReplyDao;
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
public class TestDao extends BaseJunit4Test{
   @Autowired
    IAccountdao iAccountdao;
    @Autowired
    IProfileDao iProfileDao;
    @Autowired
    IReplyDao iReplyDao;
    //reply dao test
    @Test
    public void insertReply(){
        Reply reply=new Reply();
        reply.setReTime("219039348");
        reply.setTid(15);
        reply.setRidOfMan(12);
        reply.setContent("dkfjoiewtje");
        iReplyDao.insertReply(reply);
    }


    //PROFILE DAO TEST
    @Test
    public void insertProfile(){
        Profile p=new Profile();
        p.setId(101);
        p.setJob("学");
        p.setPoints(0);
        p.setNickname("happyaaa");
        //int i=iProfileDao.insertProfile(p);
<<<<<<< HEAD
       // System.out.println(p.toString()+"i="+i);
=======
        //System.out.println(p.toString()+"i="+i);
>>>>>>> 5f15f4b0649d336066de2af2d7bcac271c36e352
    }
    @Test
    public void testgetProfileBytid(){
        Profile p=iProfileDao.getProfileById(1);
        System.out.println(p);
    }



    //ACCOUTN DAO TEST
    @Test
    public void testSelectAccount(){
       // ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
        //SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");//IAccountdao iAccountdao=(IAccountdao)ac.getBean("IAccountdao");
        Account acc;
       // IAccountdao iAccountdao=(IAccountdao)ac.getBean("IAccountdao");
        acc= iAccountdao.getAccount("1000");
        System.out.println(acc.toString());
    }
    @Test
    public void testInsertsAccount(){
        // ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
        //SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");//IAccountdao iAccountdao=(IAccountdao)ac.getBean("IAccountdao");
        Account acc=new Account();
        acc.setPassword("123");
        acc.setName("hello1");
        // IAccountdao iAccountdao=(IAccountdao)ac.getBean("IAccountdao");
<<<<<<< HEAD
       // int i=iAccountdao.insertAccount(acc);
       // Account b=iAccountdao.getAccount(acc.getName());
       // System.out.println(b.toString()+"i="+i);
=======
        //int i=iAccountdao.insertAccount(acc);
        Account b=iAccountdao.getAccount(acc.getName());
        System.out.println(b.toString()+"i="+i);
>>>>>>> 5f15f4b0649d336066de2af2d7bcac271c36e352
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
*/