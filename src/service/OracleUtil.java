package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class OracleUtil {
    private String DRV;
    private String URL;
    private String UID;
    private String PWD;
    private Connection conn;

    public OracleUtil() {
       this.DRV = "oracle.jdbc.OracleDriver";
       this.URL = "jdbc:oracle:thin:@13.124.13.188:1521/XE";
       this.UID = "hr";
       this.PWD = "hr";
    }

    public OracleUtil(String myIP, String USR, String PWD, String myDBname) {
        this.DRV = "oracle.jdbc.OracleDriver";
        this.URL = "jdbc:oracle:thin:@" + myIP + ":1521/" + myDBname;
        this.UID = USR;
        this.PWD = PWD;
    }

    // Connection 연결 해주는 메소드
    public Connection getConn(){
        try {
            Class.forName(DRV);
            conn = DriverManager.getConnection(URL,UID,PWD);

        } catch (Exception e){
            e.printStackTrace();
            System.out.println("데이터베이스 연결 실패(URL, USR, PWD 확인 요망)");
            System.out.println("DRV : " + DRV);
            System.out.println("URL : " + URL);
            System.out.println("USR : " + UID);
            System.out.println("PWD : " + PWD);
        }
     return conn;
    }

    // 연결관련 객체들 닫는 메소드
    public void closeConn(ResultSet rs, PreparedStatement pstmt, Connection conn){
        try {
            if(rs != null) rs.close();
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void closeConn(PreparedStatement pstmt, Connection conn){
        try {
            if(pstmt != null) pstmt.close();
            if(conn != null) conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

}
