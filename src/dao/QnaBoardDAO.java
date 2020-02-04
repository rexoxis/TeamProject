package dao;

import service.OracleUtil;
import vo.QnaComments;
import vo.QnaBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class QnaBoardDAO {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    OracleUtil oracle = new OracleUtil();

    //게시판 글 목록 보기

    public ArrayList<QnaBoard> qnalist(String searchText, int startnum, int endnum) {

        String qnalistSQL = "";

        if (searchText.equals("baselist")){
            qnalistSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.thumb, rownum as rnum from " +
                    " (select bdno, title, userid, views, regdate, thumb from qnaboard order by regdate desc) bd " +
                    " where rownum <= ?) bd2 " +
                    " where bd2.rnum >= ?";
        } else {
            qnalistSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.thumb, rownum as rnum from " +
                    " (select bdno, title, userid, views, regdate, thumb from qnaboard WHERE title like '%'|| ? ||'%' order by regdate desc) bd " +
                    " where rownum <= ?) bd2 " +
                    " where bd2.rnum >= ?";
        }

        ArrayList<QnaBoard> qList = new ArrayList<>();

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(qnalistSQL);

            if(searchText.equals("baselist")){
                pstmt.setInt(1, endnum);
                pstmt.setInt(2, startnum);
            } else {
                pstmt.setString(1, searchText);
                pstmt.setInt(2, endnum);
                pstmt.setInt(3, startnum);
            }
            rs = pstmt.executeQuery();

            while (rs.next()) {
                QnaBoard qb = new QnaBoard();
                qb.setBdno(rs.getInt(1));
                qb.setTitle(rs.getString("title"));
                qb.setUserid(rs.getString("userid"));
                qb.setViews(rs.getInt("views"));
                qb.setRegdate(rs.getString("regdate"));
                qb.setThumb(rs.getInt("thumb"));

                qList.add(qb);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("오류가 나는 구만");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return qList; //viewList에 담아서 호출한 곳에 가서 뿌려 줘야 해서 리턴값
    }

    // 게시판 총게시물 수 구하기
    public int countBoard(){
        String countSQL = "SELECT count(bdno) FROM qnaboard";

        int countbd = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(countSQL);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                countbd = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("countBoard 메소드 확인");
        } finally {
            oracle.closeConn(pstmt,conn);
        }
        return countbd;
    }

    public ArrayList<QnaBoard> views(int bdno) {
        String viewsSQL = "SELECT BDNO,userid,TITLE,CONTENTS FROM QnaBoard WHERE BDNO =?";

        ArrayList<QnaBoard> viewList = new ArrayList<>();

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(viewsSQL);
            pstmt.setInt(1, bdno); //LIST에서 받아온 BDNO는 위에 VIEWS 메서드에 담겨 있는데 그것을 커리문에 넣겠다 라는 뜻
            rs = pstmt.executeQuery();

            while (rs.next()) {
                QnaBoard qb = new QnaBoard();
                qb.setBdno(rs.getInt("bdno")); //컬럼명을 가져오기 때문에 따옴표를 해줘야함
                qb.setUserid(rs.getString("userid"));
                qb.setTitle(rs.getString("title"));
                qb.setContents(rs.getString("Contents"));

                viewList.add(qb);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("오류가 나는 구만");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return viewList; //viewList에 담아서 호출한 곳에 가서 뿌려 줘야 해서 리턴값
    }

    public int writeAction(QnaBoard qb, String selectbd) {
        String writeSQL = "";

        if (selectbd.equals("free")) {
            writeSQL = "insert into semilist1 (bdno,userid,title,contents) values (squ.nextval,?,?,?)";
        } else if (selectbd.equals("qna")) {
            writeSQL = "insert into QNABOARD (bdno,userid,title,contents) values (QNA_SEQ.nextval,?,?,?)";
        }

        int isOk = 0;
        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(writeSQL);

            pstmt.setString(1, qb.getUserid());
            pstmt.setString(2, qb.getTitle());
            pstmt.setString(3, qb.getContents());
            isOk = pstmt.executeUpdate(); //여기에 담아서 보내주기 때문에

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("값 입력하기");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return isOk;
    }

    public int modifyQnaList(QnaBoard qb) {
        String modipySQL = "update QNABOARD set TITLE=?,CONTENTS=? where BDNO=?";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(modipySQL);
            pstmt.setString(1, qb.getTitle());
            pstmt.setString(2, qb.getContents());
            pstmt.setInt(3, qb.getBdno());

            check = pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("modipyBoard 확인바람");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }


    //게시판 삭제
    public int deleteqnaList(int bdno) { //delete.jsp에서 받아온 bdno 임
        String deleteSQL = "DELETE FROM QnaBoard  WHERE BDNO = ?";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setInt(1, bdno);

            check = pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("삭제가 안되는 구만");
        } finally {
            oracle.closeConn(pstmt, conn);
        }

        return check;

    }

    // 조회수 증가
    public void ReadCnt(int bdno) {
        String readcntSQL = "update QNABOARD set views = views+1 where bdno=?";

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(readcntSQL);
            pstmt.setInt(1, bdno);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            oracle.closeConn(pstmt, conn);
        }

    }

    // 추천수 증가
    public int LikeCnt(int bdno) {
        String likeycntSQL = "update QNABOARD set thumb = thumb + 1 where BDNO=?";
        int like = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(likeycntSQL);
            pstmt.setInt(1, bdno);
            like = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return like;

    }

    // 댓글쓰기
    public int commentsWrite(QnaComments qc, int qavbdno) {
        String commentsSQL = "INSERT INTO qna_comments (comt_bdno, qav_bdno, comt_userid, comt_contents) VALUES (comments_seq.nextval, ?, ?, ?)";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(commentsSQL);
            pstmt.setInt(1, qavbdno);
            pstmt.setString(2, qc.getComt_userid());
            pstmt.setString(3, qc.getComt_contents());

            check = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("commentsWrite 메소드 에러");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }

    // 게시판 댓글 보기
    public ArrayList<QnaComments> commentView(int qavbdno) {
        String commtViewSQL = "SELECT comt_bdno, qav_bdno, comt_userid, comt_contents, comt_likes, comt_regdate from qna_comments WHERE qav_bdno = ? ORDER BY comt_regdate";

        ArrayList<QnaComments> qclists = null;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(commtViewSQL);
            pstmt.setInt(1, qavbdno);
            rs = pstmt.executeQuery();

            qclists = new ArrayList<>();

            while (rs.next()) {
                QnaComments qc = new QnaComments();

                qc.setComt_bdno(rs.getInt(1));
                qc.setQav_bdno(rs.getInt(2));
                qc.setComt_userid(rs.getString(3));
                qc.setComt_contents(rs.getString(4));
                qc.setComt_likes(rs.getInt(5));
                qc.setComt_regdate(rs.getString(6));

                qclists.add(qc);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("boardView 메소드 에러");
        } finally {
            oracle.closeConn(pstmt, conn);
        }

        return qclists;
    }

    // 댓글 삭제
    public int deleteComment(int Comment_bdno) {
        String deleteSQL = "delete from qna_comments where comt_bdno=?";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setInt(1, Comment_bdno);

            check = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return check;
    }

}




