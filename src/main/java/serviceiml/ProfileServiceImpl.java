package serviceiml;

import dao.IAccountdao;
import dao.IProfileDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import service.ProfileService;
import vo.Profile;
@Service("ProfileService")
public class ProfileServiceImpl implements ProfileService {
    @Autowired
    private IProfileDao iProfileDao;
    @Override
    //帖子id 获取用户名
    public String getNameBytid(int id) {
//        int uid=id;
//        Profile p=iProfileDao.getProfileBytid(uid);
//        return p.getNickname();
        return null;
    }

    @Override
    //用户信息 添加用户信息
    public void insertProfile(Profile profile){
        System.out.println("insertProfile service is running!");
        iProfileDao.insertProfile(profile);
    }
}
