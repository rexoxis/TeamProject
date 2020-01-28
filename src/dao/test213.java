//package dao;
//
//import java.sql.*;
//import java.util.ArrayList;
//import java.util.HashMap;
//import java.util.List;
//import java.util.Map;
//
//public class test213 {
//
//    static Connection conn = null;
//    static PreparedStatement pstmt = null;
//    static ResultSet rs = null;
//    static List<Map<String, Object>> lists = null;
//
//    public static void main(String[] args) {
//        String listSQL = "select bdno, title, userid, views, contents, regdate from BOARDV12 order by bdno";
//        try {
//            conn = JDBCUtil.makeConn();
//            pstmt = conn.prepareStatement(listSQL);
//            rs = pstmt.executeQuery();
//            ResultSetMetaData rsmd = rs.getMetaData();
//
//            int columnCount = rsmd.getColumnCount();
//            String columnName = "";
//
//            lists = new ArrayList<>();
//
//            Map<String, Object> result = null;
//
//            while (rs.next()) {
//
//                result = new HashMap<>();
//
//                for (int i = 1; i <= columnCount; i++) {
//                    columnName = rsmd.getColumnName(i).toLowerCase();
//
////                    System.out.println(rsmd.getColumnLabel(i));
////                    System.out.println(rsmd.getColumnTypeName(i));
////                    System.out.println(rsmd.getColumnType(i));
//                    System.out.println(rsmd.getColumnName(i));
//                    switch (rsmd.getColumnType(i)) {
//                        case Types.VARCHAR:
//                        case Types.DATE:
//                        case Types.CLOB:
//                            result.put(columnName, rs.getString(i));
//                            break;
//                        case Types.INTEGER:
//                        case Types.NUMERIC:
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
//            JDBCUtil.closeConn(rs, pstmt, conn);
//        }
//
//        for(Map<String, Object> m : lists) {
//            System.out.println(m.get("title").getClass());
//            System.out.println(m.get("bdno").getClass());
//
//        }
//    }
//
//
//}
