package mvc.handler.catboard;

import dao.CatBoardDAO;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcCatBoardDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        CatBoardDAO catdao = new CatBoardDAO();

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        check = catdao.deleteCatList(bdno);

        if (check >= 1) {
            viewPage = "2|catList.do";
        }

        return viewPage;
    }
}

