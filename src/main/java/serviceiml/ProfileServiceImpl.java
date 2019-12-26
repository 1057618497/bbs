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
    public void updatePoints5(int tid) {
        iProfileDao.updateProfilePoints5(tid);
    }

    @Override
    public void updatePoints3(int tid) {
        iProfileDao.updateProfilePoints3(tid);
    }

    @Override
    public void updatePoints(int tid, int points) {
        iProfileDao.updateProfilePoints(tid,points);
    }

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
//<<<<<<< HEAD
    public Profile getProfileByuid(int id) {
        return iProfileDao.getProfileBytid(id);
    }

    @Override
    public String getnicknameByuid(int id) {
        Profile p = iProfileDao.getProfileBytid(id);
        if (p == null)
            return String.valueOf(p.getId());
        else return p.getNickname();
    }
//=======
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
//>>>>>>> 5f15f4b0649d336066de2af2d7bcac271c36e352
    }
}
