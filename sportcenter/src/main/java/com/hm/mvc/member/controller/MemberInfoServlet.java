package com.hm.mvc.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hm.mvc.member.model.vo.Member;

@WebServlet(name = "memberInfo", urlPatterns = { "/member/myPage" })
public class MemberInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberInfoServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	
    	if(loginMember != null) {    		
    		request.getRequestDispatcher("/views/member/myPage.jsp").forward(request, response);
    	} else {
    		request.setAttribute("msg", "로그인 후 수정해 주세요.");
    		request.setAttribute("location", "/");
    		
    		request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
	}
    
    
    
    
    
    
    
    
    
    
}
