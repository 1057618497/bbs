package service;
import vo.Reply;
import vo.Topic;

import java.util.ArrayList;

public interface TopicService {
    //由帖子id 获取主贴
    public Topic getTopicBytid(int id);

    //由帖子id 获取所有回帖
    public ArrayList<Reply> getReListBytid(int id);

}
