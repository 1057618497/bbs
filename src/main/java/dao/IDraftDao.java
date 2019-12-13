package dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import vo.Draft;

import java.util.ArrayList;

@Repository
public interface IDraftDao {
    //选择用户id的所有草稿
    @Select("select * from draft where author_id=#{tid}")
    public ArrayList<Draft> selectAllDraftBytid(int tid) ;


    // 为用户添加草稿
    @Insert("insert into draft values (#{author_id},#{save_time},#{content},#{title})")
    public void insertDraft(Draft d);

    //通过草稿id删除草稿
    @Delete("delete from draft where did=#{did}")
    public void deleteDraftBydid(int did);

    //修改草稿
    @Update("update draft save_time=#{save_time},content=#{content},title={title} where did={did}")
    public void setDraft(Draft d);

    //通过用户id删除用户的所有草稿
    @Delete("delete from draft where author_id=#{tid}")
    public void deleteDraftBytid(int tid);
}