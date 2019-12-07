package dao;
import vo.*;
//import test.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository  //此注解代表这是一个持久层，用法类似@controller、@service
public interface IAccountdao {

    @Select("select * from account")
    public List<test.Account> findAll();
    @Insert("insert into account (id,name,money) values(#{id},#{name},#{money})")
    public void saveAccount(test.Account account);
   @Select("select * from accounts where name= #{name}")
    public vo.Account getAccount(String name);

    public Account insertAccount(Account a);
}
