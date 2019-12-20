package vo;

public class BriefTopic {//主页浏览帖子
    private int type; //帖子类型 0 交流; 1 需求; 2 需求已解决
    private int id; //帖子id
    private String title;//标题
    private String author;//作者名
    private String t;//发布时间
    private int replyNum;//回复数
    private int clickNum;//点击数
    private String recentReName;//最新回复人
    private String rt;//最新回复时间
    private int points;//积分
    private int jing;//加精

    public int getJing() {
        return jing;
    }

    public void setJing(int jing) {
        this.jing = jing;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getT() {
        return t;
    }

    public void setT(String t) {
        this.t = t;
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

    public String getRecentReName() {
        return recentReName;
    }

    public void setRecentReName(String recentReName) {
        this.recentReName = recentReName;
    }

    public String getRt() {
        return rt;
    }

    public void setRt(String rt) {
        this.rt = rt;
    }

    @Override
    public String toString() {
        return "BriefTopic{" +
                "type=" + type +
                ", id=" + id +
                ", title='" + title + '\'' +
                ", author='" + author + '\'' +
                ", t='" + t + '\'' +
                ", replyNum=" + replyNum +
                ", clickNum=" + clickNum +
                ", recentReName='" + recentReName + '\'' +
                ", rt='" + rt + '\'' +
                '}';
    }
}
