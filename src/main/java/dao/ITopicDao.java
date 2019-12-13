package dao;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import vo.*;

import java.util.ArrayList;

@Repository
public interface ITopicDao {


    //主贴id索引主贴信息
    public Topic selectTopicBytid(int tid);

    //添加主贴
    public void insertTopic(Topic t);

    public HomePage getHomePage(HomePage hp);

    //返回用户id 的所有主贴
    public ArrayList<Topic> selectByid(int id);
}
