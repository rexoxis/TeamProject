package mvc.handler.qnaboard;

import dao.QnaBoardDAO;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcQnaBoardDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        QnaBoardDAO qnadao = new QnaBoardDAO();

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        check = qnadao.deleteqnaList(bdno);

        if (check >= 1) {
            viewPage = "2|qnaList.do";
        }

        return viewPage;
    }
}

