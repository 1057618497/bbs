import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import service.AccountService;
import service.HomePageService;
import service.TopicService;
import vo.Account;
import vo.BriefTopic;
import vo.HomePage;
import vo.Topic;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath*:applicationContext*.xml", "classpath*:spring/spring-mvc.xml" })
public class TestHPService extends BaseJunit4Test {
    @Autowired
    private HomePageService homePageService;
    @Autowired
    private AccountService accountService;
    @Autowired
    private TopicService topicService;

    @Test
    public void test1() {
        Topic t;
        t=topicService.getTopicBytid(20);
        System.out.println(t);
    }
    @Test
    public void test(){
        HomePage hp=new HomePage();
        hp.setsType(0);
        hp.setNow(0);
        hp.settType(2);
        //hp.
        hp=this.homePageService.getHomePage(hp);
        System.out.println("toplist");
        for(BriefTopic b:hp.getTopList())
            System.out.println(b.toString());
        System.out.println("normallist");
        for(BriefTopic b:hp.getList())
            System.out.println(b.toString());
    }
}
