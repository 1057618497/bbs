import com.sun.java.browser.plugin2.liveconnect.v1.BridgeFactory;
import org.springframework.beans.factory.annotation.Autowired;
import service.AccountService;
import test.Account;
import vo.*;
import daoiml.*;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.text.SimpleDateFormat;
import  java.util.*;
import java.util.List;

public class TestITopicDao extends BaseJunit4Test {
    @Autowired
    private AccountService accountService;

    //template
//    ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
//    SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");
//    SqlSession sqlSession = factory.openSession();
//        try {
//        // 操作CRUD，第一个参数：指定statement，规则：命名空间+“.”+statementId
//        // 第二个参数：指定传入sql的参数：这里是用户id
//        String time = sqlSession.selectOne("dao.ITopicDao.test", 1);
//        System.out.println(time);
//    } finally {
//        sqlSession.close();
//    }
    @Test
    public void getList() {
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
    SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");
    SqlSession sqlSession = factory.openSession();
    HomePage hp=new HomePage();
    hp.settType(0);
    hp.setNow(0);
    hp.setsType(0);
    hp.setStart(10);
    hp.setEnd(20);
    hp.setSortType(hp.getTag()[hp.getsType()]);
        List<Object> list;
        try {
        // 操作CRUD，第一个参数：指定statement，规则：命名空间+“.”+statementId
        // 第二个参数：指定传入sql的参数：这里是用户id
            list = sqlSession.selectList("dao.ITopicDao.selectList0",hp);
    } finally {
        sqlSession.close();
    }
        for(int i=hp.getStart();i<list.size();i++){
            BriefTopic v=(BriefTopic)list.get(i);
            System.out.println(v.toString());
        }

    }

    @Test
    public void getTop(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
    SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");
    SqlSession sqlSession = factory.openSession();
    List<Object> list;
        ArrayList<BriefTopic>lists;
        try {
        // 操作CRUD，第一个参数：指定statement，规则：命名空间+“.”+statementId
        // 第二个参数：指定传入sql的参数：这里是用户id
        list = sqlSession.selectList("dao.ITopicDao.selectTopList");
        //lists=sqlSession.select("dao.ITopicDao.selectTopList");

    } finally {
        sqlSession.close();
    }
        for(int i=0;i<list.size();i++){
            BriefTopic v=(BriefTopic)list.get(i);
            System.out.println(v.toString());
        }
    }

    @Test
    public void getTotalNum(){
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
        SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");
        SqlSession sqlSession = factory.openSession();
        int n1,n2,n3;
        try {
            n1=sqlSession.selectOne("dao.ITopicDao.totalNum");
            n2=sqlSession.selectOne("dao.ITopicDao.totalNum_re",0);
            n3=sqlSession.selectOne("dao.ITopicDao.totalNum_re",1);
        } finally {
            sqlSession.close();
        }
        System.out.println(n1);
        System.out.println(n2);
        System.out.println(n3);
    }

    @Test
    public void test3(){
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddhhmmss");
        int y3=(int)(Math.random()*10);
        int y4=(int)(Math.random()*10);
        int d2=(int)(Math.random()*10);
        String s=ft.format(dNow);
        String ss=s.substring(0,2)+y3+y4+s.substring(4,8)+d2+s.substring(9);
        System.out.println("当前时间为: " + ft.format(dNow));
        System.out.println("改动时间为: " + ss);
        System.out.println(s.substring(0,2)+"   "+s.substring(4,8));
    }


    @Test
    public void testInsertTopic(){
       ApplicationContext ac = new ClassPathXmlApplicationContext("classpath*:applicationContext.xml");
        SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");



        //
        for(int i=0;i<50;i++) {

            Date dNow = new Date( );
            SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddhhmmss");
            int y3=(int)(Math.random()*10);
            int y4=(int)(Math.random()*10);
            int d2=(int)(Math.random()*10);
            String s=ft.format(dNow);
            String ss=s.substring(0,2)+y3+y4+s.substring(4,8)+d2+s.substring(9);

            SqlSession sqlSession = factory.openSession();
            //TopicDaoIml dao=new TopicDaoIml();
            //dao.setSqlSession(sqlSession);
            Topic t = new Topic();
            t.setId((int)(Math.random()*100));
            t.setTitle("测试序号"+i);
            t.setContent("这时测试");
            if(i%5==0)t.setRequire(0);
            t.setUpTime(ss);
            //dao.insertTopic(t);
            try {
                sqlSession.insert("dao.ITopicDao.insertTopic_t", t);
                sqlSession.insert("dao.ITopicDao.insertTopic_r", t);
                sqlSession.insert("dao.ITopicDao.insertTopic_info", t);

            } finally {
                sqlSession.close();
            }
            System.out.println(t.getTid());
        }
    }
    @Test
    public void test1(){
        //init
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");


        SqlSession sqlSession = factory.openSession();
        try {
            // 操作CRUD，第一个参数：指定statement，规则：命名空间+“.”+statementId
            // 第二个参数：指定传入sql的参数：这里是用户id
            String time = sqlSession.selectOne("dao.ITopicDao.test", 1);
            System.out.println(time);
        } finally {
            sqlSession.close();
        }
    }
}
