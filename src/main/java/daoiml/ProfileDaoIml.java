package daoiml;

import dao.IProfileDao;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import vo.Profile;

public class ProfileDaoIml extends SqlSessionDaoSupport implements IProfileDao {
    @Override
    public Profile getProfileBytid(int id) {
        return null;
    }

    //添加用户信息 guan
    @Override
    public void insertProfile(Profile profile){ }
}
