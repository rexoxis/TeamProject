package mvc.handler.anwserboard;

import dao.AnwserBoardDAO;
import mvc.handler.MVCHandler;
import vo.AnwserBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcAnwserBoardModifyHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String viewPage = "1|/ttproMVC/error.jsp";

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        int check = 0;


        AnwserBoardDAO anwserdao = new AnwserBoardDAO();

        AnwserBoard anwserBoard = new AnwserBoard();

        anwserBoard.setAnwser_bdno(bdno);
        anwserBoard.setAnwser_title(request.getParameter("title"));
        anwserBoard.setAnwser_contents(request.getParameter("contents"));

        check = anwserdao.anwserModify(anwserBoard);

        if (check >= 1) {
            viewPage = "2|anwserView.do?bdno="+bdno;
        }

        return viewPage;
    }
}

