package vo;

import java.util.ArrayList;

public class TopicView {
    private Topic t;//主贴
    private ArrayList<Reply> reList;//回帖列表
    private String name;//昵称

    public Topic getT() {
        return t;
    }

    public void setT(Topic t) {
        this.t = t;
    }

    public ArrayList<Reply> getReList() {
        return reList;
    }

    public void setReList(ArrayList<Reply> reList) {
        this.reList = reList;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
