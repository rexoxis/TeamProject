package dao;

import service.OracleUtil;
import service.PropertySetter;
import vo.CatBoard;
import vo.CatComments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class CatBoardDAO {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs;

    OracleUtil oracle = new OracleUtil();

    // 게시판 글쓰기 - 옵션태그 선택에 따라 해당 게시판에 insert
    public int catWrite(Map<String, String> frmdata, String selectbd) {

        String writeSQL = "";
        // 선택한 해당 게시판에 insert
        switch (selectbd) {
            case "free":
                writeSQL = "INSERT into freeboard (bdno, userid, title, contents, file1, file2, file3, file4, file5) VALUES (SQU.nextval,?,?,?,?,?,?,?,?)";
                break;
            case "dog":
                writeSQL = "INSERT into dogboard (bdno, userid, title, contents, file1, file2, file3, file4, file5) VALUES (DOGC_SEQ.nextval,?,?,?,?,?,?,?,?)";
                break;
            case "cat":
                writeSQL = "INSERT into catboard (bdno, userid, title, contents, file1, file2, file3, file4, file5) VALUES (catc_seq.nextval,?,?,?,?,?,?,?,?)";
                break;
            case "qna":
                writeSQL = "INSERT into qnaboard (bdno, userid, title, contents, file1, file2, file3, file4, file5) VALUES (QNA_SEQ.nextval,?,?,?,?,?,?,?,?)";
                break;
            case "review":
                writeSQL = "INSERT into reviewboard (bdno, userid, title, contents, file1, file2, file3, file4, file5) VALUES (review_seq.nextval,?,?,?,?,?,?,?,?)";
                break;
        }

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(writeSQL);
            pstmt.setString(1, frmdata.get("userid"));
            pstmt.setString(2, frmdata.get("title"));
            pstmt.setString(3, frmdata.get("contents"));
            pstmt.setString(4, frmdata.get("file1"));
            pstmt.setString(5, frmdata.get("file2"));
            pstmt.setString(6, frmdata.get("file3"));
            pstmt.setString(7, frmdata.get("file4"));
            pstmt.setString(8, frmdata.get("file5"));

            check = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("boardWrite 메소드 에러");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }

    public ArrayList<CatBoard> catList(HashMap<String, String> searchList, int startnum, int endnum) {
        String listSQL = "";
        String val = "";

        for (String key : searchList.keySet()) {
            switch (key) {
                case "title" :
                    listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.file1, rownum as rnum from " +
                            " (select bdno, title, userid, views, regdate, file1 from catboard WHERE title like '%'|| ? ||'%' order by regdate desc) bd " +
                            " where rownum <= ?) bd2 " +
                            " where bd2.rnum >= ?";
                    break;
                case "contents":
                    listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.file1, rownum as rnum from " +
                            " (select bdno, title, userid, views, regdate, file1 from catboard WHERE contents like '%'|| ? ||'%' order by regdate desc) bd " +
                            " where rownum <= ?) bd2 " +
                            " where bd2.rnum >= ?";
                    break;
                case "userid" :
                    listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.file1, rownum as rnum from " +
                            " (select bdno, title, userid, views, regdate, file1 from catboard WHERE userid like '%'|| ? ||'%' order by regdate desc) bd " +
                            " where rownum <= ?) bd2 " +
                            " where bd2.rnum >= ?";
                    break;
                case "selected" :
                    listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.file1, rownum as rnum from " +
                            " (select bdno, title, userid, views, regdate, file1 from catboard order by regdate desc) bd " +
                            " where rownum <= ?) bd2 " +
                            " where bd2.rnum >= ?";
                    break;
            }
            val = searchList.get(key);
//            System.out.println("jsp페이지에서 넘어온 option 태그 값 : " + key);
        }

//        System.out.println("jsp페이지에서 넘어온 검색어 : " + val);

        ArrayList<CatBoard> dblists = null;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(listSQL);

            // key에 해당하는 value 값이 있을때 작동
            if (!val.equals("")){
                pstmt.setString(1, val);
                pstmt.setInt(2, endnum);
                pstmt.setInt(3, startnum);
            } else {
                pstmt.setInt(1, endnum);
                pstmt.setInt(2, startnum);
            }

            rs = pstmt.executeQuery();

            dblists = new ArrayList<>();

            while (rs.next()) {
                CatBoard db = new CatBoard();

                PropertySetter.setProperties(rs, db, false, false);

                dblists.add(db);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("baardList 메소드 에러");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return dblists;
    }

    // 게시글 수정
    public int modifyView(Map<String, String> frmdata, int bdno) {
        String modifySQL = "UPDATE catboard SET title = ?, contents = ?, file1 = ?, file2 = ?, file3 = ?, file4 = ?, file5 = ? WHERE bdno = ?";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(modifySQL);
            pstmt.setString(1, frmdata.get("title"));
            pstmt.setString(2, frmdata.get("contents"));
            pstmt.setString(3, frmdata.get("file1"));
            pstmt.setString(4, frmdata.get("file2"));
            pstmt.setString(5, frmdata.get("file3"));
            pstmt.setString(6, frmdata.get("file4"));
            pstmt.setString(7, frmdata.get("file5"));
            pstmt.setInt(8, bdno);

            check = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("modifyView 메소드 확인");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }

    // 게시판 총게시물 수 구하기
    public int countBoard(){
        String countSQL = "SELECT count(bdno) FROM catboard";

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


    // 게시판 게시글 상세보기
    public ArrayList<CatBoard> catView(int bdno) {
        String viewSQL = "SELECT bdno,userid,title,contents,views,likes,regdate,file1,file2,file3,file4,file5 FROM catboard WHERE bdno = ? order by bdno desc";

        ArrayList<CatBoard> cblists = null;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(viewSQL);
            pstmt.setInt(1, bdno);
            rs = pstmt.executeQuery();

            cblists = new ArrayList<>();

            while (rs.next()) {
                CatBoard cb = new CatBoard();

                PropertySetter.setProperties(rs, cb, false, false);

                cblists.add(cb);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("catView 메소드 에러");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return cblists;

    }

    // 게시글 삭제
    public int deleteCatList(int bdno) { //delete.jsp에서 받아온 bdno 임
        String deleteSQL = "DELETE FROM CatBoard  WHERE BDNO = ?";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setInt(1, bdno); //커리문 ?에 값을 넣어 줘야함 LIST에서 받아온 BDNO는 위에 delete 메서드에 담겨 있는데 그것을 커리문에 넣겠다 라는 뜻

            check = pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }


    ////////// // 댓글 쓰기/////////////////////////
    public int commentsCatWrite(CatComments catComments, int catBoard_bdno) {

        String commentsSQL = "INSERT INTO cat_comments (catc_bdno, catboard_bdno, catc_userid, catc_contents) VALUES (catc_seq.nextval, ?, ?, ?)";
        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(commentsSQL);
            pstmt.setInt(1, catBoard_bdno);
            pstmt.setString(2, catComments.getCatc_userid());
            pstmt.setString(3, catComments.getCatc_contents());
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
    public ArrayList<CatComments> catcommentView(int catborad_bdno) {
        String catCommentViewSQL = "SELECT catc_bdno, catboard_bdno, catc_userid, catc_contents, catc_likes, catc_regdate from cat_comments WHERE catboard_bdno = ? ORDER BY catc_regdate";

        ArrayList<CatComments> catCommentLists = null;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(catCommentViewSQL);
            pstmt.setInt(1, catborad_bdno);
            rs = pstmt.executeQuery();

            catCommentLists = new ArrayList<>();

            while (rs.next()) {
                CatComments catComment = new CatComments();

                PropertySetter.setProperties(rs, catComment,true,false);

                catCommentLists.add(catComment);

                System.out.println("catBoardFactory contents : "+catComment.getCatc_contents());
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("catcommentView 메소드 에러");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return catCommentLists;
    }


    // 댓글 삭제
    public int deleteComment(int Comment_bdno) {
        String deleteSQL = "delete from cat_comments where catc_bdno=?";

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

    // 조회수 증가
    public void viewsUp(int bdno) {
        String viewsUpSQL = "UPDATE catboard SET views = views+1 WHERE bdno = ?";

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(viewsUpSQL);
            pstmt.setInt(1, bdno);

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("viewsUp 메소드 확인");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
    }

}