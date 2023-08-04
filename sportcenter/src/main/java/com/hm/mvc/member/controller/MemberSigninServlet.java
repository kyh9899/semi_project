package com.hm.mvc.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hm.mvc.member.model.service.MemberService;
import com.hm.mvc.member.model.vo.Member;

@WebServlet(name = "memberSignin", urlPatterns = { "/member/signin" })
public class MemberSigninServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberSigninServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/views/member/signin.jsp").forward(request, response);
    	
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member member = new Member();
		
		member.setId(request.getParameter("userId"));
		member.setPassword(request.getParameter("userPwd"));
		
	 System.out.println(member);
	 
	 int result = new MemberService().save(member);
	 
	 if (result > 0) {
		request.setAttribute("msg", "로그인 성공");
		request.setAttribute("location", "/");
	} else {
		request.setAttribute("msg", "로그인 실패");
		request.setAttribute("location", "/member/signin");
	}
	 
	 request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
  }

}