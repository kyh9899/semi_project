package com.hm.mvc.program.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "healthInfo", urlPatterns = { "/health/info" })
public class HealthInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public HealthInfoServlet() {

    }
    
    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	request.getRequestDispatcher("/views/program/health.jsp").forward(request, response);
	}

}
