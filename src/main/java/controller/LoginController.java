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
import java.util.List;

@Controller
public class LoginController {

    //注解入服务
    @Autowired
    private AccountService accountService;
    @Autowired
    private ProfileService profileService;


    //用户登录
    @RequestMapping("/checkLogin")
    public String loginButton(HttpServletRequest request){
       //验证用户和密码
        String name=request.getParameter("username");
        System.out.println(name);
        String password=request.getParameter("password");
        System.out.println(password);
        Account account = accountService.getAccount(name);
        System.out.println("checkLogin is running");

        HttpSession session=request.getSession();
        if(account==null) {
            String error="用户名不存在";
            session.setAttribute("ERROR",error);
            return "login";//登陆失败，转跳回登录页面
        }
        if(password.equals(account.getPassword())) {
            session.setAttribute("AccountId",account.getId());//传入用户id进入session
            System.out.println("用户id"+account.getId() +"已经进入session");
            return "home";//登录成功,前往主页
        } else {
            String error="密码错误";
            session.setAttribute("ERROR",error);
            return "login";//登陆失败，转跳回登录页面
        }
    }

    //转跳用户注册页面
    @RequestMapping("/account/signUp")
    public String signUpButton(){
        return "signUp";
    }

    //用户注册
    @RequestMapping("/checkSignUp")
    public String signUpAccount(HttpServletRequest request) {

        //给Account赋值 调用getAccount（）查询用户名是否重复
        //调用setAccount（）写入account 调用getAccount（）查询该用户的id
        //将id和其他信息给Profile赋值 调用profileService的setProfile（）写入account_info表


        HttpSession session=request.getSession();
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        if(name=="" || password==""){
            String error="用户名和密码不能为空！";
            session.setAttribute("ERROR",error);
            return "signUp";//失败，转跳回注册页面
        }
        vo.Account account = new Account();
        account.setName(name);
        account.setPassword(password);

        //查询用户名是否重复
        Account account1 = accountService.getAccount(name);
        System.out.println("checkSignUp is running");
        if(account1!=null){//存在
            String error="该用户名已经存在！";
            session.setAttribute("ERROR",error);
            return "signUp";//失败，转跳回注册页面
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

            return "login";//注册成功，转跳登录页面
        }
    }

    //用户退出 guan
    @RequestMapping("/account/exit")
    public String exitButton(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.setAttribute("AccountId",null);//传入用户id进入session
        return "home";//退出回主页
    }

    //转跳管理员登陆页面 guan
    @RequestMapping("/admin/login")
    public String adminLoginButton(){
        return "adminLogin";
    }

    //检查管理员登陆账号密码
    @RequestMapping("/checkAdminLogin")
    public String adminLoginButton(HttpServletRequest request) {
        //验证管理员的用户和密码
        String name = request.getParameter("username");
        System.out.println(name);
        String password = request.getParameter("password");
        System.out.println(password);
        Account account = accountService.getAdmin(name);
        System.out.println("checkAdminLogin is running");
        HttpSession session = request.getSession();
        if (account == null) {
            String error = "用户名不存在";
            session.setAttribute("ERROR", error);
            return "adminLogin";//登陆失败，转跳回登录页面
        }
        if (password.equals(account.getPassword())) {
            session.setAttribute("AccountId", account.getId());//传入用户id进入session
            System.out.println("用户id" + account.getId() + "已经进入session");
            return "home";//登录成功,前往主页
        } else {
            String error = "密码错误";
            session.setAttribute("ERROR", error);
            return "adminLogin";//登陆失败，转跳回登录页面
        }
    }

    //读取所有的用户，跳转用户管理页面 guan
    @RequestMapping("/accountManage")
    public String accountManageButton(HttpServletRequest request){
        HttpSession session=request.getSession();
        //检查管理员是否登录，没登转跳登录页面
        Account account=(Account) session.getAttribute("adminAccount");
        if(account==null)
            return "adminLogin";
        //查找所有用户
        List<Account> accounts=accountService.getAllAccount();
        session.setAttribute("Accounts",accounts);
        return "accountManage";
    }

    //查看用户信息
    @RequestMapping("/adminViewAccountInfo")
    public String viewAccountInfoButton(HttpServletRequest request){

        String id1=request.getParameter("id");
        int id = Integer.parseInt(id1);
        System.out.println(id);
        //根据id查询account表
        Account account=accountService.getAccount(id);
        //传入session
        HttpSession session=request.getSession();
        session.setAttribute("Account",account);
        //如果结果为空
        if(account==null) {}
        else{
            System.out.println(account);
            //查询account_info表
            Profile profile=profileService.getAccountInfo(account.getId());
            session.setAttribute("Profile",profile);
        }
        return "adminViewAccountInfo";
    }

    //转跳回管理员主页面
    @RequestMapping("/adminHome")
    public String adminHomeButton(){
        return "adminHome";
    }

