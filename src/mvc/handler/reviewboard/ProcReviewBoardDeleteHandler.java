package mvc.handler.reviewboard;

import dao.ReviewBoardFactory;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcReviewBoardDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        ReviewBoardFactory reviewdao = new ReviewBoardFactory();

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        check = reviewdao.deleteView(bdno);

        if (check >= 1) {
            viewPage = "2|reviewList.do";
        }

        return viewPage;
    }
}

