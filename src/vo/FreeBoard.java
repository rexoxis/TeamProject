package vo;

public class semilist1 {
    private int bdno;
    private String userid;
    private String title;
    private String contents;
    private int views;
    private int thumbs;
    private String regdate;

    public void setThumbs(int thumbs) {
        this.thumbs = thumbs;
    }

    public int getThumbs() {

        return thumbs;
    }

    public void setBdno(int bdno) {
        this.bdno = bdno;
    }

    public void setUserid(String userid) {
        this.userid = userid;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setContents(String contents) {
        this.contents = contents;
    }



    public void setRegdate(String regdate) {
        this.regdate = regdate;
    }

    public int getBdno() { return bdno; }

    public String getUserid() {
        return userid;
    }

    public String getTitle() {
        return title;
    }

    public String getContents() {
        return contents;
    }

    public String getRegdate() {
        return regdate;
    }


    public void setViews(int views) {
        this.views = views;
    }

    public int getViews() {

        return views;
    }
}
