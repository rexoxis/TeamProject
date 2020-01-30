package dao;

import service.OracleUtil;
import service.PropertySetter;
import vo.DogBoard;
import vo.DogComments;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class DogBoardFactory {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs;

    OracleUtil oracle = new OracleUtil();

    // 게시판 글쓰기 - 옵션태그 선택에 따라 해당 게시판에 insert
    public int dogWrite(Map<String, String> frmdata, String selectbd) {

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

    public ArrayList<DogBoard> dogList(HashMap<String, String> searchList, int startnum, int endnum) {
        String listSQL = "";
        String val = "";

        for (String key : searchList.keySet()) {
            switch (key) {
                case "title" :
                    listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.file1, rownum as rnum from " +
                            " (select bdno, title, userid, views, regdate, file1 from dogboard WHERE title like '%'|| ? ||'%' order by regdate desc) bd " +
                            " where rownum <= ?) bd2 " +
                            " where bd2.rnum >= ?";
                    break;
                case "contents":
                    listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.file1, rownum as rnum from " +
                            " (select bdno, title, userid, views, regdate, file1 from dogboard WHERE contents like '%'|| ? ||'%' order by regdate desc) bd " +
                            " where rownum <= ?) bd2 " +
                            " where bd2.rnum >= ?";
                    break;
                case "userid" :
                    listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.file1, rownum as rnum from " +
                            " (select bdno, title, userid, views, regdate, file1 from dogboard WHERE userid like '%'|| ? ||'%' order by regdate desc) bd " +
                            " where rownum <= ?) bd2 " +
                            " where bd2.rnum >= ?";
                    break;
                case "selected" :
                    listSQL = " select * from (select bd.bdno, bd.title, bd.userid, bd.views, bd.regdate, bd.file1, rownum as rnum from " +
                            " (select bdno, title, userid, views, regdate, file1 from dogboard order by regdate desc) bd " +
                            " where rownum <= ?) bd2 " +
                            " where bd2.rnum >= ?";
                    break;
            }
            val = searchList.get(key);
//            System.out.println("jsp페이지에서 넘어온 option 태그 값 : "+key);
        }

//        System.out.println("jsp페이지에서 넘어온 검색어 : "+val);

        ArrayList<DogBoard> dblists = null;

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
                DogBoard db = new DogBoard();

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
        String modifySQL = "UPDATE dogboard SET title = ?, contents = ?, file1 = ?, file2 = ?, file3 = ?, file4 = ?, file5 = ? WHERE bdno = ?";

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


    // 게시판 게시글 상세보기
    public ArrayList<DogBoard> dogView(int bdno) {
        String viewSQL = "SELECT bdno,userid,title,contents,views,likes,regdate,file1,file2,file3,file4,file5 FROM dogboard WHERE bdno = ? order by bdno desc";

        ArrayList<DogBoard> rblists = null;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(viewSQL);
            pstmt.setInt(1, bdno);
            rs = pstmt.executeQuery();

            rblists = new ArrayList<>();

            while (rs.next()) {
                DogBoard db = new DogBoard();

                PropertySetter.setProperties(rs, db, false, false);

                rblists.add(db);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("dogView 메소드 에러");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return rblists;

    }
    // 게시판 총게시물 수 구하기
    public int countBoard(){
        String countSQL = "SELECT count(bdno) FROM reviewboard";

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

    // 댓글 쓰기
    public void commentsDogWrite(DogComments rdc, int dogrbdno) {
        String commentsSQL = "INSERT INTO rev_dogcomments (dogc_bdno, dogr_bdno, dogc_userid, dogc_contents) VALUES (dogc_seq.nextval, ?, ?, ?)";

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(commentsSQL);
            pstmt.setInt(1, dogrbdno);
            pstmt.setString(2, rdc.getDogc_userid());
            pstmt.setString(3, rdc.getDogc_contents());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("commentsWrite 메소드 에러");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
    }


    // 게시판 댓글 보기
    public ArrayList<DogComments> dogcommentView(int dogrbdno) {
        String dogcommtViewSQL = "SELECT dogc_bdno, dogc_userid, dogc_contents, dogc_likes, dogc_regdate from rev_dogcomments WHERE dogr_bdno = ? ORDER BY dogc_regdate";

        ArrayList<DogComments> rdclists = null;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(dogcommtViewSQL);
            pstmt.setInt(1, dogrbdno);
            rs = pstmt.executeQuery();

            rdclists = new ArrayList<>();

            while (rs.next()) {
                DogComments rc = new DogComments();

//                PropertySetter.setProperties(rs,rc,false,false);
                rc.setDogc_bdno(rs.getInt(1));
                rc.setDogc_userid(rs.getString(2));
                rc.setDogc_contents(rs.getString(3));
                rc.setDogc_likes(rs.getInt(4));
                rc.setDogc_regdate(rs.getString(5));

                rdclists.add(rc);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("boardView 메소드 에러");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return rdclists;
    }


    //게시판 삭제
    public void deletedogList(int bdno) { //delete.jsp에서 받아온 bdno 임
        String deleteSQL = "DELETE FROM DogBoard  WHERE BDNO = ?";

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setInt(1, bdno); //커리문 ?에 값을 넣어 줘야함 LIST에서 받아온 BDNO는 위에 delete 메서드에 담겨 있는데 그것을 커리문에 넣겠다 라는 뜻
            pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("삭제가 안되는 구만");
        } finally {
            oracle.closeConn(pstmt, conn);
        }

    }


    // 게시글 삭제
    public int deleteView(int bdno) {
        String deleteSQL = "DELETE FROM reviewboard WHERE bdno = ?";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(deleteSQL);
            pstmt.setInt(1, bdno);

            check = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("deleteView 메소드 확인");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }

    // 조회수 증가
    public void viewsUp(int bdno) {
        String viewsUpSQL = "UPDATE reviewboard SET views = views+1 WHERE bdno = ?";

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