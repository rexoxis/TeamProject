package mvc.handler.anwserboard;

import dao.AnwserBoardDAO;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcAnwserBoardDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        AnwserBoardDAO anwserdao = new AnwserBoardDAO();

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        check = anwserdao.anwserDelete(bdno);

        if (check >= 1) {
            viewPage = "2|anwserList.do";
        }

        return viewPage;
    }
}

