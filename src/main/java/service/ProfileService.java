package service;

import vo.Profile;

public interface ProfileService {
    //帖子id 获取用户id的昵称
    public String getNameBytid(int id);

    //用户信息 添加用户信息
    public void insertProfile(Profile profile);
}
