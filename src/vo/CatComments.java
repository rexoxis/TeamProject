package vo;

public class CatComments {

    int catc_bdno;
    int catboard_bdno;
    String catc_userid;
    String catc_contents;
    int catc_likes;
    String catc_regdate;

    public int getCatc_bdno() {
        return catc_bdno;
    }

    public void setCatc_bdno(int catc_bdno) {
        this.catc_bdno = catc_bdno;
    }

    public int getCatboard_bdno() {
        return catboard_bdno;
    }

    public void setCatboard_bdno(int catboard_bdno) {
        this.catboard_bdno = catboard_bdno;
    }

    public String getCatc_userid() {
        return catc_userid;
    }

    public void setCatc_userid(String catc_userid) {
        this.catc_userid = catc_userid;
    }

    public String getCatc_contents() {
        return catc_contents;
    }

    public void setCatc_contents(String catc_contents) {
        this.catc_contents = catc_contents;
    }

    public int getCatc_likes() {
        return catc_likes;
    }

    public void setCatc_likes(int catc_likes) {
        this.catc_likes = catc_likes;
    }

    public String getCatc_regdate() {
        return catc_regdate;
    }

    public void setCatc_regdate(String catc_regdate) {
        this.catc_regdate = catc_regdate;
    }
}
