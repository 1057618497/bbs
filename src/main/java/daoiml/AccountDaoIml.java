package daoiml;

import dao.IAccountdao;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import vo.Account;
import vo.Topic;

import java.util.List;

public class AccountDaoIml extends SqlSessionDaoSupport implements IAccountdao {

    @Autowired
    SqlSessionFactory sqlSessionFactory;

    @Override
    public Account getAccount(String name) {
        return null;
    }

    @Override
    public int insertAccount(Account a) {return 0;}

  // public void insertAccount(Account a){ }

    @Override
    public Account getAdmin(String name) {
        return null;
    }

    @Override
    public List<Account> getAllAccount() { return null; }

    @Override
    public Account getAccountById(int id) {
        return null;
    }

    @Override
    public void alterAccount(Account account) { }

    @Override
    public void deleteAccountById(int id) { }
}

