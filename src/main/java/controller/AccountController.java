package controller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestParam;
import test.Account;
import service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;


    @RequestMapping("/bbs")
    public String forum(){
        return "bbs";
    }
//    @RequestMapping("/account/findAll")
//    public String findAll(Model model){  //存数据， Model对象
//        System.out.println("Controller表现层：查询所有账户...");
//        // 调用service的方法
//        List<Account> list = accountService.findAll();
//        model.addAttribute("list",list);
//        return "index";
//    }

    @RequestMapping("/account/login")
    public String loginButton(){
        //跳转到 login.jsp
        return "login";
    }
    @RequestMapping("/account/loginAction")
    public String loginAction(@RequestParam("name") String name,@RequestParam("password") String password){
        //name and password
        //get account with dao
        System.out.println("test login action");


        vo.Account account=accountService.getAccount(name);

        if(password.equals(account.getPassword())) {
            System.out.println("success");
            return "success";
        }
        else{
            System.out.println("fail");
            return "fail";
        }
    }
}
