package daoiml;

import dao.IAccountdao;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import vo.Account;

public class AccountDaoIml extends SqlSessionDaoSupport implements IAccountdao {






    @Override
    public Account getAccount(String name) {
        return null;
    }

    @Override
    public int insertAccount(Account a) {


        return 0;
    }
}

