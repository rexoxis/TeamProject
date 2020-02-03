package mvc.handler.dogboard;

import dao.DogBoardFactory;
import mvc.handler.MVCHandler;
import service.FileUpDownUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

public class ProcDogBoardWriteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/dogboard/dogWrite.jsp";

        PrintWriter out = response.getWriter();

        int check = 0;

        DogBoardFactory dogdao = new DogBoardFactory();

        // 파일 업로드 절대경로
        String realpath = request.getServletContext().getRealPath("ttproMVC/fileupload");
//        System.out.println(realpath);

        Map<String, String> frmdata = FileUpDownUtil.procUpload(request, realpath);

        String selectbd = frmdata.get("selectbd");

        check = dogdao.dogWrite(frmdata, selectbd);

        if (check >= 1) {
            viewPage = "2|dogList.do";
//            out.println("<script> alert('게시글이 등록되었습니다.'); </script>");
        } else {
            System.out.println("글쓰기 실패");
        }

        return viewPage;
    }
}

