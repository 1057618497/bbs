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

//<<<<<<< HEAD
    //用户id 获取用户信息
    public Profile getProfileByuid(int id);

    public String getnicknameByuid(int id);
//=======
    //根据用户id 获得用户个人资料
    public Profile getAccountInfo(int id);

    //根据用户id，修改用户个人资料
    public void alterProfile(Profile profile);

    //根据用户id，删除用户个人资料
    public void deleteProfileById(int id);
//>>>>>>> 5f15f4b0649d336066de2af2d7bcac271c36e352
}
