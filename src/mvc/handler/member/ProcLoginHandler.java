package mvc.handler.member;


import dao.GoodMembersDAO;
import mvc.handler.MVCHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ProcLoginHandler implements MVCHandler {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");

        String viewPage = "1|/ttproMVC/login/login.jsp";

        String userid = request.getParameter("userid");
        String passwd = request.getParameter("passwd");

        String msg = "";
        int check = 0;

        GoodMembersDAO gmb = new GoodMembersDAO();

        check = gmb.loginCheck(userid, passwd);

        if (check == 1) {
            request.getSession().setAttribute("userid", userid);
            viewPage = "2|/ttproMVC/index.jsp";
        } else if (check == 0) {
            msg = "fail"; // 비밀번호가 틀릴때
        } else if (check == -1) {
            msg = "notExist"; // 아이디가 존재하지 않을때
        }

        request.setAttribute("failMsg", msg);

        return viewPage;
    }
}
