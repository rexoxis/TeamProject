package mvc.handler;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class InfoHandler implements MVCHandler {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String viewPage = "1|ttproMVC/info.jsp";

        return viewPage;
    }
}
