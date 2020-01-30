package mvc.handler.reviewboard;

import dao.CatBoardFactory;
import mvc.handler.MVCHandler;
import service.FileUpDownUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

public class ReviewBoardProcModifyHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String viewPage = "1|/ttproMVC/error.jsp";

        PrintWriter out = response.getWriter();

        CatBoardFactory catdoa = new CatBoardFactory();

        String realpath = request.getServletContext().getRealPath("ttproMVC/fileupload");
        Map<String, String> frmdata = FileUpDownUtil.procUpload(request, realpath);

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        System.out.println("procModify bdno : " + bdno);
        int check = 0;

        check = catdoa.modifyView(frmdata, bdno);

        if (check >= 1) {
            viewPage = "2|catView.do?bdno="+bdno;
        } else {
            out.print("<script>history.go(-1);</script>");
        }

        return viewPage;
    }
}

