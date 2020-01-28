package vo;

public class RevComments {

    int comt_bdno;
    int rev_bdno;
    String comt_userid;
    String comt_contents;
    int comt_likes;
    String comt_regdate;

    public int getComt_bdno() {
        return comt_bdno;
    }

    public void setComt_bdno(int comt_bdno) {
        this.comt_bdno = comt_bdno;
    }

    public int getRev_bdno() {
        return rev_bdno;
    }

    public void setRev_bdno(int rev_bdno) {
        this.rev_bdno = rev_bdno;
    }

    public String getComt_userid() {
        return comt_userid;
    }

    public void setComt_userid(String comt_userid) {
        this.comt_userid = comt_userid;
    }

    public String getComt_contents() {
        return comt_contents;
    }

    public void setComt_contents(String comt_contents) {
        this.comt_contents = comt_contents;
    }

    public int getComt_likes() {
        return comt_likes;
    }

    public void setComt_likes(int comt_likes) {
        this.comt_likes = comt_likes;
    }

    public String getComt_regdate() {
        return comt_regdate;
    }

    public void setComt_regdate(String comt_regdate) {
        this.comt_regdate = comt_regdate;
    }
}
