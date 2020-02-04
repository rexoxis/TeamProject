package mvc.handler.qnaboard;

import dao.QnaBoardDAO;
import mvc.handler.MVCHandler;
import vo.QnaBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcQnaBoardWriteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/qnaboard/qnaWrite.jsp";

        int check = 0;

        QnaBoardDAO qnadao = new QnaBoardDAO();

        QnaBoard qnaBoard = new QnaBoard();

        qnaBoard.setUserid(request.getParameter("userid"));
        qnaBoard.setTitle(request.getParameter("title"));
        qnaBoard.setContents(request.getParameter("contents"));

        String selectbd = request.getParameter("selectbd");

        check = qnadao.writeAction(qnaBoard, selectbd);

        if (check >= 1) {
            viewPage = "2|qnaList.do";
        } else {
            System.out.println("글쓰기 실패");
        }

        return viewPage;
    }
}

