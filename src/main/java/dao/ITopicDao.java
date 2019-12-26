package dao;

import org.apache.ibatis.annotations.*;
import org.apache.ibatis.type.JdbcType;

import org.springframework.stereotype.Repository;
import vo.*;

import java.util.ArrayList;

@Repository
public interface ITopicDao {

    //更新最新回复
    @Update("update topic_re set re_id=#{rid},re_time=#{time} where tid=#{tid}")
    public void updateReply(@Param("time")String time, @Param("tid")int tid,@Param("rid")int rid);

    //帖子回复数+1
    @Update("update topic_info set reply=reply+1 where tid=#{tid}")
    public void updateReplyNum(int tid) ;


    //帖子浏览数+1
    @Update("update topic_info set click=click+1 where tid=#{tid}")
    public void updateClickNum(int tid) ;


    //返回主贴列表
    @Select("select * from topic,topic_info,topic_re where topic.tid=topic_info.tid and topic.tid=topic_re.tid")
    @Results({
            @Result(column="author_id", property="id", jdbcType=JdbcType.INTEGER),
            @Result(column="click", property="clickNum", jdbcType=JdbcType.INTEGER),
            @Result(column="reply", property="replyNum", jdbcType= JdbcType.INTEGER)
    })
    //public ArrayList<Topic> selectTopicList();

    //主贴id索引主贴信息
    public Topic selectTopicBytid(int tid);

    //添加主贴
    public void insertTopic(Topic t);

    //修改主贴内容
    @Update("update topic_info set points=#{points} where tid=#{tid}")
    public void updateTopicPoints(@Param("points")int points,@Param("tid")int tid);

    //修改主贴内容
    @Update("update topic_info set title=#{title},content=#{content},require=#{require} ,points=#{points} where tid=#{tid}")
    public void updateTopic(Topic t);

    public HomePage getHomePage(HomePage hp);

    //返回用户id 的所有主贴
//<<<<<<< HEAD
    @Select("select * from topic,topic_info,topic_re where topic.tid=topic_info.tid and topic.tid=topic_re.tid and author_id=#{id} order by upTime desc")
    @Results({
            @Result(column="author_id", property="id", jdbcType=JdbcType.INTEGER),
            @Result(column="click", property="clickNum", jdbcType=JdbcType.INTEGER),
            @Result(column="reply", property="replyNum", jdbcType= JdbcType.INTEGER)
    })
    public ArrayList<Topic> selectByid(int id);

    //删除主贴
    @Delete("delete from topic where  tid=#{tid}")
    public int deleteTopicBytid(int tid);
    @Delete("delete from topic_info where  tid=#{tid}")
    public int deleteTopicInfoBytid(int tid);
    @Delete("delete from topic_re where  tid=#{tid}")
    public int deleteTopicReBytid(int tid);
//=======
    @Select("select * from topic,topic_info,topic_re where author_id=#{id} and topic.tid=topic_info.tid and topic.tid=topic_re.tid")
    public ArrayList<Topic> TselectByid(int id);

    //返回主贴列表
    @Select("select * from topic,topic_info,topic_re where topic.tid=topic_info.tid and topic.tid=topic_re.tid")
    public ArrayList<Topic> selectTopicList();

    //返回所有主帖
    @Select("select *from TOPiC_INFO")
    public ArrayList<Topic> SelectAllT();

    //通过author_id删除用户所有主帖
    @Delete("delete from topic where topic.tid=reply.tid and author_id=#{id}")
    public void deleteAllT(int id);

    //设置加精
    @Update("update topic_info set jing=#{jing} where tid=#{Tid}")
    public void updatejing(@Param("jing")int jing,@Param("Tid")int Tid);

    //设置置顶
    @Update("update topic_info set add_top=#{add_top} where tid=#{Tid}")
    public void updateadd_top(@Param("add_top")int add_top,@Param("Tid")int Tid);

    //删除tid对elete from topic,reply where topic.tid=reply.tid and tid=#{Tid};应的主帖和回帖
    @Delete("delete from topic where tid=#{Tid} delete from reply where tid=#{Tid)")
    public  void deleteAllBytid(int Tid);
//>>>>>>> 5f15f4b0649d336066de2af2d7bcac271c36e352
}
