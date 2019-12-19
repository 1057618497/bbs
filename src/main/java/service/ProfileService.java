package service;

import vo.Profile;

public interface ProfileService {
    //帖子id 获取用户id的昵称
    public String getNameBytid(int id);

    //用户信息 添加用户信息
    public void insertProfile(Profile profile);

    //根据用户id 获得用户个人资料
    public Profile getAccountInfo(int id);

    //根据用户id，修改用户个人资料
    public void alterProfile(Profile profile);

    //根据用户id，删除用户个人资料
    public void deleteProfileById(int id);
}
