package service;
import vo.Draft;
import vo.Reply;
import vo.Topic;

import java.util.ArrayList;

public interface TopicService {
    //获取所有标题含有搜索内容的帖子
    public ArrayList<Topic> getSearchContentTopicList(String search);

    //修改帖子最新回复
    public void updateReply(Reply re);

    //帖子回复数+1
    public void updateReplyNum(int tid);

    //帖子浏览数+1
    public void updateClickNum(int tid);

    //发新帖
    public void newTopic(Topic  t);

    //修改主贴内容
    public boolean modifyTopic(Topic t);

    public void modifyTopicPoints(int point,int tid);

    //由帖子id 获取主贴
    public Topic getTopicBytid(int id);

    //帖子id 删除主贴
    public boolean deleteTopicBytid(int tid);

    //用户id 获取所有主贴
    public ArrayList<Topic> getListByid(int id);

    //由帖子id 获取所有回帖
    public ArrayList<Reply> getReListBytid(int id);

    //由用户id 获取所有回帖
    public ArrayList<Reply> getReListByid(int id);

    //由用户id 获取所有草稿
    public ArrayList<Draft> getDraftListByid(int id);

    //添加draft
    public boolean newDraft( Draft draft);

    //draft id 获取draft
    public Draft getDraftBydid(int did);

    //draft id 修改draft 内容
    public boolean modifyDraft(Draft draft);

    //删除draft
    public boolean deleteDraft(int did);

    //添加reply
    public void newReply(Reply reply);

    //回帖id 删除reply
    public boolean deleteReply(int rid);

    //主贴id 删除主贴下所有reply
    public void deleteReplyBytid(int tid);

}
