package serviceiml;

import dao.ITopicDao;
import daoiml.TopicDaoIml;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.HomePageService;
import vo.BriefTopic;
import vo.HomePage;
import vo.Topic;

import java.util.ArrayList;

@Service
public class HomePageServiceImpl implements HomePageService {
    @Autowired
    private TopicDaoIml topicDaoIml;
    @Override
    public HomePage getHomePage(HomePage hp) {
        HomePage h=topicDaoIml.getHomePage(hp);

        ArrayList<BriefTopic> list=h.getTopList();
        for(int i=0;i<list.size();i++){
            String s=list.get(i).getT();
            s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
                    s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
            list.get(i).setT(s);
            s=list.get(i).getRt();
            s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
                    s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
            list.get(i).setRt(s);
        }
        list=h.getList();
        for(int i=0;i<list.size();i++){
            String s=list.get(i).getT();
            s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
                    s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
            list.get(i).setT(s);
            s=list.get(i).getRt();
            s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
                    s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
            list.get(i).setRt(s);
        }
        return h;
    }
}
