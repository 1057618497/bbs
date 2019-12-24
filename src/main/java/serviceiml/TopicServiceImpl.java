package serviceiml;

import dao.IReplyDao;
import dao.ITopicDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import service.TopicService;
import vo.Reply;
import vo.Topic;

import javax.imageio.event.IIOReadProgressListener;
import java.util.ArrayList;
@Service("TopicService")
public class TopicServiceImpl implements TopicService {
    @Autowired
    IReplyDao iReplyDao;


    @Qualifier("TopicDaoIml")
    @Autowired
    ITopicDao iTopicDao;

    @Qualifier("ITopicDao")
    @Autowired
    ITopicDao iTopicDaoInterface;

    @Qualifier("IReplyDao")
    @Autowired
    IReplyDao iReplyDaoInterface;

    //发新帖
    @Override
    public void newTopic(Topic  t){
        iTopicDao.insertTopic(t);
    }

    @Override
    public Topic getTopicBytid(int id) {
        return iTopicDao.selectTopicBytid(id);
    }

    @Override
    public ArrayList<Reply> getReListBytid(int id) {
        return iReplyDao.selectByTid(id);
    }

    //获取所有帖子
    @Override
    public ArrayList<Topic> selectTopicList(){return iTopicDaoInterface.selectTopicList();}

    //删除rid对应的回帖
    public void deleteReplyByrid(int rid){iReplyDaoInterface.deleteReplyByrid(rid);};

    //返回用户Id对应的所有主贴
    public ArrayList<Topic> TselectByid(int id){return iTopicDaoInterface.TselectByid(id);};

    //返回用户Id对应的所有回帖
    public ArrayList<Reply> selectByid(int id){return  iReplyDaoInterface.selectByid(id);};

    //删除用户所有主贴
    public void deleteAllT(int id){iTopicDaoInterface.deleteAllT(id);};

    //删除用户id对应的所有回帖
    public void deleteAllR(int id){iReplyDaoInterface.deleteAllR(id);};

    //加精操作
    public void updatejing(int jing,int Tid){iTopicDaoInterface.updatejing(jing,Tid);};

    //置顶操作
    public void updateadd_top(int add_top,int Tid){iTopicDaoInterface.updateadd_top(add_top,Tid);};

    //删除tid对应的所有主贴和回帖
    public  void deleteAllBytid(int Tid){iTopicDaoInterface.deleteAllBytid(Tid);};

    //返回tid对应的所有回帖列表
    public ArrayList<Reply> selectByTid(int id){return  iReplyDaoInterface.selectByTid(id);};
}
