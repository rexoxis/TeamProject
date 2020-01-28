package dao;

import service.OracleUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginDAO {

    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    OracleUtil oracle = new OracleUtil();

    public LoginDAO() {}

    public int loginAction(String uid, String pwd){
        String loginSQL = "select PASSWD from GOODMEMBERS where USERID = ?";
        String dbpwd = "";
        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(loginSQL);
            pstmt.setString(1,uid);
            rs = pstmt.executeQuery();

            if(rs.next()){
                dbpwd = rs.getString(1);

                if(dbpwd.equals(pwd)){
                    check = 1;
                } else {
                    check = 0;
                }
            } else {
                check = -1;
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("loginAction 메소드 확인 요망");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }

        return check;
    }
}
