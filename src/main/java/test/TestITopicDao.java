package test;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestITopicDao {
    @Test
    public void test1(){
        //init
        ApplicationContext ac = new ClassPathXmlApplicationContext("classpath:applicationContext.xml");
        SqlSessionFactory factory=(SqlSessionFactory)ac.getBean("sqlSessonFactory");


        SqlSession sqlSession = factory.openSession();
        try {
            // 操作CRUD，第一个参数：指定statement，规则：命名空间+“.”+statementId
            // 第二个参数：指定传入sql的参数：这里是用户id
            String time = sqlSession.selectOne("dao.ITopicDao", 1);
            System.out.println(time);
        } finally {
            sqlSession.close();
        }
    }
}
