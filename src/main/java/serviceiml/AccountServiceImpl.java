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
}
