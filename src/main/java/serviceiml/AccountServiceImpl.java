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



}
