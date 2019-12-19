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

    @Override
    //根据用户id 获得用户个人资料
    public Profile getAccountInfo(int id) {
        System.out.println("getAccountInfo service by id is running!");
        return iProfileDao.getProfileById(id);
    }

    @Override
    public void alterProfile(Profile profile) {
        System.out.println("alterProfile service by id is running!");
        iProfileDao.alterProfile(profile);
    }

    //根据用户id 删除用户个人资料
    @Override
    public void deleteProfileById(int id) {
        System.out.println("deleteProfile service by id is running!");
        iProfileDao.deleteProfile(id);
    }
}
