package service;

import dao.IAccountdao;
import org.springframework.beans.factory.annotation.Autowired;
import test.Account;

import java.util.List;

public interface AccountService {




    //获得一个账户
    public vo.Account getAccount(String name);


}
