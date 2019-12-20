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
    public Profile getProfileByuid(int id) {
        return iProfileDao.getProfileBytid(id);
    }

    @Override
    public String getnicknameByuid(int id) {
       Profile p= iProfileDao.getProfileBytid(id);
       if(p==null)
           return String.valueOf(p.getId());
       else return p.getNickname();
    }
}
