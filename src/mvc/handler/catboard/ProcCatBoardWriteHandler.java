package mvc.handler.catboard;

import dao.CatBoardDAO;
import mvc.handler.MVCHandler;
import service.FileUpDownUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

public class ProcCatBoardWriteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/catboard/catWrite.jsp";

        PrintWriter out = response.getWriter();

        int check = 0;

        CatBoardDAO catdao = new CatBoardDAO();

        // 파일 업로드 절대경로
        String realpath = request.getServletContext().getRealPath("ttproMVC/fileupload");
//        System.out.println(realpath);

        Map<String, String> frmdata = FileUpDownUtil.procUpload(request, realpath);

        String selectbd = frmdata.get("selectbd");

        check = catdao.catWrite(frmdata, selectbd);

        if (check >= 1) {
            viewPage = "2|catList.do";
//            out.println("<script> alert('게시글이 등록되었습니다.'); </script>");
        } else {
            System.out.println("글쓰기 실패");
        }

        return viewPage;
    }
}

