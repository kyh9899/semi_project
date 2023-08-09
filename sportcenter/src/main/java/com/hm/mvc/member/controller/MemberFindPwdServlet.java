package com.hm.mvc.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hm.mvc.member.model.service.MemberService;
import com.hm.mvc.member.model.vo.Member;

@WebServlet(name = "memberFindPwd", urlPatterns = { "/member/findpwd" })
public class MemberFindPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberFindPwdServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/member/findpwd.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String userId = request.getParameter("userId");
		String phone = request.getParameter("phone");
		
		Member loginMember = new MemberService().login(userId, phone);
    	
    	System.out.println(loginMember);
    	
    	if (loginMember != null) {
			
    		HttpSession session = request.getSession();
    		
    		session.setAttribute("loginMember", loginMember);
    		
    		response.sendRedirect(request.getContextPath() + "/login");
		} else {
			
			request.setAttribute("msg",  "정보가 없습니다.");
			request.setAttribute("location", "/member/findpwd");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}    	
	}
	}