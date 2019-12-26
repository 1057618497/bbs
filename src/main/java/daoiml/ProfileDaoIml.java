package daoiml;

import dao.IProfileDao;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import vo.Profile;

public class ProfileDaoIml extends SqlSessionDaoSupport implements IProfileDao {
    //用户id 拿到用户信息
    @Override
    public Profile getProfileById(int id) {
        return null;
    }

    @Override
    public void updateProfilePoints5(int tid) {

    }

    @Override
    public void updateProfilePoints3(int tid) {

    }

    @Override
    public void updateProfilePoints(int tid, int points) {

    }

    //系统提示加的默认重写方法  guan
    @Override
    public void updateProfile(Profile p) {

    }

    //系统提示加的默认重写方法  guan
    @Override
    public void deleteProfile(int id) {

    }

    //添加用户信息 guan
    @Override
    public int insertProfile(Profile profile){ return 0;}

    // public void insertProfile(Profile profile){ }

    @Override
    public void alterProfile(Profile profile) { }

    @Override
    public Profile getProfileBytid(int id) {
        return null;
    }


}
