package daoiml;
import dao.IProfileDao;
import dao.ITopicDao;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;
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
    @Autowired
    IProfileDao iProfileDao;
   // @Autowired
   // SqlSession sqlSession;

//    public void setSqlSession(SqlSession sqlSession){
//        this.sqlSession=sqlSession;
//    }


    @Override
    public void updateReply(String time, int tid, int rid) {

    }

    //帖子回复数+1
    @Update("update topic_info set reply=reply+1 where tid=#{tid}")
    public void updateReplyNum(int tid) {

    }
    //帖子浏览数+1
    @Update("update topic_info set click=click+1 where tid=#{tid}")
    public void updateClickNum(int tid) {

    }

    @Override
    public ArrayList<Topic> selectTopicList() {
        return null;
    }


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
            sqlSession.insert("dao.ITopicDao.insertTopic_t", t);
            sqlSession.insert("dao.ITopicDao.insertTopic_r", t);
            sqlSession.insert("dao.ITopicDao.insertTopic_info", t);

        } finally {
            sqlSession.close();
        }

    }

    @Override
    public void updateTopicPoints(int points, int tid) {

    }

    @Override
    public void updateTopic(Topic t) {

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
            //获取帖子总数num
            if(hp.gettType()==2)
                num = sqlSession.selectOne("dao.ITopicDao.totalNum");
            else num=sqlSession.selectOne("dao.ITopicDao.totalNum_re",hp.gettType());
                hp.setTotalNum((num+9)/hp.getNum());

            list = sqlSession.selectList("dao.ITopicDao.selectTopList");

            //设置置顶帖
            for(int i=0;i<list.size();i++){
                BriefTopic v=(BriefTopic)list.get(i);
                int uid=Integer.valueOf(v.getAuthor());
                v.setAuthor(this.getkicnname(uid));
                uid=Integer.valueOf(v.getRecentReName());
                v.setRecentReName(this.getkicnname(uid));
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

                    int uid=Integer.valueOf(v.getAuthor());
                    v.setAuthor(this.getkicnname(uid));
                    uid=Integer.valueOf(v.getRecentReName());
                    v.setRecentReName(this.getkicnname(uid));
                nlist.add(v);
            }
            hp.setList(nlist);
        } finally {
            sqlSession.close();
        }
        return hp;
    }

    @Override
    //返回用户Id对应所有主帖
    public ArrayList<Topic> TselectByid(int id) {
        return null;
    }

//<<<<<<< HEAD
    @Override
    public int deleteTopicBytid(int tid) {
        return 0;
    }

    @Override
    public int deleteTopicInfoBytid(int tid) {
        return 0;
    }

    @Override
    public int deleteTopicReBytid(int tid) {
        return 0;
    }

    String getkicnname(int id){
//        Profile profile=iProfileDao.getProfileBytid(id);
        Profile profile=iProfileDao.getProfileById(id);

        if(profile==null)
        return String.valueOf(id);
        else
            return profile.getNickname();
    }

//=======
    //返回用户ID对应的所有回帖
    public ArrayList<Topic> selectByid(int id){return null;};

    //获得所有帖子
    @Override
    public ArrayList<Topic> SelectAllT(){return null;}

    //删除rid对应的回帖
    public void deleteReplyByrid(int rid){};

    //删除用户所有回帖
    public void deleteAllR(int id){};

    //删除用户所有主贴
    public void deleteAllT(int id){};

    //设置加精
    public void updatejing(int jing,int Tid){};

    //设置置顶
    public void updateadd_top(int add_top,int Tid){};

    //删除tid对应的所有主贴和回帖
    public  void deleteAllBytid(int Tid){};

    //返回tid对应的所有回帖列表
    public ArrayList<Reply> selectByTid(int id){return null;};
//>>>>>>> 5f15f4b0649d336066de2af2d7bcac271c36e352

}
