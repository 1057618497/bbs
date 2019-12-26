package  dao;

import org.apache.ibatis.annotations.*;
import vo.*;
//import test.Account;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository  //此注解代表这是一个持久层，用法类似@controller、@service

public interface IProfileDao {

    @Select("select * from account_info where id=#{id}")
    public Profile getProfileById(int id);

    //用户发帖 积分+5
    @Update("update account_info set points=points+5 where id=#{tid}")
    public void updateProfilePoints5(int tid);

    //用户发帖 积分+3
    @Update("update account_info set points=points+3 where id=#{tid}")
    public void updateProfilePoints3(int tid);

    @Update("update account_info set points=points+#{points} where id=#{tid}")
    public void updateProfilePoints(@Param("tid")int tid, @Param("points")int points);




    //修改用户信息
    @Update("update account_info telephone=#{telephone}, qq=#{qq}," +
            "job=#{job},sex={sex},points=#{points},nickname={nickname}" +
            "where id=#{id}")
    public void updateProfile(Profile p);

    //根据用户id删除用户信息
    @Delete("delete from account_info where id=#{id}")
    public void deleteProfile(int id);

    //添加profile
    @Insert("insert into account_info values(#{id},#{telephone},#{qq},#{job},#{sex},#{points},#{nickname})")
    public int insertProfile(Profile p);

 //   //添加用户信息 guan
 //   @Insert("insert into account_info values (#{id},#{telephone},#{qq},#{job},#{sex},#{points},#{nickname})")
  //  public void insertProfile(Profile profile);

    //根据用户id修改个人资料 guan
    @Update("update account_info set telephone=#{telephone},qq=#{qq},job=#{job},sex=#{sex},points=#{points},nickname=#{nickname} where id=#{id}")
    public void alterProfile(Profile profile);

    @Select("select * from account_info where id=#{id}")
    Profile getProfileBytid(int id);
}
