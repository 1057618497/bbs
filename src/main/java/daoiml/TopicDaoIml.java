package daoiml;
import com.sun.java.browser.plugin2.liveconnect.v1.BridgeFactory;
import dao.ITopicDao;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import vo.*;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.support.SqlSessionDaoSupport;

import java.util.ArrayList;
import java.util.List;

public class TopicDaoIml extends SqlSessionDaoSupport implements ITopicDao{
    @Autowired
    SqlSessionFactory sqlSessionFactory;
   // @Autowired
   // SqlSession sqlSession;

//    public void setSqlSession(SqlSession sqlSession){
//        this.sqlSession=sqlSession;
//    }


    @Override
    public Topic selectTopicBytid( int s) {
        SqlSession sqlSession=this.sqlSessionFactory.openSession();
        Topic t;
        try {
           t= sqlSession.selectOne("dao.ITopicDao.selectTopBytid", s);
        }finally {
            sqlSession.close();
        }
        return t;
    }

    @Override
    public void insertTopic(@Param("t") Topic t) {
        SqlSession sqlSession=this.sqlSessionFactory.openSession();
        try {
            sqlSession.selectOne("dao.ITopicDao.insertTopic_t", t);
            sqlSession.selectOne("dao.ITopicDao.insertTopic_r", t);
            sqlSession.selectOne("dao.ITopicDao.insertTopic_info", t);

        } finally {
            sqlSession.close();
        }

    }

    @Override
    public HomePage getHomePage(HomePage hp) {
        //ttype 帖子类型 0 交流; 1 需求; 2 全部
        //stype 排序类型 0 发布时间; 1 点击数; 2 回复数 ; 3 最新回复时间
        //now  当前页

        int num;
        List<Object> list;
        ArrayList<BriefTopic>toplist=new ArrayList<>();
        ArrayList<BriefTopic>nlist=new ArrayList<>();
        SqlSession sqlSession=this.sqlSessionFactory.openSession();
        try {
            //获取帖子总数
            if(hp.gettType()==2)
                num = sqlSession.selectOne("dao.ITopicDao.totalNum");
            else num=sqlSession.selectOne("dao.ITopicDao.totalNum_re",hp.gettType());
                hp.setTotalNum((num+9)/hp.getNum());

            list = sqlSession.selectList("dao.ITopicDao.selectTopList");

            //设置置顶帖
            for(int i=0;i<list.size();i++){
                BriefTopic v=(BriefTopic)list.get(i);
                toplist.add(v);
            }
            hp.setTopList(toplist);

            //
            int s=hp.getsType();
            list.clear();
            hp.setStart(hp.getNow()*hp.getNum());
            hp.setEnd(Math.min(hp.getStart()+hp.getNum(),num));
            if(s==0) list = sqlSession.selectList("dao.ITopicDao.selectList0",hp);
                else if (s==1)list = sqlSession.selectList("dao.ITopicDao.selectList1",hp);
                    else if(s==2)list = sqlSession.selectList("dao.ITopicDao.selectList2",hp);
                        else list = sqlSession.selectList("dao.ITopicDao.selectList3",hp);

            for(int i=hp.getStart();i<hp.getEnd();i++)
                if(i<list.size()){
                BriefTopic v=(BriefTopic)list.get(i);
                nlist.add(v);
            }
            hp.setList(nlist);
        } finally {
            sqlSession.close();
        }
        return hp;
    }

    @Override
    public ArrayList<Topic> selectByid(int id) {
        return null;
    }
}
