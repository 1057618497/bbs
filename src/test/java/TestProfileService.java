import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import service.AccountService;
import service.HomePageService;
import service.ProfileService;
import vo.BriefTopic;
import vo.HomePage;
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath*:applicationContext*.xml", "classpath*:spring/spring-mvc.xml" })

public class TestProfileService extends BaseJunit4Test{
    @Autowired
    private ProfileService profileService;
    @Test
    public void testGetNicknameBytid(){
        String name=profileService.getNameBytid(1);
        System.out.println(name);
    }

}
