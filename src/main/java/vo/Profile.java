package vo;

public class Profile {
    private int id;
    private String telephone;
    private String qq;
    private String job;
    private int sex;
    private int points;
    private  String nickname;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq;
    }

    public String getJob() {
        return job;
    }

    public void setJob(String job) {
        this.job = job;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    public int getPoints() {
        return points;
    }

    public void setPoints(int points) {
        this.points = points;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    @Override
    public String toString() {
        return "Profile{" +
                "id=" + id +
                ", telephone='" + telephone + '\'' +
                ", qq='" + qq + '\'' +
                ", job='" + job + '\'' +
                ", sex=" + sex +
                ", points=" + points +
                ", nickname='" + nickname + '\'' +
                '}';
    }
}
