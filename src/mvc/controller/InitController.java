package mvc.controller;


import javax.servlet.ServletConfig;
import javax.servlet.http.HttpServlet;
import java.io.FileInputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

public class InitController extends HttpServlet {
    private static Map<String, Object> commandMap = new HashMap<>();

    public static Map<String, Object> getCommandMap() {
        return commandMap;
    }

    public void init(ServletConfig sc) {
        String mvc_config = sc.getInitParameter("mvc_config");

        Properties p = new Properties();
        FileInputStream fis = null;

        try {
            String fPath = sc.getServletContext().getRealPath(mvc_config);
            fis = new FileInputStream(fPath);
            p.load(fis);

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if(fis != null) try {
                fis.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Iterator<Object> iterator = p.keySet().iterator();

        while (iterator.hasNext()) {
            String command = (String)iterator.next();
            String handlerName = p.getProperty(command);
            System.out.println("InitController command : " + command);
            System.out.println("InitController handlerName : " + handlerName);

            try {
                Class<?> handlerClassName = Class.forName(handlerName);
                Object handlerObject = handlerClassName.newInstance();

                commandMap.put(command, handlerObject);

            } catch (Exception e) {
                e.printStackTrace();
            }
        } // end while
    } // end init

}
