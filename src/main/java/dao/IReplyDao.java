package dao;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import vo.Reply;

import java.util.ArrayList;

@Repository
public interface IReplyDao {
    //返回主贴id 的所有回帖 列表
    @Select( "select * from reply where tid=#{tid}")
    public ArrayList<Reply> selectByTid(int tid);

    //返回用户id 的所有回帖 列表
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
}
