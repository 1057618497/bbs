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
import vo.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.*;

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


    //帖子管理 修改 主贴 草稿
    @RequestMapping("/myView/modifyTopic")
    public String modifyTopic(HttpServletRequest request){

        if(request.getSession().getAttribute("AccountId")==null)
           return "/login";


        int tid=Integer.valueOf(request.getParameter("id"));
        Topic topic=topicService.getTopicBytid(tid);
        request.setAttribute("topic",topic);
        return "modifyTopic";
    }
    @RequestMapping("/myView/modifyDraft")
    public String modifyDraft(HttpServletRequest request){
        if(request.getSession().getAttribute("AccountId")==null)
            return "/login";

        int did=Integer.valueOf(request.getParameter("id"));
        Draft d=topicService.getDraftBydid(did);
        request.setAttribute("draft",d);
        return "modifyDraft";
    }

    //保存主贴修改
    @RequestMapping("/myView/topicSaveAction")
    public String topicSaveAction(HttpServletRequest request) {




        HttpSession session=request.getSession();
        Topic t=new Topic();
        t.setRequire(Integer.valueOf(request.getParameter("isRequire")));
        int tid=Integer.valueOf(request.getParameter("tid"));
        t.setTid(tid);
        t.setId((Integer)session.getAttribute("AccountId"));
        t.setTitle(request.getParameter("title"));
        t.setContent(request.getParameter("html"));
        t.setPoints(Integer.valueOf(request.getParameter("points")));

        String url="/bbs/topic?tid="+tid;
        String notice="修改成功";
        topicService.modifyTopic(t);


        request.setAttribute("url",url);
        request.setAttribute("notice",notice);

        return "notice";
    }

    //保存草稿
    @RequestMapping("/myView/draftSaveAction")
    public String draftSaveAction(HttpServletRequest request){
        String url="/bbs/myView?type=draft";
        String notice;

        HttpSession session=request.getSession();
        Draft draft=new Draft();
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddHHmmss");
        draft.setSave_time(ft.format(dNow));
        draft.setTitle(request.getParameter("title"));
        draft.setContent(request.getParameter("html"));
        draft.setAuthor_id((Integer)session.getAttribute("AccountId"));
        draft.setDid(Integer.valueOf(request.getParameter("did")));
        if(topicService.modifyDraft(draft))
            notice="修改成功"; //成功
        else notice="修改失败";//失败

        request.setAttribute("url",url);
        request.setAttribute("notice",notice);

        return "notice";
    }
    //草稿发布
    @RequestMapping("/myView/draftToTopicAction")
    public String draftToTopicAction(HttpServletRequest request){


        HttpSession session=request.getSession();
        Topic topic=new Topic();


        int did=(Integer.valueOf(request.getParameter("did")));
        topicService.deleteDraft(did);
        return newTopicAction(request);


    }


    //帖子管理 删除 主贴 回帖 草稿
    @RequestMapping("/myView/deleteTopic")
    public String deleteTopic(HttpServletRequest request){

        int tid=Integer.valueOf(request.getParameter("id"));
        String url="/bbs/myView?type=topic";
        String notice;
        if(topicService.deleteTopicBytid(tid)) {
            notice = "删除成功";
            topicService.deleteReplyBytid(tid);
        }
        else
            notice="删除失败";
        request.setAttribute("url",url);
        request.setAttribute("notice",notice);

        return "notice";
    }

    @RequestMapping("/myView/deleteDraft")
    public String deleteDraft(HttpServletRequest request){
        int did=Integer.valueOf(request.getParameter("did"));
        String url="/bbs/myView?type=draft";
        String notice;
        if(topicService.deleteDraft(did))
            notice="删除成功";
        else
            notice="删除失败";
        request.setAttribute("url",url);
        request.setAttribute("notice",notice);

        return "notice";

    }

    @RequestMapping("/myView/deleteReply")
    public String deleteReply(HttpServletRequest request){
        int rid=Integer.valueOf(request.getParameter("rid"));
        String url="/bbs/myView?type=reply";
        String notice;
        if(topicService.deleteReply(rid))
            notice="删除成功";
        else
            notice="删除失败";

        request.setAttribute("url",url);
        request.setAttribute("notice",notice);

        return "notice";

    }


    @RequestMapping("/index")
    public String index(){return "newTopic";}


    @RequestMapping("/myView")
    //用户管理帖子
    public String myViewOfTopic(HttpServletRequest request){
        if(request.getSession().getAttribute("AccountId")==null)
            return "/login";
        //三种类型  topic draft reply
        //每种操作
        //topic : 修改内容  删除帖子
        //显示: 序号 标题 发布时间  查看数回复数    修改删除
        //selectTopicByid  selectDraftByid  selectReplyByid
        //修改时间格式
        //draft:  修改内容  删除草稿  发布帖子
        //显示: 序号 标题   内容  修改时间  修改删除
        //reply:  删除
        //序号  帖子标题  回复内容  回复时间 删除

        //确定显示类型
        String type=request.getParameter("type");
        if(type==null) type="topic";
        request.setAttribute("type",type);

        //调用服务
        //获取用户的 所有 主贴 回帖 草稿
        int id=(Integer)(request.getSession().getAttribute("AccountId"));
        ArrayList<Topic> tList=topicService.getListByid(id);
        ArrayList<Reply> reList=topicService.getReListByid(id);
        ArrayList<Draft> dList=topicService.getDraftListByid(id);

        //request 放入信息
        request.setAttribute("tList",tList);
        request.setAttribute("reList",reList);
        request.setAttribute("dList",dList);
        request.setAttribute("tNum",tList.size());
        request.setAttribute("reNum",reList.size());
        request.setAttribute("dNum",dList.size());

        return "myView";
    }

    //搜索
    @RequestMapping("/search")
    public String search(HttpServletRequest request) throws UnsupportedEncodingException {
        //拿到搜索内容
        request.setCharacterEncoding("gb2312");
        String s=request.getParameter("search");
        if(s!=null) {
            ArrayList<Topic> li = topicService.getSearchContentTopicList(s);
            request.setAttribute("searchList", li);
            request.setAttribute("content", s);
            request.setAttribute("num", li.size());
        }
        return "search";
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
        request.setAttribute("tid",var);
        int id;

        //tid 为空 error
        if(var==null)
            return "";//error page
        else id=Integer.valueOf(var);

        //浏览数+1
        topicService.updateClickNum(id);


        tv.setT(topicService.getTopicBytid(id));
        ArrayList<Reply> reList=topicService.getReListBytid(id);

        tv.setName(profileService.getNameBytid(id));

        ArrayList<Unit> li=new ArrayList<>();
        for(int i=0;i<reList.size();i++){
            Unit u=new Unit();
            u.setReName(profileService.getnicknameByuid(reList.get(i).getRidOfMan()));
            u.setReply(reList.get(i));
            li.add(u);
        }

        tv.setReList(li);
        //主贴 用户名空 error
        //if(tv.getT()==null || tv.getName()==null)
        //    return "" ; //error page

        request.setAttribute("TopicView",tv);
        return "topic";
    }

    @RequestMapping("/")
    public String welcome(HttpServletRequest request){
        return homePage(request);
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
        if(tType==null) {hp.settType(0);tType="2";}
        else hp.settType(Integer.valueOf(tType));
        if(sType==null) {hp.setsType(0);sType="0";}
        else hp.setsType(Integer.valueOf(sType));

        hp=homePageService.getHomePage(hp);
        request.setAttribute("HomePage",hp);
        request.setAttribute("now",Integer.valueOf(now));
        request.setAttribute("tType",Integer.valueOf(tType));
        request.setAttribute("sType",Integer.valueOf(sType));

        HttpSession session=request.getSession();
        if(session.getAttribute("AccountId")!=null){
            int id=(Integer) session.getAttribute("AccountId");
            Profile profile=profileService.getProfileByuid(id);
            session.setAttribute("userProfile",profile);
        }


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

//    @RequestMapping("/account/login")
//    public String loginButton(){
//        //跳转到 login.jsp
//        return "login";
//    }
//    @RequestMapping("/account/loginAction")
//    public String loginAction(@RequestParam("name") String name,@RequestParam("password") String password){
//        //name and password
//        //get account with dao
//        System.out.println("test login action");
//
//
//        vo.Account account=accountService.getAccount(name);
//
//        if(password.equals(account.getPassword())) {
//            System.out.println("success");
//            return "success";
//        }
//        else{
//            System.out.println("fail");
//            return "fail";
//        }
//    }



    //发表回帖
    @RequestMapping("newReplyAction")
    public String newReplyAction(HttpServletRequest request){
        Reply reply=new Reply();
        String content=request.getParameter("html");
        String ridOfMan=request.getParameter("ridOfMan");
        String tid=request.getParameter("tid");

        reply.setContent(content);
        reply.setTid(Integer.valueOf(tid));
        reply.setRidOfMan(Integer.valueOf(ridOfMan));

        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddHHmmss");
        reply.setReTime(ft.format(dNow));

        //回复数+1
        topicService.updateReplyNum(Integer.valueOf(tid));
        //添加回帖
        topicService.newReply(reply);
        //积分+3
        profileService.updatePoints3(Integer.valueOf(ridOfMan));
        HttpSession session=request.getSession();
        Profile profile=profileService.getProfileByuid(Integer.valueOf(ridOfMan));
        session.setAttribute("userProfile",profile);
        //跟新主贴的回帖
        topicService.updateReply(reply);


        String url="/bbs/myView?type=reply";
        String notice="回复成功";
        request.setAttribute("url",url);
        request.setAttribute("notice",notice);

        return "notice";
    }

    //进入编辑帖子页面
    @RequestMapping("/newTopic")
    public  String writeTopic(HttpServletRequest request){
        if(request.getSession().getAttribute("AccountId")==null)
            return "/login";

        HttpSession session=request.getSession();
        if(session.getAttribute("AccountId")==null)
            return "login"; //没有登录跳转登录页面

        return "newTopic";
    }

    //保存草稿
    @RequestMapping("newDraftAction")
    public String newDraftAction(HttpServletRequest request){
        String url="/bbs/myView?type=draft";
        String notice;

        HttpSession session=request.getSession();
        Draft draft=new Draft();
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddHHmmss");
        draft.setSave_time(ft.format(dNow));
        draft.setTitle(request.getParameter("title"));
        draft.setContent(request.getParameter("html"));
        draft.setAuthor_id((Integer)session.getAttribute("AccountId"));
        if(topicService.newDraft(draft))
            notice="保存成功"; //成功
        else notice="保存失败";//失败

        request.setAttribute("url",url);
        request.setAttribute("notice",notice);

        return "notice";
    }


    //发布新帖
    @RequestMapping("newTopicAction")
    public String newTopicAction(HttpServletRequest request){
        String url="/bbs/myView?type=topic";
        String notice="发布成功";


        HttpSession session=request.getSession();
        Topic t=new Topic();
        Date dNow = new Date( );
        SimpleDateFormat ft = new SimpleDateFormat ("yyyyMMddHHmmss");
        t.setUpTime(ft.format(dNow));
        t.setRequire(Integer.valueOf(request.getParameter("isRequire")));
        t.setId((Integer)session.getAttribute("AccountId"));
        t.setTitle(request.getParameter("title"));
        t.setContent(request.getParameter("html"));

        //修改个人积分
        int points=Integer.valueOf(request.getParameter("points"));
        if(points!=0) {
            t.setPoints(points);
            profileService.updatePoints((Integer)session.getAttribute("AccountId"),0-points);
        }
        topicService.newTopic(t);

        //积分+5
        int tid=(Integer)session.getAttribute("AccountId");
        profileService.updatePoints5(tid);
        Profile profile=profileService.getProfileByuid(tid);
        session.setAttribute("userProfile",profile);

        request.setAttribute("url",url);
        request.setAttribute("notice",notice);

        return "notice";

    }

    //采纳
    @RequestMapping("award")
    public String award(HttpServletRequest request) {


        int id=Integer.valueOf(request.getParameter("id"));
        int tid=Integer.valueOf(request.getParameter("tid"));
        int points=Integer.valueOf(request.getParameter("points"));
        profileService.updatePoints(id,points);
        topicService.modifyTopicPoints(-1,tid);

        HttpSession session=request.getSession();
        Profile profile=profileService.getProfileByuid(id);
        session.setAttribute("userProfile",profile);

        String url="/bbs/topic?tid="+tid;
        String notice="采纳成功";

        request.setAttribute("url",url);
        request.setAttribute("notice",notice);

        return "notice";
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