    //管理员修改个人资料
    @RequestMapping("/adminEditProfile")
    public String adminEditProfile(HttpServletRequest request){

        String id1=request.getParameter("id");
        int id = Integer.parseInt(id1); //用户id
        String name=request.getParameter("name");//用户名
        String password=request.getParameter("password");//密码
        String nickname=request.getParameter("nickname");//昵称
        String telephone=request.getParameter("telephone");//电话
        String qq=request.getParameter("qq");//QQ
        String job=request.getParameter("job");//工作
        String sex1=request.getParameter("sex");
        int sex = Integer.parseInt(sex1);//性别
        String points1=request.getParameter("points");
        int points = Integer.parseInt(points1);//积分

        //修改账号密码
        Account account=new Account();
        account.setId(id);
        account.setName(name);
        account.setPassword(password);
        accountService.alterAccount(account);
        //修改个人资料
        Profile profile=new Profile();
        profile.setId(id);
        profile.setNickname(nickname);
        profile.setTelephone(telephone);
        profile.setQq(qq);
        profile.setJob(job);
        profile.setSex(sex);
        profile.setPoints(points);
        profileService.alterProfile(profile);

        //重新根据id查询更新后的个人信息
        account=accountService.getAccount(id);
        profile=profileService.getAccountInfo(id);
        HttpSession session=request.getSession();
        session.setAttribute("Account",account);
        session.setAttribute("Profile",profile);
        return "adminViewAccountInfo";
    }

    //管理员删除用户
    @RequestMapping("/adminDeleteAccount")
    public String adminDeleteAccount(HttpServletRequest request){

        String id1=request.getParameter("id");
        int id = Integer.parseInt(id1); //用户id

        //根据id删除account和profile
        accountService.deleteAccountById(id);
        profileService.deleteProfileById(id);
        //根据id删除帖子和回帖
    //调用帖子和回帖的服务


        //重新查找所有用户，更新用户信息
        List<Account> accounts=accountService.getAllAccount();

        HttpSession session=request.getSession();
        session.setAttribute("Accounts",accounts);
        return "accountManage";
    }

    //管理员退出
    @RequestMapping("/adminExit")
    public String adminExitButton(HttpServletRequest request){
        HttpSession session=request.getSession();
        session.setAttribute("adminAccount",null);//将传入session的用户置空
        return "adminHome";
    }

    //用户前往修改密码页面,先查看密码
    @RequestMapping("/viewPassword")
    public String viewPasswordButton(HttpServletRequest request){

        //检查用户是否登录，没登转跳登录页面
        HttpSession session=request.getSession();
        if(session.getAttribute("AccountId")==null)
            return "login";

        int id=(int)session.getAttribute("AccountId");
        Account account=accountService.getAccount(id);
        session.setAttribute("alterPasswordAccount",account);
        return "alterPassword";
    }

    //用户修改用户名密码
    @RequestMapping("/alterPassword")
    public String alterPassword(HttpServletRequest request){

        //检查用户是否登录，没登转跳登录页面
        HttpSession session=request.getSession();
        if(session.getAttribute("AccountId")==null)
            return "login";
        int id=(int)session.getAttribute("AccountId");//用户id
        String name = request.getParameter("name");
        String password=request.getParameter("password");
        Account account=new Account();
        account.setId(id);
        account.setName(name);
        account.setPassword(password);
        accountService.alterAccount(account);
        //重新根据id查询更新后的个人信息
        account=accountService.getAccount(id);
      //  profile=profileService.getAccountInfo(id);
        session.setAttribute("alterPasswordAccount",account);
      //  session.setAttribute("Profile",profile);
        return "alterPassword";
    }

    //用户前往查看个人资料页面
    @RequestMapping("/viewAccountInfo")
    public String viewProfileButton(HttpServletRequest request){

        //检查用户是否登录，没登转跳登录页面
        HttpSession session=request.getSession();
        if(session.getAttribute("AccountId")==null)
            return "login";

        int id=(int)session.getAttribute("AccountId");
        Profile profile=profileService.getAccountInfo(id);
        session.setAttribute("alterProfile",profile);
        return "viewAccountInfo";
    }

    //用户修改个人资料
    @RequestMapping("/alterAccountInfo")
    public String alterAccountInfoButton(HttpServletRequest request){

        //检查用户是否登录，没登转跳登录页面
        HttpSession session=request.getSession();
        if(session.getAttribute("AccountId")==null)
            return "login";

        int id=(int)session.getAttribute("AccountId");
        String nickname = request.getParameter("nickname");
        String telephone = request.getParameter("telephone");
        String qq=request.getParameter("qq");
        String job=request.getParameter("job");
        String sex1=request.getParameter("sex");
        int sex = Integer.parseInt(sex1);//性别
        String points1=request.getParameter("points");
        int points = Integer.parseInt(points1);//积分

        Profile profile=new Profile();
        profile.setId(id);
        profile.setNickname(nickname);
        profile.setTelephone(telephone);
        profile.setQq(qq);
        profile.setJob(job);
        profile.setSex(sex);
        profile.setPoints(points);
        profileService.alterProfile(profile);

        //重新根据id查询更新后的个人信息
    //  account=accountService.getAccount(id);
        profile=profileService.getAccountInfo(id);
     //   session.setAttribute("Account",account);
        session.setAttribute("alterProfile",profile);
        return "viewAccountInfo";
    }

}
