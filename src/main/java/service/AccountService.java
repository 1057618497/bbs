package service;

import dao.IAccountdao;
import org.springframework.beans.factory.annotation.Autowired;

import vo.Profile;

import java.util.List;

public interface AccountService {

    //获得一个账户
    public vo.Account getAccount(String name);

    //添加一个账户 guan
    //用户名已经调用获得一个账户的方法getAccount(String name)排除重复
    public void insertAccount(vo.Account account);
}
