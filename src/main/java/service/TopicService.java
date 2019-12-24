package service;
import vo.Reply;
import vo.Topic;

import java.util.ArrayList;

public interface TopicService {
    //发新帖
    public void newTopic(Topic  t);

    //由帖子id 获取主贴
    public Topic getTopicBytid(int id);

    //由帖子id 获取所有回帖
    public ArrayList<Reply> getReListBytid(int id);

    //获取所有帖子
    public ArrayList<Topic> selectTopicList();

    //删除rid对应回帖
    public void deleteReplyByrid(int rid);

    //由用户id获取主贴
    public ArrayList<Topic> TselectByid(int id);

    //由用户id获取回帖
    public ArrayList<Reply> selectByid(int id);

    //删除用户所有主贴
    public void deleteAllT(int id);

    //删除用户所有回帖
    public void deleteAllR(int id);

    //设置加精
    public void updatejing(int jing,int Tid);

    //设置置顶
    public void updateadd_top(int add_top,int Tid);

    //删除tid对应的所有主贴和回帖
    public  void deleteAllBytid(int Tid);

    //返回tid对应的所有回帖列表
    public ArrayList<Reply> selectByTid(int id);
}
