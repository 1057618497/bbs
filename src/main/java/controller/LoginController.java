package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import service.AccountService;
import service.ProfileService;
import vo.Account;
import vo.Profile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LoginController {

    //注解入服务
    @Autowired
    private AccountService accountService;
    @Autowired
    private ProfileService profileService;

    @RequestMapping("/checkLogin")
    public String loginButton(HttpServletRequest request){
       //验证用户和密码
        String name=request.getParameter("username");
        System.out.println(name);
        String password=request.getParameter("password");
        System.out.println(password);
        Account account = accountService.getAccount(name);
        System.out.println("checkLogin is running");
        if(account==null) return "loginFalse";//登陆失败
        if(password.equals(account.getPassword())) {
            HttpSession session=request.getSession();
            session.setAttribute("AccountId",account.getId());//传入用户id进入session
            System.out.println("用户id"+account.getId() +"已经进入session");
          //  return "home";
            return "loginSuccess";//登录成功
        } else
            return "loginFalse";//登陆失败
    }

    @RequestMapping("/account/signUp")
    public String signUpButton(){
        return "signUp";
    }

    @RequestMapping("/checkSignUp")
    public String signUpAccount(HttpServletRequest request) {
        //给Account赋值
        //先调用getAccount（）查询用户名是否重复
        //调用setAccount（）写入account表
        //再调用getAccount（）查询该用户的id
        //将id和其他信息给Profile赋值
        //调用profileService的setProfile（）写入account_info表
        vo.Account account = new Account();
        String name = request.getParameter("username");
        account.setName(name);
        String password = request.getParameter("password");
        account.setPassword(password);
        //查询用户名是否重复
        Account account1 = accountService.getAccount(name);
        System.out.println("checkSignUp is running");
        if(account1!=null ){//存在
            System.out.println("该用户名已经存在！");
            return "loginFalse";//失败
        }else {
            Profile profile = new Profile();
            accountService.insertAccount(account);//添加用户表
            account1 = accountService.getAccount(name);
            int id = account1.getId();
            profile.setId(id);
            String telephone = request.getParameter("telephone");
            profile.setTelephone(telephone);
            String qq = request.getParameter("qq");
            profile.setQq(qq);
            String job = request.getParameter("job");
            profile.setJob(job);
            String sex1 = request.getParameter("sex");
            int sex = Integer.parseInt(sex1);
            profile.setSex(sex);
            int points = 0;//初始积分0
            profile.setPoints(points);
            String nickname = request.getParameter("nickname");
            profile.setNickname(nickname);
            profileService.insertProfile(profile);//添加用户信息表

            return "loginSuccess";//成功
        }
    }

    //用户退出 guan
    @RequestMapping("/account/exit")
    public String exitButton(HttpServletRequest request){
        int id =0;
        HttpSession session=request.getSession();
        session.setAttribute("AccountId",null);//传入用户id进入session
        //  return "home";
        return "login";//退出回xx页面
    }

    @RequestMapping("login")
    public String login(){
        return "login";
    }
}
