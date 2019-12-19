package  dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Update;
import vo.*;
//import test.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository  //此注解代表这是一个持久层，用法类似@controller、@service

public interface IProfileDao {

    @Select("select * from account_info where id=#{id}")
    public Profile getProfileById(int id);


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
}
