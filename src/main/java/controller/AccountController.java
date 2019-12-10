package controller;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.web.bind.annotation.RequestParam;
import service.HomePageService;
import service.ProfileService;
import service.TopicService;
import test.Account;
import service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import vo.HomePage;
import vo.TopicView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class AccountController {

    @Autowired
    private AccountService accountService;
    @Autowired
    private HomePageService homePageService;
    @Autowired
    private TopicService topicService;
    @Autowired
    private ProfileService profileService;
    //查看帖子
    @RequestMapping("/topic")
    public String browseTopic(HttpServletRequest request){
        //根据传入帖子id
        //获取 主帖信息 回帖信息 以及 个人信息
        //调用topicservice and profileservice
        //调用 topicdao replydao  accountdao
        //返回的信息封装到
        TopicView tv=new TopicView();
        //id：主贴id
        String var=request.getParameter("tid");
        int id;

        //tid 为空 error
        if(var==null)
            return "";//error page
        else id=Integer.valueOf(var);

        tv.setT(topicService.getTopicBytid(id));
        tv.setReList(topicService.getReListBytid(id));
        tv.setName(profileService.getNameBytid(id));

        //主贴 用户名空 error
        //if(tv.getT()==null || tv.getName()==null)
        //    return "" ; //error page

        request.setAttribute("TopicView",tv);
        return "topic";
    }
    //访问主页
    @RequestMapping("/home")
    public String homePage(HttpServletRequest request){

        String now=request.getParameter("now");
        String tType=request.getParameter("tType");
        String sType=request.getParameter("sType");
        System.out.println(now+" "+tType+ " "+sType);
        HomePage hp=new HomePage();
        if(now==null) {hp.setNow(0);now="0";}
        else hp.setNow(Integer.valueOf(now));
        if(tType==null) {hp.settType(0);tType="0";}
        else hp.settType(Integer.valueOf(tType));
        if(sType==null) {hp.setsType(0);sType="0";}
        else hp.setsType(Integer.valueOf(now));

        hp=homePageService.getHomePage(hp);
        request.setAttribute("HomePage",hp);
        request.setAttribute("now",Integer.valueOf(now));
        request.setAttribute("tType",Integer.valueOf(tType));
        request.setAttribute("sType",Integer.valueOf(sType));

        return "home";
    }


    @RequestMapping("/bbs")
    public String forum(){
        //调用service 初始化一个homepage对象
        HomePage hp=new HomePage();

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
