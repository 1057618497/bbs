package daoiml;

import dao.IAccountdao;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import vo.Account;

import java.util.List;

public class AccountDaoIml extends SqlSessionDaoSupport implements IAccountdao {






    @Override
    public Account getAccount(String name) {
        return null;
    }

    @Override
    public void insertAccount(Account a) {


    }
}

