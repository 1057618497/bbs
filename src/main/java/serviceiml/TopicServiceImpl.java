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
}
