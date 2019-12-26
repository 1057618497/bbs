package serviceiml;
import dao.IAccountdao;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import vo.Account;
import service.AccountService;
import org.springframework.stereotype.Service;
import java.util.List;
@Service("AccountService")
public class AccountServiceImpl implements AccountService {

    @Autowired
    private IAccountdao iaccountdao;



    @Override
    public vo.Account getAccount(String name) {
        System.out.println("service is running!");
        return iaccountdao.getAccount(name);
    }

    //添加一个账户 guan
    // //用户名已经调用获得一个账户的方法getAccount(String name)排除重复
    @Override
    public void insertAccount(vo.Account account){
        System.out.println("insertAccount service is running!");
        iaccountdao.insertAccount(account);
    }

    @Override
    public Account getAdmin(String name) {
        System.out.println("getAdmin service is running!");
        return iaccountdao.getAdmin(name);
    }

    @Override
    public List<Account> getAllAccount() {
        System.out.println("getAllAccount service is running!");
        return iaccountdao.getAllAccount();
    }

    @Override
    public Account getAccount(int id) {
        System.out.println("getAccount by id is running!");
        return iaccountdao.getAccountById(id);
    }

    //根据用户id修改用户名和密码
    @Override
    public void alterAccount(vo.Account account) {
        System.out.println("alterAccount by id is running!");
        iaccountdao.alterAccount(account);
    }

    //根据用户id删除用户  guan
    @Override
    public void deleteAccountById(int id) {
        System.out.println("deleteAccount by id is running!");
        iaccountdao.deleteAccountById(id);
    }
}
