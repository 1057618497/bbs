package service;

import vo.Profile;

public interface ProfileService {
    //发帖 积分+5
    public void updatePoints5(int tid);

    //回帖 积分+3
    public void updatePoints3(int tid);

    //修改积分
    public void updatePoints(int tid,int points);


    //帖子id 获取用户id的昵称
    public String getNameBytid(int id);

    //用户信息 添加用户信息
    public void insertProfile(Profile profile);

    //用户id 获取用户信息
    public Profile getProfileByuid(int id);

    public String getnicknameByuid(int id);
}
