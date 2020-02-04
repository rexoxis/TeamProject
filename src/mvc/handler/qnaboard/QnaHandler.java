package mvc.handler.qnaboard;


import dao.QnaBoardDAO;
import mvc.handler.MVCHandler;
import vo.QnaBoard;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;

public class QnaHandler implements MVCHandler {

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/qnaboard/QnA.jsp";


        return viewPage;
    }
}
