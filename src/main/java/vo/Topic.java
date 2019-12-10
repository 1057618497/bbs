package vo;

public class Topic {
    private int tid;//帖子id
    private int id;//作者id
    private String upTime;//发布时间
    private String title;//标题
    private String content;//内容
    private int require;//是否为需求 1为需求
    private int points;//积分
    private int replyNum;//回复数
    private int clickNum;//点击数
    private int jing;
    private int add_top;

    public int getJing() {
        return jing;
    }

    public void setJing(int jing) {
        this.jing = jing;
    }

    public int getAdd_top() {
        return add_top;
    }

    public void setAdd_top(int add_top) {
        this.add_top = add_top;
    }

    public int getReplyNum() {
        return replyNum;
    }

    public void setReplyNum(int replyNum) {
        this.replyNum = replyNum;
    }

    public int getClickNum() {
        return clickNum;
    }

    public void setClickNum(int clickNum) {
        this.clickNum = clickNum;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUpTime() {
        return upTime;
    }

    public void setUpTime(String upTime) {
        this.upTime = upTime;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRequire() {
        return require;
    }

    public void setRequire(int require) {
        this.require = require;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    @Override
    public String toString() {
        return "Topic{" +
                "tid=" + tid +
                ", id=" + id +
                ", upTime='" + upTime + '\'' +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", require=" + require +
                ", points=" + points +
                ", replyNum=" + replyNum +
                ", clickNum=" + clickNum +
                ", jing=" + jing +
                ", add_top=" + add_top +
                '}';
    }
}
