package vo;

import java.util.ArrayList;

public class TopicView {
    private Topic t;//主贴

    private ArrayList<Unit> reList;//回帖列表
   // private ArrayList<String> reNameList;
    private String name;//昵称



    public ArrayList<Unit> getReNameList() {
        return reList;
    }

    public void setReNameList(ArrayList<Unit> reNameList) {
        this.reList = reNameList;
    }

    public Topic getT() {
        return t;
    }

    public void setT(Topic t) {
        this.t = t;
    }

    public ArrayList<Unit> getReList() {
        return reList;
    }

    public void setReList(ArrayList<Unit> reList) {
        this.reList = reList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }


}
