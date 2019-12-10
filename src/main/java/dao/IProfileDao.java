package  dao;

import vo.*;
//import test.Account;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository  //此注解代表这是一个持久层，用法类似@controller、@service

public interface IProfileDao {
    //用户id 拿到用户信息
    @Select("select * from account_info where id=#{id}")
    public Profile getProfileBytid(int id);
}
