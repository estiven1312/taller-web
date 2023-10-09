package org.grupo4.webapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.Map;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException, ServletException {
        getServletContext()
                .getRequestDispatcher("/jsp/login.jsp")
                .forward(httpServletRequest, httpServletResponse);
    }

    @Override
    protected void doPost(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse) throws IOException, ServletException {
        String username = httpServletRequest.getParameter("username");
        String password = httpServletRequest.getParameter("password");
        Map<String, String> errors = new HashMap<>();
        if(!username.equals("ADMIN@UNMSM.EDU")){
            errors.put("usernameError", "Usuario incorrecto");
        }
            if(!password.equals("12345")){
            errors.put("passwordError", "Contraseña incorrecta");
        }
        if(username.equalsIgnoreCase("ADMIN@UNMSM.EDU") && password.equals("12345")){
            httpServletResponse.sendRedirect(httpServletRequest.getContextPath()+"/home");
        } else{
            httpServletRequest.setAttribute("errors", errors);
            getServletContext()
                    .getRequestDispatcher("/jsp/login.jsp")
                    .forward(httpServletRequest, httpServletResponse);
        }
    }
}