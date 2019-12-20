package dao;

import org.apache.ibatis.annotations.Delete;
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
    @Select( "select * from reply where ridOfMan=#{id} order by reTime desc")
    public ArrayList<Reply> selectByid(int id);

    //添加回帖
    @Insert("insert into reply(tid,reTime,ridOfMan,content) values(" +

            "#{tid}," +
            "#{reTime},"+
            "#{ridOfMan},"+
            "#{content})")
    public void insertReply(Reply re);

    //通过主贴id删除主贴下所有回帖
    @Delete("delete from reply where tid=#{tid}")
    public void deleteTopicBytid(int tid);

    //通过回帖id删除回帖
    @Delete("delete from reply where rid=#{rid}")
    public int deleteReplyByrid(int rid);
}
