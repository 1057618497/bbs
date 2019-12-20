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
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;



@Controller
public class ManageController {

    //注解入服务
    @Autowired
    private TopicService topicService;



    //返回所有帖子
    @RequestMapping("/manageTip")
    public String manageTip(HttpServletRequest request) {
        ArrayList<Topic> topics=new ArrayList<Topic>();
        topics=topicService.getAllT();
        System.out.println(topics.get(0).getTid());
        HttpSession session=request.getSession();
        session.setAttribute("topics",topics);
        return "manageTip";
    }

    //修改帖子,由主贴id返回回帖和主帖信息
    @RequestMapping("/Tchange")
    public String Tchange(HttpServletRequest request) {
        int Tid=Integer.parseInt(request.getParameter("Tid"));
        ArrayList<Reply> replys=new ArrayList<>();
        Topic topic=new Topic();
        topic=topicService.getTopicBytid(Tid);
        replys=topicService.getReListBytid(Tid);
        HttpSession session=request.getSession();
        System.out.println(replys.get(0).getContent());
        session.setAttribute("topic",topic);
        session.setAttribute("replys",replys);
        return "Tchange";
    }

    //删除楼层,通过rid
    @RequestMapping("/deleteReply")
    public String deleteReply(HttpServletRequest request){
        int rid=Integer.parseInt(request.getParameter("rid"));
        HttpSession session=request.getSession();
        session.setAttribute("rid",rid);
        topicService.deleteReplyByrid(rid);
        return "deleteReply";
    }

    @RequestMapping("/authoridFind")
    public String IdFind(HttpServletRequest request) {
        int author_id=Integer.parseInt(request.getParameter("author_id"));
        HttpSession session=request.getSession();
        session.setAttribute("author_id",author_id);

        ArrayList<Topic> topics=new ArrayList<>();
        ArrayList<Reply> replys=new ArrayList<>();
        topics=topicService.TselectByid(author_id);
        replys=topicService.selectByid(author_id);
        session.setAttribute("topics",topics);
        session.setAttribute("replys",replys);
        System.out.println(replys.get(0).getRid());
        return "authoridFind";
    }

    //管理员主页跳转
    @RequestMapping("/managehome")
    public String IdFind() {
        return "managehome";
    }

    //删除所有author_id对应的主贴
    @RequestMapping("/deleteAllT")
    public String deleteAllT(HttpServletRequest request) {
        int id=Integer.parseInt(request.getParameter("author_id"));
        HttpSession session=request.getSession();
        session.setAttribute("id",id);
        topicService.deleteAllT(id);
        return "deleteAllT";
    }

    //删除所有author_id对应的回帖
    @RequestMapping("/deleteAllR")
    public String deleteAllR(HttpServletRequest request) {
        int id=Integer.parseInt(request.getParameter("author_id"));
        HttpSession session=request.getSession();
        session.setAttribute("id",id);
        topicService.deleteAllR(id);
        return "deleteAllR";
    }

    //进行加精和置顶操作
    @RequestMapping("/JingAlready")
    public String jingAlready(HttpServletRequest request) {
        HttpSession session=request.getSession();
        int Tid=(int)session.getAttribute("Tid");
        int jing=Integer.parseInt(request.getParameter("jing"));
        int add_top=Integer.parseInt(request.getParameter("add_top"));
        topicService.updatejing(jing,Tid);
        topicService.updateadd_top(add_top,Tid);
        return "JingAlready";
    }

    //前往加精页面
    @RequestMapping("/manageJing")
    public String manageJing(HttpServletRequest request) {
        int Tid=Integer.parseInt(request.getParameter("Tid"));
        HttpSession session=request.getSession();
        session.setAttribute("Tid",Tid);
        return "manageJing";
    }

    //删除帖子tid对应的主贴
    @RequestMapping("/deleteTopic")
    public String deleteTopic(HttpServletRequest request){

        int Tid=Integer.parseInt(request.getParameter("Tid"));
        HttpSession session=request.getSession();
        session.setAttribute("Tid",Tid);
        topicService.deleteAllBytid(Tid);
        return "deleteTopic";
    }
}
