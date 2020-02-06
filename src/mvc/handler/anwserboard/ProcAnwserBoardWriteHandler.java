package mvc.handler.anwserboard;

import dao.AnwserBoardDAO;
import mvc.handler.MVCHandler;
import vo.AnwserBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcAnwserBoardWriteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/anwserboard/anwserWrite.jsp";

        int check = 0;

        AnwserBoardDAO anwserdao = new AnwserBoardDAO();

        AnwserBoard anwserBoard = new AnwserBoard();

        int qnaBoard_bdno = Integer.parseInt(request.getParameter("qnaBoard_bdno"));

        anwserBoard.setAnwser_userid(request.getParameter("userid"));
        anwserBoard.setAnwser_title(request.getParameter("title"));
        anwserBoard.setAnwser_contents(request.getParameter("contents"));

        check = anwserdao.anwserWrite(anwserBoard, qnaBoard_bdno);

        if (check >= 1) {
            viewPage = "2|qnaList.do";
        } else {
            viewPage = "1|/ttproMVC/error.jsp";
            System.out.println("글쓰기 실패, DAO 확인");
        }

        return viewPage;
    }
}

