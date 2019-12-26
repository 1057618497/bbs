package serviceiml;

import dao.IDraftDao;
import dao.IReplyDao;
import dao.ITopicDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import service.TopicService;
import vo.Draft;
import vo.Reply;
import vo.Topic;

import java.util.ArrayList;
@Service("TopicService")
public class TopicServiceImpl implements TopicService {
    @Autowired
    IReplyDao iReplyDao;


    @Qualifier("TopicDaoIml")
    @Autowired
    ITopicDao iTopicDao;

    @Qualifier("ITopicDao")
    @Autowired
    ITopicDao iTopicDaoInterface;

//<<<<<<< HEAD
    @Autowired
    IDraftDao iDraftDao;


    @Override
    public ArrayList<Topic> getSearchContentTopicList(String search) {
        //取出所有主贴
        ArrayList<Topic> list=iTopicDaoInterface.selectTopicList();
        ArrayList<Topic> relist=new ArrayList<>();
        //选择含有搜索内容标题
        for(int i=0;i<list.size();i++){
            String title=list.get(i).getTitle();
            int index=title.indexOf(search);
            if(index!=-1){
                title=title.replace(search,"<b color=\"red\">"+search+"</b>");
                list.get(i).setTitle(title);

                String s=list.get(i).getUpTime();
                s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
                        s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
                list.get(i).setUpTime(s);
                relist.add(list.get(i));
            }
        }


        return relist;
    }

    @Override
    public void updateReply(Reply re) {
        String time=re.getReTime();
        int rid=re.getRidOfMan();
        int tid=re.getTid();
        iTopicDaoInterface.updateReply(time,tid,rid);
    }

    //帖子回复数+1
    public void updateReplyNum(int tid) {
            iTopicDaoInterface.updateReplyNum(tid);
    }

    //帖子浏览数+1
    public void updateClickNum(int tid) {
        iTopicDaoInterface.updateClickNum(tid);
    }
//=======
    @Qualifier("IReplyDao")
    @Autowired
    IReplyDao iReplyDaoInterface;
//>>>>>>> 5f15f4b0649d336066de2af2d7bcac271c36e352

    //发新帖
    @Override
    public void newTopic(Topic  t){
        iTopicDao.insertTopic(t);
    }

    @Override
    public boolean modifyTopic(Topic t) {
        iTopicDaoInterface.updateTopic(t);
        return true;
    }

    @Override
    public void modifyTopicPoints(int point, int tid) {
        iTopicDaoInterface.updateTopicPoints(point,tid);
    }

    @Override
    public Topic getTopicBytid(int id) {
        return iTopicDao.selectTopicBytid(id);
    }

    @Override
    public boolean deleteTopicBytid(int tid) {
        if(iTopicDaoInterface.deleteTopicBytid(tid)!=0
            &&iTopicDaoInterface.deleteTopicInfoBytid(tid)!=0
            &&iTopicDaoInterface.deleteTopicReBytid(tid)!=0)
            return true;
        return false;
    }

    @Override
    public ArrayList<Reply> getReListBytid(int id) {
        return iReplyDao.selectByTid(id);
    }

//<<<<<<< HEAD
    @Override
    public ArrayList<Reply> getReListByid(int id) {
        ArrayList<Reply> list=iReplyDao.selectByid(id);
        for(int i=0;i<list.size();i++){
            String s=list.get(i).getReTime();
            s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
                    s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
            list.get(i).setReTime(s);
        }
        return list;
    }

    @Override
    public ArrayList<Draft> getDraftListByid(int id) {
        ArrayList<Draft>list=iDraftDao.selectAllDraftByid(id);
        for(int i=0;i<list.size();i++){
            String s=list.get(i).getSave_time();
            s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
                    s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
            list.get(i).setSave_time(s);
        }
        return list;
    }

    @Override
    public ArrayList<Topic> getListByid(int id) {
        ArrayList<Topic>list=iTopicDaoInterface.selectByid(id);
        for(int i=0;i<list.size();i++){
            String s=list.get(i).getUpTime();
            s=s.substring(0,4)+'-'+s.substring(4,6)+'-'+s.substring(6,8)+' '+
                    s.substring(8,10)+':'+s.substring(10,12)+':'+s.substring(12,14);
            list.get(i).setUpTime(s);
        }
        return list;
    }



    @Override
    public boolean newDraft(Draft draft) {
        int i=0;
        i=iDraftDao.insertDraft(draft);
        if(i==0)
        return false;
        else
            return true;
    }

    @Override
    public Draft getDraftBydid(int did) {
        return iDraftDao.selectDraftBydid(did);
    }

    @Override
    public boolean modifyDraft(Draft draft) {
        if(iDraftDao.setDraft(draft)!=0)
            return true;
        return false;
    }

    @Override
    public boolean deleteDraft(int did) {
        if(iDraftDao.deleteDraftBydid(did)!=0)
            return true;
        return false;
    }

    @Override
    public void newReply(Reply reply){
        iReplyDao.insertReply(reply);
    }

    @Override
    public boolean deleteReply(int rid) {
        if(iReplyDao.deleteReplyByrid(rid)!=0)
            return true;
        return false;
    }

    @Override
    public void deleteReplyBytid(int tid) {
        iReplyDao.deleteTopicBytid(tid);
    }
//=======
    //获取所有帖子
    @Override
    public ArrayList<Topic> selectTopicList(){return iTopicDaoInterface.selectTopicList();}

    //删除rid对应的回帖
    public void deleteReplyByrid(int rid){iReplyDaoInterface.deleteReplyByrid(rid);};

    //返回用户Id对应的所有主贴
    public ArrayList<Topic> TselectByid(int id){return iTopicDaoInterface.TselectByid(id);};

    //返回用户Id对应的所有回帖
    public ArrayList<Reply> selectByid(int id){return  iReplyDaoInterface.selectByid(id);};

    //删除用户所有主贴
    public void deleteAllT(int id){iTopicDaoInterface.deleteAllT(id);};

    //删除用户id对应的所有回帖
    public void deleteAllR(int id){iReplyDaoInterface.deleteAllR(id);};

    //加精操作
    public void updatejing(int jing,int Tid){iTopicDaoInterface.updatejing(jing,Tid);};

    //置顶操作
    public void updateadd_top(int add_top,int Tid){iTopicDaoInterface.updateadd_top(add_top,Tid);};

    //删除tid对应的所有主贴和回帖
    public  void deleteAllBytid(int Tid){iTopicDaoInterface.deleteAllBytid(Tid);};

    //返回tid对应的所有回帖列表
    public ArrayList<Reply> selectByTid(int id){return  iReplyDaoInterface.selectByTid(id);};
//>>>>>>> 5f15f4b0649d336066de2af2d7bcac271c36e352
}
