package dao;

// 회원가입 정보를 데이터베이스에 저장하는 클래스

import service.OracleUtil;
import service.PropertySetter;
import vo.GoodMembers;
import vo.ZipCode;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class goodMembersDAO {

    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    OracleUtil oracle = new OracleUtil();

    // 입력받은 회원정보를 넘겨주면 디비에 insert
    public int joinAction(GoodMembers gmb){
        String joinSQL = "insert into goodmembers(mno, name, jumin, userid, passwd, zipcode, adrr, email, hp) " +
                " values (goodmb_seq.nextval,?,?,?,?,?,?,?,?) ";
        int isOk = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(joinSQL);

            pstmt.setString(1, gmb.getName());
            pstmt.setString(2, gmb.getJumin1()+"-"+gmb.getJumin2());
            pstmt.setString(3, gmb.getUserid());
            pstmt.setString(4, gmb.getPasswd());
            pstmt.setString(5, gmb.getZip());
            pstmt.setString(6, gmb.getAddr1()+gmb.getAddr2());
            pstmt.setString(7, gmb.getEmail1()+"@"+gmb.getEmail2());
            pstmt.setString(8, gmb.getTel1()+"-"+gmb.getTel2()+"-"+gmb.getTel3());

            isOk = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("joinAction 메소드 확인 요망");
        } finally {
            oracle.closeConn(pstmt,conn);
        }
        return isOk;
    }

    // 회원탈퇴 기능 메소드
    public int deleteMember(String userid, String passwd){
        String deleteuserSQL = "delete from goodmembers where userid = ? and passwd = ?";
        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(deleteuserSQL);
            pstmt.setString(1, userid);
            pstmt.setString(2, passwd);

            check = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("deleteMembet 메소드 확인 요망");
        } finally {
            oracle.closeConn(pstmt, conn);
        }
        return check;
    }

    // 회원가입 중복체크, 입력한 아이디가 존재하면 해당 아이디 값을 반환
    public String checkID(String inputID) {
        String checkIDSQL = "SELECT USERID FROM GOODMEMBERS WHERE USERID = ?";
        String resultID = "";
        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(checkIDSQL);
            pstmt.setString(1,inputID);
            rs = pstmt.executeQuery();

            // 해당 아이디가 있으면 검색된 아이디를 셋팅
            if (rs.next()){
                resultID = rs.getString(1);
            } else {
                resultID = "";
            }
            System.out.println("메소드안에 쿼리문 실핼 후 ID : " + resultID);
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("checkID 메소드 에러");
        } finally {
            oracle.closeConn(rs,pstmt,conn);
        }
        return resultID;
    }

    // 우편번호 찾기
    public ArrayList<ZipCode> searchZipCode(String findaddr){

        String resultAddr [] = findaddr.split(" ");
        String zipCodeSQL = "";

        if (resultAddr.length == 1){
            zipCodeSQL = "select ZIPCODE, sido, gugun, dong, ri, bunji from JOIN_ZIPCODE where GUGUN like '%'|| ? ||'%'";
        } else if (resultAddr.length == 2){
            zipCodeSQL = "select ZIPCODE, sido, gugun, dong, ri, bunji from JOIN_ZIPCODE where GUGUN like '%'|| ? ||'%' AND DONG like '%'|| ? ||'%'";
            System.out.println("전달된 주소(동) : "+resultAddr[1]);
        }

        ArrayList<ZipCode> ziplists = new ArrayList<>();

//        System.out.println("전달된 주소(구) : "+resultAddr[0]);

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(zipCodeSQL);

            pstmt.setString(1,resultAddr[0]);
            if (resultAddr.length == 2) {
                pstmt.setString(2,resultAddr[1]);
            }

            rs = pstmt.executeQuery();

            while (rs.next()) {
                ZipCode zip = new ZipCode();

                PropertySetter.setProperties(rs,zip,false,false);

                ziplists.add(zip);
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("searchZipCode 메소드 에러");
        } finally {
            oracle.closeConn(rs,pstmt,conn);
        }
        return ziplists;
    }

}
