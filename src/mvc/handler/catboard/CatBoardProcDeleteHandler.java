package mvc.handler.catboard;

import dao.CatBoardFactory;
import mvc.handler.MVCHandler;
import service.FileUpDownUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Map;

public class CatBoardProcDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        CatBoardFactory catdao = new CatBoardFactory();

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        check = catdao.deletecatList(bdno);

        if (check >= 1) {
            viewPage = "2|catList.do";
        }

        return viewPage;
    }
}

