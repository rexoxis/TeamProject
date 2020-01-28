//package dao;
//
//import java.sql.Connection;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.sql.SQLException;
//import java.util.ArrayList;
//
//public class testReflection {
//    static Connection conn = null;
//    static PreparedStatement pstmt = null;
//    static ResultSet rs = null;
//    ArrayList<AllUseBoard> lists = null;
//
//    public static void main(String[] args) {
//
//        String searchSQL = "select bdno, title, userid, views, contents, regdate from BOARDV12 where USERID like '%'|| ? ||'%' order by bdno";
//        ArrayList<AllUseBoard> lists = null;
//
//        try {
//            conn = JDBCUtil.makeConn();
//            pstmt = conn.prepareStatement(searchSQL);
//            pstmt.setString(1,  "이승훈");
//            rs = pstmt.executeQuery();
//
//            lists = new ArrayList<>();
//
//            while (rs.next()) {
//
//                AllUseBoard b = new AllUseBoard();
//
////                PropertySetter.setProperties(rs, b, false, false);
//
//                b.setBdno(rs.getInt(1));
//                b.setTitle(rs.getString(2));
//                b.setUserid(rs.getString(3));
//                b.setViews(rs.getInt(4));
//                b.setContents(rs.getString(5));
//                b.setRegdate(rs.getString(6));
//                lists.add(b);
//            }
//
//        } catch (SQLException e) {
//            e.printStackTrace();
//        } finally {
//            JDBCUtil.closeConn(rs, pstmt, conn);
//        }
//
//        for(AllUseBoard a : lists){
//            System.out.println(a.getTitle());
//        }
//    }
//
//}
