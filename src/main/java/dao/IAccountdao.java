package dao;
import vo.*;
//import test.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository  //此注解代表这是一个持久层，用法类似@controller、@service
public interface IAccountdao {

//    @Select("select * from account")
//    public List<test.Account> findAll();
//    @Insert("insert into account (id,name,money) values(#{id},#{name},#{money})")
//    public void saveAccount(test.Account account);

    //用户名找账户
   @Select("select * from account where name= #{name}")
    public Account getAccount(String name);
   //添加账户
    @Insert("insert into account values (#{name},#{password})")
    public void insertAccount(Account a);




}
