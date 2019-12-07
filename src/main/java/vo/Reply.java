package vo;

public class Reply {
    private int rid;//回帖id
    private int tid;//主贴id
    private int ridOfMan;//回帖人id
    private String reTime;//回帖时间
    private String content;//回帖内容

    public int getRid() {
        return rid;
    }

    public void setRid(int rid) {
        this.rid = rid;
    }

    public int getTid() {
        return tid;
    }

    public void setTid(int tid) {
        this.tid = tid;
    }

    public int getRidOfMan() {
        return ridOfMan;
    }

    public void setRidOfMan(int ridOfMan) {
        this.ridOfMan = ridOfMan;
    }

    public String getReTime() {
        return reTime;
    }

    public void setReTime(String reTime) {
        this.reTime = reTime;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }
}
