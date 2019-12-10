package vo;

import java.util.ArrayList;

public class HomePage {
    private String[] tag={"upTime","click","reply","re_time"};
    private int totalNum;//帖子总数
    private int now;//当前第几页
    private ArrayList<BriefTopic> topList;//置顶帖list
    private ArrayList<BriefTopic> list;//非置顶
    private int num=10;//一页帖子数
    private int tType;//显示帖子类型 0 交流; 1 需求; 2全部
    private int sType;//排序类型 0 发布时间; 1 点击数; 2 回复数 ; 3 最新回复时间; 4精华
    private int end;//结束号
    private int start;//开始号
    private String sortType;

    public String getSortType() {
        return sortType;
    }

    public void setSortType(String sortType) {
        this.sortType = sortType;
    }

    public String[] getTag() {
        return tag;
    }

    public int getEnd() {
        return end;
    }

    public void setEnd(int end) {
        this.end = end;
    }

    public int getStart() {
        return start;
    }

    public void setStart(int start) {
        this.start = start;
    }

    public void setTag(String[] tag) {
        this.tag = tag;
    }

    public int gettType() {
        return tType;
    }

    public void settType(int tType) {
        this.tType = tType;
    }

    public int getsType() {
        return sType;
    }

    public void setsType(int sType) {
        this.sType = sType;
    }

    public int getTotalNum() {
        return totalNum;
    }

    public void setTotalNum(int totalNum) {
        this.totalNum = totalNum;
    }

    public int getNow() {
        return now;
    }

    public void setNow(int now) {
        this.now = now;
    }

    public ArrayList<BriefTopic> getTopList() {
        return topList;
    }

    public void setTopList(ArrayList<BriefTopic> topList) {
        this.topList = topList;
    }

    public ArrayList<BriefTopic> getList() {
        return list;
    }

    public void setList(ArrayList<BriefTopic> list) {
        this.list = list;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }
}
