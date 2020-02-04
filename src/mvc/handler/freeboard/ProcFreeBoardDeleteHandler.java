package mvc.handler.freeboard;

import dao.FreeBoardDAO;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcFreeBoardDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        FreeBoardDAO freedao = new FreeBoardDAO();

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        check = freedao.deletelist(bdno);

        if (check >= 1) {
            viewPage = "2|freeList.do";
        }

        return viewPage;
    }
}

