package com.hm.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hm.mvc.member.model.dao.MemberDao;
import com.hm.mvc.member.model.service.MemberService;
import com.hm.mvc.member.model.vo.Member;

@WebServlet(name = "memberFindid", urlPatterns = { "/member/findid" })
public class MemberFindIdservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberFindIdservlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/findid.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		Member findMemberByName  = new MemberService().findid(name, phone);
    	
    	System.out.println(findMemberByName );
    	
    	if (findMemberByName  != null) {
			
    		HttpSession session = request.getSession();
    		
    		session.setAttribute("loginMember", findMemberByName );
    		
    		
    		response.sendRedirect(request.getContextPath() + "/");
		} else {
			
			request.setAttribute("msg",  "아이디 정보가 없습니다.");
			request.setAttribute("location", "/member/findid");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}    	
	}
		
	}


