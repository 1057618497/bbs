package controller;

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

    @RequestMapping("/account/findAll")
    public String findAll(Model model){  //存数据， Model对象
        System.out.println("Controller表现层：查询所有账户...");
        // 调用service的方法
        List<Account> list = accountService.findAll();
        model.addAttribute("list",list);
        return "index";
    }
}
