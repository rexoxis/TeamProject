package mvc.handler;


import service.CaptchaUtil;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class CaptchaHandler implements MVCHandler {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        CaptchaUtil.getCaptcha(request, response);

        return null;
    }
}
