package serviceiml;

import dao.ITopicDao;
import daoiml.TopicDaoIml;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.HomePageService;
import vo.HomePage;
@Service
public class HomePageServiceImpl implements HomePageService {
    @Autowired
    private TopicDaoIml topicDaoIml;
    @Override
    public HomePage getHomePage(HomePage hp) {
        HomePage h=topicDaoIml.getHomePage(hp);
        return h;
    }
}
