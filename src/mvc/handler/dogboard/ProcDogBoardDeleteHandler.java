package mvc.handler.dogboard;

import dao.DogBoardFactory;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcDogBoardDeleteHandler implements MVCHandler{

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|/ttproMVC/error.jsp";

        int check = 0;

        DogBoardFactory dogdao = new DogBoardFactory();

        int bdno = Integer.parseInt(request.getParameter("bdno"));

        check = dogdao.deleteDogList(bdno);

        if (check >= 1) {
            viewPage = "2|dogList.do";
        }

        return viewPage;
    }
}

