package test;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AJAXServer extends HttpServlet{
    protected void doPost(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException{
        try{
            request.setCharacterEncoding("utf-8");
            response.setContentType("text/html; charset=utf-8");
            PrintWriter out = response.getWriter();
            String old = request.getParameter("name");
            if(old == null || old.length() == 0){
                out.println("用户名不能为空！");
            }else{
                String name = old;
                if(name.equals("zhangsan")){
                    out.println("用户名[" + name + "]已经存在！");
                }else{
                    out.println("用户名[" + name + "]尚未存在，可以使用！");
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }

    }
}
