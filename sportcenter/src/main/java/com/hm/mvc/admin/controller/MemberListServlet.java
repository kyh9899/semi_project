package com.hm.mvc.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/admin/members")
public class MemberListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberListServlet() {
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("/views/admin/members.jsp").forward(request, response);
	}
}