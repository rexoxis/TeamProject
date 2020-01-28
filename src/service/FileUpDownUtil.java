package service;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.FileUpload;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class FileUpDownUtil {

    public static Map<String, String> procUpload(HttpServletRequest req, String usePath){
        // 서버로 전송된 폼데이터를 저장하기 위해 Map를 이용
        Map<String, String> frmdata = new HashMap<>();

        Today today = new Today();
        String ymdhms = today.getDateTime();

        String uploadPath = usePath;

        String fName="";

        boolean isMultiPart = FileUpload.isMultipartContent(req);


        try {
            if (isMultiPart) {
                // 업로드 처리 객체 생성
                DiskFileItemFactory dfif = new DiskFileItemFactory();

                ServletFileUpload upload = new ServletFileUpload(dfif);

                List items = upload.parseRequest(req);
                Iterator<FileItem> params = items.iterator();


                while (params.hasNext()) {
                    FileItem item = (FileItem) params.next();

                    if (item.isFormField()) { // 텍스트 데이터라면
                        String name = item.getFieldName();  // frm의 name값들을 가져옴
                        String val = item.getString("utf-8");
                        frmdata.put(name, val);
                    } else {    // 파일 데이터라면
                        String upPath = item.getName(); // 파일경로를 알아내서

                        if (upPath.equals("")) continue;
                        // 2개이상의 파일 업로드시 하나만 올린다고 하면 아래의 코드들은 실행할 필요가 없음

                        fName = upPath.substring(upPath.lastIndexOf("\\") + 1); // 파일명을 추출

                        String fname[] = fName.split("\\.");
                        fName = fname[0] + ymdhms + "." + fname[1];

                        File f = new File(uploadPath + "/" + fName);    // 업로드 된 파일을 로컬에 저장할 경로로 재작성

                        item.write(f); // 지정한 경로에 파일 저장

                        String name = item.getFieldName();

                        frmdata.put(name, fName);
                    }
                } // while
            } // if
        } catch (Exception e){
            e.printStackTrace();
        } // try
        return frmdata;
    }

    public static void procDownload(HttpServletRequest req, HttpServletResponse res, String dPath){

        // 다운로드 할 경로 알아내기
//        String uploadPath = "C:/Java/pdsupload/";
        String fName = req.getParameter("f");
        String dfName = fName + dPath;
        // 다운로드 처리와 관련된 객체 선언
        InputStream is = null;
        OutputStream os = null;
        File f = null;

        // 다운로드 처리
        try{
            // 다운로드할 파일을 InputStream에 담기
            boolean skip = false;

            try{
                f = new File(dPath, fName);
                is = new FileInputStream(f);
            } catch (Exception e){
                // 다운로드할 파일이 존재하지 않으면 이후 코드를 실행하지 않음
                skip = true;
            }

            // 브라우저가 맘대로 다운로드를 처리하지 못하게 HTTP 헤더를 설정
            res.reset();
            res.setContentType("application/octet-stream");    // 파일 다운로드 유형 모든 파일이 다운가능하게함
            res.setHeader("Content-Description", "FileDownload"); // 다운로드 설명

            if(!skip){ // 다운로드할 파일이 존재한다면

                // 다운로드할 파일에 한글이 있는 경우 한글처리
                fName = new String(fName.getBytes("utf-8"),"iso-8859-1");

                // 다운로드 시 다운로드 대화상자에 보여질 파일명 지정 - 다운로드할 파일의 파일명으로 다운
                res.setHeader("Content-Disposition","attachment; filename=\"" + fName + "\"");
                // 다운로드 파일의 유형 정의
                res.setHeader("Content-Type","application/octet-stream; charset=utf-8");
                // 다운로드할 파일의 크기 표시
                res.setHeader("Content-Length",f.length()+"");


                // 다운로드할 파일을 String 형태로 클라이언트로 전송
                os = res.getOutputStream();
                byte b[] = new byte[(int)f.length()];
                int cnt = 0;

                while ((cnt = is.read(b)) > 0){
                    os.write(b, 0, cnt);
                }

            } else {
                res.setContentType("text/html; charset=utf-8");

                // JSP 페이지에서 결과를 출력할때처럼 out 객체를 이용했던것처럼
                // 자바클래스에서 JSP 페이지로 결과를 출력하려면 PringWriter 클래스를 사용해야함
                // system 클래스를 사용하면 콘솔에 출력
                PrintWriter out = res.getWriter();
                out.print("<h1>다운로드할 파일이 없습니다.</h1>");

            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (os != null) os.close();
                if (is != null) is.close();
            } catch (Exception e){
                e.printStackTrace();
            }
        }
    }

    public static Map<String, String> procCaptcha(HttpServletRequest req, String usePath){
        // 서버로 전송된 폼데이터를 저장하기 위해 Map를 이용
        Map<String, String> frmdata = new HashMap<>();

        boolean isMultiPart = FileUpload.isMultipartContent(req);


        try {
            if (isMultiPart) {
                // 업로드 처리 객체 생성
                DiskFileItemFactory dfif = new DiskFileItemFactory();

                ServletFileUpload upload = new ServletFileUpload(dfif);

                List items = upload.parseRequest(req);
                Iterator<FileItem> params = items.iterator();


                while (params.hasNext()) {
                    FileItem item = params.next();

                    if (item.isFormField()) { // 텍스트 데이터라면
                        String name = item.getFieldName();  // frm의 name값들을 가져옴
                        String val = item.getString("utf-8");
                        frmdata.put(name, val);
                    }
                } // while
            } // if
        } catch (Exception e){
            e.printStackTrace();
        } // try
        return frmdata;
    }
}
