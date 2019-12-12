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
    public void insertAccount(Account a){ }

}

