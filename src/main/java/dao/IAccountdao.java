package dao;

import test.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository  //此注解代表这是一个持久层，用法类似@controller、@service
public interface IAccountdao {

    @Select("select * from account")
    public List<Account> findAll();
    @Insert("insert into account (id,name,money) values(#{id},#{name},#{money})")
    public void saveAccount(Account account);
}
