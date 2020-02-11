package vo;


public class AnwserBoard {
    private int anwser_bdno;
    private int qnaboard_bdno;
    private String anwser_userid;
    private String anwser_title;
    private String anwser_contents;
    private int anwser_views;
    private String anwser_regdate;

    public int getAnwser_views() {
        return anwser_views;
    }

    public void setAnwser_views(int anwser_views) {
        this.anwser_views = anwser_views;
    }

    public int getAnwser_bdno() {
        return anwser_bdno;
    }

    public void setAnwser_bdno(int anwser_bdno) {
        this.anwser_bdno = anwser_bdno;
    }

    public int getQnaboard_bdno() {
        return qnaboard_bdno;
    }

    public void setQnaboard_bdno(int qnaboard_bdno) {
        this.qnaboard_bdno = qnaboard_bdno;
    }

    public String getAnwser_userid() {
        return anwser_userid;
    }

    public void setAnwser_userid(String anwser_userid) {
        this.anwser_userid = anwser_userid;
    }

    public String getAnwser_title() {
        return anwser_title;
    }

    public void setAnwser_title(String anwser_title) {
        this.anwser_title = anwser_title;
    }

    public String getAnwser_contents() {
        return anwser_contents;
    }

    public void setAnwser_contents(String anwser_contents) {
        this.anwser_contents = anwser_contents;
    }

    public String getAnwser_regdate() {
        return anwser_regdate;
    }

    public void setAnwser_regdate(String anwser_regdate) {
        this.anwser_regdate = anwser_regdate;
    }
}
