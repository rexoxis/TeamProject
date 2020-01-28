//package dao;
//
//import service.OracleUtil;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.HashMap;
//
//public class AllUseBoardDAO2 {
//
//    private Connection conn = null;
//    private PreparedStatement pstmt = null;
//    private ResultSet rs = null;
//
//    OracleUtil oracle = new OracleUtil("13.124.13.188","hr","hr","XE");
//
//    private ArrayList<HashMap<String, Object>> lists = null;
//
//    // 게시판 목록을 보여주기위한 메소드 (공통으로 사용가능)
//    public ArrayList<HashMap<String, Object>> getBoardList(String listSQL) {
//
//        try {
//            conn = oracle.getConn();
//            pstmt = conn.prepareStatement(listSQL);
//            rs = pstmt.executeQuery();
//            ResultSetMetaData rsmd = rs.getMetaData();
//
//            int columnCount = rsmd.getColumnCount();
//            String columnName = "";
//
//            lists = new ArrayList<>();
//            HashMap<String, Object> result = null;
//
//            while (rs.next()) {
//
//                result = new HashMap<>();
//
//                for (int i = 1; i <= columnCount; i++) {
//                    columnName = rsmd.getColumnName(i).toLowerCase();
//
//                    switch (rsmd.getColumnTypeName(i)) {
//                        case "VARCHAR" : case "VARCHAR2": case "DATE": case "CLOB": case "CHAR" :
//                            result.put(columnName, rs.getString(i));
//                            break;
//                        case "INTEGER": case "NUMBER": case "NUMERIC":
//                            result.put(columnName, rs.getInt(i));
//                            break;
//                    } // switch end
//                } // for end
//                lists.add(result);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("getBoardList 확인 요망");
//        } finally {
//            oracle.closeConn(rs, pstmt, conn);
//        }
//        return lists;
//    }
//
//    // 게시물 수를 반환하는 메소드 (공통으로 사용가능)
//    public int countBoard(String countSQL) {
//
//        int bdcnt = 0;
//
//        try {
//            conn = oracle.getConn();
//            pstmt = conn.prepareStatement(countSQL);
//            rs = pstmt.executeQuery();
//
//            while (rs.next()) {
//                bdcnt = rs.getInt(1);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            oracle.closeConn(rs, pstmt, conn);
//        }
//        return bdcnt;
//    }
//
//    // 글쓰기 기능을 하는 메소드(수정필요)
//    public int writeBoard(HashMap<String, String> writer, String writeSQL) {
//        int check = 0;
//
//        try {
//            conn = oracle.getConn();
//            pstmt = conn.prepareStatement(writeSQL);
//
//            pstmt.setString(1, writer.get("title"));
//            pstmt.setString(2, writer.get("userid"));
//            pstmt.setString(3, writer.get("contents"));
//
//            check = pstmt.executeUpdate();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            oracle.closeConn(pstmt, conn);
//        }
//        return check;
//    }
//
//    // 글 내용을 보여주는 메소드 (공통으로 사용가능)
//    public ArrayList<HashMap<String, Object>> viewContents(int bdno, String viewSQL) {
//
//        try {
//            conn = oracle.getConn();
//            pstmt = conn.prepareStatement(viewSQL);
//            pstmt.setInt(1, bdno);
//            rs = pstmt.executeQuery();
//            ResultSetMetaData rsmd = rs.getMetaData();
//
//            int columnCount = rsmd.getColumnCount();
//            String columnName = "";
//
//            lists = new ArrayList<>();
//            HashMap<String, Object> result = null;
//
//            while (rs.next()) {
//
//                result = new HashMap<>();
//
//                for (int i = 1; i <= columnCount; i++) {
//                    columnName = rsmd.getColumnName(i).toLowerCase();
//
//                    switch (rsmd.getColumnTypeName(i)) {
//                        case "VARCHAR" : case "VARCHAR2": case "DATE": case "CLOB": case "CHAR" :
//                            result.put(columnName, rs.getString(i));
//                            break;
//                        case "INTEGER": case "NUMBER": case "NUMERIC":
//                            result.put(columnName, rs.getInt(i));
//                            break;
//                    } // switch end
//                } // for end
//                lists.add(result);
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        } finally {
//            oracle.closeConn(rs, pstmt, conn);
//        }
//        return lists;
//    }
//
//    // 글 내용 수정하는 메소드 (수정필요)
//    public int modifyContents(AllUseBoard modifybd, int mbdno, String modifySQL) {
//        int check = 0;
//
//        try {
//            conn = oracle.getConn();
//            pstmt = conn.prepareStatement(modifySQL);
//            pstmt.setString(1, modifybd.getTitle());
//            pstmt.setString(2, modifybd.getContents());
//            pstmt.setInt(3, mbdno);
//
//            check = pstmt.executeUpdate();
//
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("modifyContents 메소드 확인 요망");
//        } finally {
//            oracle.closeConn(rs, pstmt, conn);
//        }
//        return check;
//    }
//
//    // 글 내용 삭제하는 메소드 (공통으로 사용가능)
//    public int deleteList(int bdno, String deleteSQL) {
//        int check = 0;
//
//        try {
//            conn = oracle.getConn();
//            pstmt = conn.prepareStatement(deleteSQL);
//            pstmt.setInt(1, bdno);
//
//            check = pstmt.executeUpdate();
//
//        } catch (Exception e) {
//            e.printStackTrace();
//            System.out.println("deleteList 메소드 확인 요망");
//        } finally {
//            oracle.closeConn(pstmt, conn);
//        }
//        return check;
//    }
//
//}
//
