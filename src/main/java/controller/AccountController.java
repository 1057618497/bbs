package controller;

import org.apache.commons.io.FileUtils;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import service.HomePageService;
import service.ProfileService;
import service.TopicService;
import service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import vo.HomePage;
import vo.TopicView;
import vo.WangEditor;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

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

    @RequestMapping("/index")
    public String index(){return "index";}
    //发布新帖
    @RequestMapping("")
    public  String writeTopic(){
        return "";
    }

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

    @RequestMapping("edit")
    public String edit(HttpServletRequest request){
        String s=request.getParameter("html");
        String s1=request.getParameter("title");
        System.out.println(s+"  title:"+s1);
       return "demo" ;
    }

    //用户上传图片
    @RequestMapping(value = "/upload",method=RequestMethod.POST)
    @ResponseBody
    public Map<String, String> uploadFile(
            @RequestParam("myFile") MultipartFile multipartFile,

            HttpServletRequest request) {
        try {


            String filename1=multipartFile.getOriginalFilename();
            filename1 = filename1.substring(filename1.lastIndexOf(".")+1);

            // 获取项目路径
            String realPath = request.getSession().getServletContext()
                    .getRealPath("");
            InputStream inputStream = multipartFile.getInputStream();

            String contextPath = request.getServletContext().getContextPath();

            // 服务器根目录的路径
            String path = realPath.replace(contextPath.substring(1),"");
            // 根目录下新建文件夹upload，存放上传图片
            String uploadPath = path + "upload";
            // 获取文件名称
            String filename = Calendar.getInstance().getTimeInMillis()+"."+filename1;
            // 将文件上传的服务器根目录下的upload文件夹
            File file = new File(uploadPath, filename);
            FileUtils.copyInputStreamToFile(inputStream, file);
            // 返回图片访问路径
            String url = request.getScheme() + "://" + request.getServerName()
                    + ":" + request.getServerPort() + "/bbs/upload/" + filename;
            String [] strs = {url};
            WangEditor we = new WangEditor(strs);
            Map<String, String> map = new HashMap<String, String>();
            map.put("data",url);
            return map;
        } catch (IOException  e) {
            //logger.error("上传文件失败", e);
            System.out.println("上传文件失败");
        }
        return null;

    }

}
