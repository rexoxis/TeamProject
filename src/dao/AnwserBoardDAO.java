package dao;

import service.OracleUtil;
import service.PropertySetter;
import vo.AnwserBoard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AnwserBoardDAO {
    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    OracleUtil oracle = new OracleUtil();

    // 답변글 보여주기
    public ArrayList<AnwserBoard> AnwserView(int qnaBoard_bdno) {
        String viewsSQL = "SELECT * FROM qna_anwser WHERE qnaboard_bdno = ?";

        ArrayList<AnwserBoard> viewList = new ArrayList<>();

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(viewsSQL);
            pstmt.setInt(1, qnaBoard_bdno);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                AnwserBoard anwserBoard = new AnwserBoard();

                PropertySetter.setProperties(rs, anwserBoard, false, false);

                viewList.add(anwserBoard);
            }

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("AnwserView 메소드 에러확인");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }
        return viewList;
    }

    // 답변글쓰기
    public int anwserWrite(AnwserBoard anwserBoard, int qnaBoard_bdno) {
        String writeSQL = "insert into qna_anwser (anwser_bdno, qnaboard_bdno, anwser_userid, anwser_title, anwser_contents) values (squ.nextval,?,?,?,?)";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(writeSQL);

            pstmt.setInt(1, qnaBoard_bdno);
            pstmt.setString(2, anwserBoard.getAnwser_userid());
            pstmt.setString(2, anwserBoard.getAnwser_title());
            pstmt.setString(3, anwserBoard.getAnwser_contents());

            check = pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("anwserWrite 메소드 에러");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }

    public int modifyAnwser(AnwserBoard anwserBoard) {
        String modifySQL = "update qna_anwser set anwser_title=?, anwser_contents=? where anwser_bdno=?";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(modifySQL);

            pstmt.setString(1, anwserBoard.getAnwser_title());
            pstmt.setString(2, anwserBoard.getAnwser_contents());
            pstmt.setInt(3, anwserBoard.getAnwser_bdno());

            check = pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("modipyBoard 확인바람");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }


    // 답변글 삭제
    public int anwserDelete(int qnaBoard_bdno) {
        String deleteSQL = "DELETE FROM qna_anwser WHERE qnaboard_bdno = ?";

        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(deleteSQL);

            pstmt.setInt(1, qnaBoard_bdno);

            check = pstmt.executeUpdate();

        } catch (Exception ex) {
            ex.printStackTrace();
            System.out.println("anwserDelete 메소드 확인");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }

    // 조회수 증가
    public void anwserViewUp(int qnaBoard_bdno) {
        String anwserViewUpSQL = "update qna_anwser set anwser_views = anwser_views+1 where qnaBoard_bdno=?";

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(anwserViewUpSQL);
            pstmt.setInt(1, qnaBoard_bdno);

            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("anwserViewUp 메소드 에러");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
    }

//    // 댓글쓰기
//    public int commentsWrite(QnaComments qc, int qavbdno) {
//        String commentsSQL = "INSERT INTO qna_comments (comt_bdno, qav_bdno, comt_userid, comt_contents) VALUES (comments_seq.nextval, ?, ?, ?)";
//
//        int check = 0;
//
//        try {
//            conn = oracle.getConn();
//            pstmt = conn.prepareStatement(commentsSQL);
//            pstmt.setInt(1, qavbdno);
//            pstmt.setString(2, qc.getComt_userid());
//            pstmt.setString(3, qc.getComt_contents());
//
//            check = pstmt.executeUpdate();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("commentsWrite 메소드 에러");
//        } finally {
//            oracle.closeConn(pstmt, conn);
//        }
//        return check;
//    }
//
//    // 게시판 댓글 보기
//    public ArrayList<QnaComments> commentView(int qavbdno) {
//        String commtViewSQL = "SELECT comt_bdno, qav_bdno, comt_userid, comt_contents, comt_likes, comt_regdate from qna_comments WHERE qav_bdno = ? ORDER BY comt_regdate";
//
//        ArrayList<QnaComments> qclists = null;
//
//        try {
//            conn = oracle.getConn();
//            pstmt = conn.prepareStatement(commtViewSQL);
//            pstmt.setInt(1, qavbdno);
//            rs = pstmt.executeQuery();
//
//            qclists = new ArrayList<>();
//
//            while (rs.next()) {
//                QnaComments qc = new QnaComments();
//
//                qc.setComt_bdno(rs.getInt(1));
//                qc.setQav_bdno(rs.getInt(2));
//                qc.setComt_userid(rs.getString(3));
//                qc.setComt_contents(rs.getString(4));
//                qc.setComt_likes(rs.getInt(5));
//                qc.setComt_regdate(rs.getString(6));
//
//                qclists.add(qc);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("boardView 메소드 에러");
//        } finally {
//            oracle.closeConn(pstmt, conn);
//        }
//
//        return qclists;
//    }
//
//    // 댓글 삭제
//    public int deleteComment(int Comment_bdno) {
//        String deleteSQL = "delete from qna_comments where comt_bdno=?";
//
//        int check = 0;
//
//        try {
//            conn = oracle.getConn();
//            pstmt = conn.prepareStatement(deleteSQL);
//            pstmt.setInt(1, Comment_bdno);
//
//            check = pstmt.executeUpdate();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//
//        } finally {
//            oracle.closeConn(rs, pstmt, conn);
//        }
//        return check;
//    }

}




