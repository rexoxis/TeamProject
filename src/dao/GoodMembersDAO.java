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

public class GoodMembersDAO {

    private Connection conn = null;
    private PreparedStatement pstmt = null;
    private ResultSet rs = null;

    OracleUtil oracle = new OracleUtil();

    // 입력받은 회원정보를 넘겨주면 디비에 insert
    public int joinMember(GoodMembers goodMembers){
        String joinSQL = "insert into goodmembers(mno, name, jumin, userid, passwd, zipcode, adrr, email, hp) " +
                " values (goodmb_seq.nextval,?,?,?,?,?,?,?,?) ";
        int isOk = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(joinSQL);

            pstmt.setString(1, goodMembers.getName());
            pstmt.setString(2, goodMembers.getJumin1()+"-"+goodMembers.getJumin2());
            pstmt.setString(3, goodMembers.getUserid());
            pstmt.setString(4, goodMembers.getPasswd());
            pstmt.setString(5, goodMembers.getZip());
            pstmt.setString(6, goodMembers.getAddr1()+goodMembers.getAddr2());
            pstmt.setString(7, goodMembers.getEmail1()+"@"+goodMembers.getEmail2());
            pstmt.setString(8, goodMembers.getTel1()+"-"+goodMembers.getTel2()+"-"+goodMembers.getTel3());

            isOk = pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("joinMember 메소드 확인 요망");
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

    // 로그인 체크
    public int loginCheck(String userid, String passwd){
        String loginSQL = "select PASSWD from GOODMEMBERS where USERID = ?";
        String dbpwd = "";
        int check = 0;

        try {
            conn = oracle.getConn();
            pstmt = conn.prepareStatement(loginSQL);
            pstmt.setString(1,userid);
            rs = pstmt.executeQuery();

            if(rs.next()){
                dbpwd = rs.getString(1);

                if(dbpwd.equals(passwd)){
                    check = 1;
                } else {
                    check = 0;
                }
            } else {
                check = -1;
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("loginCheck 메소드 확인 요망");
        } finally {
            oracle.closeConn(rs, pstmt, conn);
        }

        return check;
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
