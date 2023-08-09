package com.hm.mvc.program.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "pilatesInfo", urlPatterns = { "/pilates/info" })
public class PilatesInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public PilatesInfoServlet() {

    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/program/pilates.jsp").forward(request, response);
	}

}
