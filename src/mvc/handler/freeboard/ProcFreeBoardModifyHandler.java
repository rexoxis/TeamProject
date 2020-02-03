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

public class ProcDogBoardModifyHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String viewPage = "1|/ttproMVC/error.jsp";

        PrintWriter out = response.getWriter();

        DogBoardFactory dogdao = new DogBoardFactory();

        String realpath = request.getServletContext().getRealPath("ttproMVC/fileupload");
        Map<String, String> frmdata = FileUpDownUtil.procUpload(request, realpath);

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        System.out.println("procModify bdno : " + bdno);
        int check = 0;

        check = dogdao.modifyView(frmdata, bdno);

        if (check >= 1) {
            viewPage = "2|dogView.do?bdno="+bdno;
        } else {
            out.print("<script>history.go(-1);</script>");
        }

        return viewPage;
    }
}

