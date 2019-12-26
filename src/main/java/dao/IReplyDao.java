package dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import vo.Reply;

import java.util.ArrayList;

@Repository
public interface IReplyDao {
    //返回主贴tid 的所有回帖列表
    @Select( "select * from reply where tid=#{tid}")
    public ArrayList<Reply> selectByTid(int tid);

    //返回用户author_id 的所有回帖列表
    @Select( "select * from reply,topic where topic.tid=reply.tid and author_id=#{id}")
    public ArrayList<Reply> selectByid(int id);

    //添加回帖
    @Insert("insert into reply values(" +
            "#{rid}," +
            "#{tid}," +
            "#{reTime},"+
            "#{ridOfMan},"+
            "#{content})")
    public void insertReply(Reply re);

    //通过主贴tid删除主贴下所有回帖
    @Delete("delete from reply where tid=#{tid}")
    public void deleteTopicBytid(int tid);

    //通过回帖rid删除对应回帖
    @Delete("delete from reply where rid=#{rid}")
    public void deleteReplyByrid(int rid);

    //通过author_id删除用户所有回帖
    @Delete("delete from REPLY where tid=(select tid from TOPIC where author_id=#{id})")
    public void deleteAllR(int id);



}
