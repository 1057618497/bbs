package daoiml;

import dao.IProfileDao;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import vo.Profile;

public class ProfileDaoIml extends SqlSessionDaoSupport implements IProfileDao {
    @Override
    public Profile getProfileBytid(int id) {
        return null;
    }

    //系统提示加的默认重写方法  guan
    @Override
    public void updateProfile(Profile p) {

    }

    //系统提示加的默认重写方法  guan
    //系统提示加的默认重写方法  guan
    @Override
    public void deleteProfile(int id) {

    }

    //添加用户信息 guan
    @Override
    public void insertProfile(Profile profile){ }
}
