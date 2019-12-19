package service;

import dao.IAccountdao;
import org.springframework.beans.factory.annotation.Autowired;
import vo.Account;
import vo.Profile;

import java.util.List;

public interface AccountService {

    //获得一个账户
    public vo.Account getAccount(String name);

    //添加一个账户 guan
    //用户名已经调用获得一个账户的方法getAccount(String name)排除重复
    public void insertAccount(vo.Account account);

    //获得一个管理员
    public vo.Account getAdmin(String name);

    //获得所有用户
    public List<vo.Account> getAllAccount();

    //根据用户id获得一个账户 guan
    public vo.Account getAccount(int id);

    //根据用户id修改用户名和密码  guan
    public void alterAccount(vo.Account account);

    //根据用户id删除用户  guan
    public void deleteAccountById(int id);

}
