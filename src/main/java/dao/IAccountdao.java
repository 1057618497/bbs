package dao;

import org.apache.ibatis.annotations.*;

import vo.*;
//import test.Account;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository  //此注解代表这是一个持久层，用法类似@controller、@service
public interface IAccountdao {

//    @Select("select * from account")
//    public List<test.Account> findAll();
//    @Insert("insert into account (id,name,money) values(#{id},#{name},#{money})")
//    public void saveAccount(test.Account account);


//    //用户名找账户   找不到返回null
//   @Select("select * from account where name= #{name}")
//    public Account getAccount(String name);
//  //添加账户  返回修改行数
   @Insert("insert into account values (#{name},#{password})")
   @Options(useGeneratedKeys=true, keyProperty="id", keyColumn="id")
   public int insertAccount(Account a);

    //用户名找账户 //也可用于用户登录验证用户密码
   @Select("select * from account where name= #{name}")
   public Account getAccount(@Param("name")String name);

   //添加账户
   //@Insert("insert into account values (#{name},#{password})")原插入语句
   // @Insert("insert into account values (null,#{name},#{password})")//改动后 guan
   // public void insertAccount(Account a);

   //用户名找管理员账户 //可用于登录验证管理员用户密码
   @Select("select * from admin where name= #{name}")
   public Account getAdmin(@Param("name")String name);

   //查询全部用户
   @Select("select * from account")
   public List<Account> getAllAccount();

   //id找账户
   @Select("select * from account where id= #{id}")
   public Account getAccountById(@Param("id")int id);

   //根据id修改用户名和密码
   @Update("update account set name=#{name},password=#{password} where id=#{id}")
   public void alterAccount(Account account);

   //根据id删除用户
   @Delete("delete from account where id=#{id}")
   public void deleteAccountById(@Param("id")int id);
}
