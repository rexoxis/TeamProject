package vo;

public class DogComments {

    int dogc_bdno;
    int dogboard_bdno;
    String dogc_userid;
    String dogc_contents;
    int dogc_likes;
    String dogc_regdate;

    public int getDogc_bdno() {
        return dogc_bdno;
    }

    public void setDogc_bdno(int dogc_bdno) {
        this.dogc_bdno = dogc_bdno;
    }

    public int getDogboard_bdno() {
        return dogboard_bdno;
    }

    public void setDogboard_bdno(int dogboard_bdno) {
        this.dogboard_bdno = dogboard_bdno;
    }

    public String getDogc_userid() {
        return dogc_userid;
    }

    public void setDogc_userid(String dogc_userid) {
        this.dogc_userid = dogc_userid;
    }

    public String getDogc_contents() {
        return dogc_contents;
    }

    public void setDogc_contents(String dogc_contents) {
        this.dogc_contents = dogc_contents;
    }

    public int getDogc_likes() {
        return dogc_likes;
    }

    public void setDogc_likes(int dogc_likes) {
        this.dogc_likes = dogc_likes;
    }

    public String getDogc_regdate() {
        return dogc_regdate;
    }

    public void setDogc_regdate(String dogc_regdate) {
        this.dogc_regdate = dogc_regdate;
    }
}