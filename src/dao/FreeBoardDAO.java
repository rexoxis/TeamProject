package dao;

import service.OracleUtil;
import vo.FreeBoard;
import vo.FreeComments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class FreeBoardDAO {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;


    private ArrayList<FreeBoard> lists = null;

    OracleUtil oracle = new OracleUtil();

    public ArrayList<FreeBoard> viewcontents(int bdno) {
        String viewSQL = "select bdno,title,userid,contents,views,thumbs,regdate from semilist1 where bdno = ?";

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(viewSQL);
            pstmt.setInt(1, bdno);
            rs = pstmt.executeQuery();
            //rs유무 : select문을 쓰면 excuteQuery를 써야하고 결과값이 나오기떄문에 rs를 써줘야함,
            // update,delete,insert문은 excuteUpdate를쓰며 수정,삭제이기때문에 rs가 필요없음
            lists = new ArrayList<>();

            while (rs.next()) {

                FreeBoard bd = new FreeBoard();

                bd.setBdno(rs.getInt(1));
                bd.setTitle(rs.getString(2));
                bd.setUserid(rs.getString(3));
                bd.setContents(rs.getString(4));
                bd.setViews(rs.getInt(5));
                bd.setThumbs(rs.getInt(6));
                bd.setRegdate(rs.getString(7));

                lists.add(bd);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("viewList 확인바람");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }//사용한 객체들을 연결이 끝났으면 닫아줌
        return lists;


    }
    // 게시판 총게시물 수 구하기
    public int countBoard(){
        String countSQL = "SELECT count(bdno) FROM semilist1";

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

    // 게시판 조회하기 위한 메소드
    public ArrayList<FreeBoard> viewList(String searchText, int startnum, int endnum) {
        String listSQL = "";
        if (searchText.equals("baselist")){
            listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.thumbs, rownum as rnum from " +
                    " (select bdno, title, userid, views, regdate, thumbs from semilist1 order by regdate desc) bd " +
                    " where rownum <= ?) bd2 " +
                    " where bd2.rnum >= ?";
        } else {
            listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.thumbs, rownum as rnum from " +
                    " (select bdno, title, userid, views, regdate, thumbs from semilist1 WHERE title like '%'|| ? ||'%' order by regdate desc) bd " +
                    " where rownum <= ?) bd2 " +
                    " where bd2.rnum >= ?";
        }

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(listSQL);
            if(searchText.equals("baselist")){
                pstmt.setInt(1, endnum);
                pstmt.setInt(2, startnum);
            } else {
                pstmt.setString(1, searchText);
                pstmt.setInt(2, endnum);
                pstmt.setInt(3, startnum);
            }

            rs = pstmt.executeQuery();

            lists = new ArrayList<>();

            while (rs.next()) {

                FreeBoard bd = new FreeBoard();

                bd.setBdno(rs.getInt(1));
                bd.setTitle(rs.getString(2));
                bd.setUserid(rs.getString(3));
                bd.setViews(rs.getInt(4));
                bd.setRegdate(rs.getString(5));
                bd.setThumbs(rs.getInt(6));

                lists.add(bd);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("viewList 확인바람");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }//사용한 객체들을 연결이 끝났으면 닫아줌
        return lists;
    }

    public int writeboard(FreeBoard vo, String selectbd) {
        String writeSQL = "";
        int check = 0;

        if (selectbd.equals("free")) {
            writeSQL = "insert into semilist1 (bdno,userid,title,contents) values (squ.nextval,?,?,?)";
        } else if (selectbd.equals("qna")) {
            writeSQL = "insert into QNABOARD (bdno,userid,title,contents) values (QNA_SEQ.nextval,?,?,?)";
        }

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(writeSQL);

            pstmt.setString(1, vo.getUserid());
            pstmt.setString(2, vo.getTitle());
            pstmt.setString(3, vo.getContents());

            check = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return check;
    }

    public int modifyBoard(FreeBoard vo) {
        String modifySQL = "update semilist1 set title=?, contents=? where bdno=?";
        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(modifySQL);
            pstmt.setString(1, vo.getTitle());
            pstmt.setString(2, vo.getContents());
            pstmt.setInt(3, vo.getBdno());

            check = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }

    public int deletelist(int bdno) {
        String deleteSQL = "delete from semilist1 where bdno=?";
        int isok = 0;
        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setInt(1, bdno);
            isok = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return isok;
    }

    public void viewUP(int bdno) {
        String readcntSQL = "update semilist1 set views = views+1 where bdno=?";

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

    public int LikeCnt(int bdno) {
        String likeycntSQL = "update semilist1 set thumbs = thumbs + 1 where bdno=?";
        int like = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(likeycntSQL);
            pstmt.setInt(1, bdno);
            like = pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return like;
    }

    public int commentsWrite(FreeComments rc, int frvbdno) {
        String commentsSQL = "INSERT INTO frv_comments (comt_bdno, frv_bdno, comt_userid, comt_contents) VALUES (fcomments_seq.nextval, ?, ?, ?)";
        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(commentsSQL);
            pstmt.setInt(1, frvbdno);
            pstmt.setString(2, rc.getComt_userid());
            pstmt.setString(3, rc.getComt_contents());

            check = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("commentsWrite 메소드 에러");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }

    public ArrayList<FreeComments> commentView(int frvbdno) {
        String commtViewSQL = "SELECT comt_bdno, comt_userid, comt_contents, comt_likes, comt_regdate from frv_comments WHERE frv_bdno = ? ORDER BY comt_regdate";

        ArrayList<FreeComments> fclists = null;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(commtViewSQL);
            pstmt.setInt(1, frvbdno);
            rs = pstmt.executeQuery();

            fclists = new ArrayList<>();

            while (rs.next()) {
                FreeComments fc = new FreeComments();

//                PropertySetter.setProperties(rs,rc,false,false);
                fc.setComt_bdno(rs.getInt(1));
                fc.setComt_userid(rs.getString(2));
                fc.setComt_contents(rs.getString(3));
                fc.setComt_likes(rs.getInt(4));
                fc.setComt_regdate(rs.getString(5));

                fclists.add(fc);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("boardView 메소드 에러");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return fclists;
    }

    public int deleteComment(int COMT_BDNO) {
        String deleteSQL = "delete from frv_comments where COMT_BDNO=?";
        int isok2 = 0;
        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setInt(1, COMT_BDNO);

            isok2 = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();

        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return isok2;
    }


}
