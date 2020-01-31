package mvc.handler.member;


import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

public class LogoutHandler implements MVCHandler{
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|/ttproMVC/error.jsp";

        String userid = String.valueOf(request.getSession().getAttribute("userid"));

        // 현재 접속중인 브라우저에 대해 세션객체 제거
        if (userid != null) {
            request.getSession().invalidate();
            viewPage = "1|/ttproMVC/index.jsp";
        }


        return viewPage;
    }
}
