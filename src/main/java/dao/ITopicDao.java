package dao;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import vo.*;

import java.util.ArrayList;

@Repository
public interface ITopicDao {


    //主贴id索引主贴信息
    public Topic selectTopicBytid(int tid);

    //添加主贴
    public void insertTopic(Topic t);

    public HomePage getHomePage(HomePage hp);

    //返回用户id 的所有主贴
    @Select("select * from topic,topic_info,topic_re where author_id=#{id} and topic.tid=topic_info.tid and topic.tid=topic_re.tid")
    public ArrayList<Topic> TselectByid(int id);

    //返回主贴列表
    @Select("select * from topic,topic_info,topic_re where topic.tid=topic_info.tid and topic.tid=topic_re.tid")
    public ArrayList<Topic> selectTopicList();

    //返回所有帖子
    @Select("select *from TOPiC_INFO")
    public ArrayList<Topic> SelectAllT();

    //通过author_id删除用户所有主帖
    @Delete("delete from topic where topic.tid=reply.tid and author_id=#{id}")
    public void deleteAllT(int id);

    //设置加精
    @Update("update topic_info jing=#{jing} where tid=#{Tid}")
    public void updatejing(int jing,int Tid);

    //设置置顶
    @Update("update topic_info add_top=#{add_top} where tid=#{Tid}")
    public void updateadd_top(int add_top,int Tid);

    //删除tid对elete from topic,reply where topic.tid=reply.tid and tid=#{Tid};应的主帖和回帖
    @Delete("d")
    public  void deleteAllBytid(int Tid);
}
