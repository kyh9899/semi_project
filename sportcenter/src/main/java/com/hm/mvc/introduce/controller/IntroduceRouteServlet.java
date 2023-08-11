package com.hm.mvc.introduce.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "introduceRoute", urlPatterns = { "/introduce/Route" })
public class IntroduceRouteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public IntroduceRouteServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	request.getRequestDispatcher("/views/introduce/route.jsp").forward(request, response);
	}

}
