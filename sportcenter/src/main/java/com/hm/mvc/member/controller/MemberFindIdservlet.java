package com.hm.mvc.member.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.script.ScriptContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.text.Document;

import com.hm.mvc.member.model.dao.MemberDao;
import com.hm.mvc.member.model.service.MemberService;
import com.hm.mvc.member.model.vo.Member;

import oracle.jdbc.Const;

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
		
//		String Member = "new MemberService().findid"; 
		
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		
		Member findMemberByName  = new MemberService().findid(name, phone);
    	
    	System.out.println(findMemberByName );
    	
    	
    	if (findMemberByName != null) {
    	    HttpSession session = request.getSession();
    	    session.setAttribute("findid", findMemberByName);

//    	    System.out.println("회원님의 아이디는 " + findMemberByName.getId() + " 입니다.");
    	    
    	    request.setAttribute("msg", "회원님의 아이디는 " + findMemberByName.getId() + " 입니다.");
    	    
//    	    System.out.println("회원님의 아이디는 " + Member + " 입니다.");
    	    
//    	    String setAttribute = "회원님의 아이디는 " + findid + " 입니다.";
    	    request.setAttribute("findid", findMemberByName);
    	    
    	    request.setAttribute("location", "/member/findid");
    	    
    	    request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//    	    response.sendRedirect(request.getContextPath() + "/login");
    	} else {
    	    request.setAttribute("msg", "회원 정보가 없습니다.");
    	    request.setAttribute("location", "/member/findid");

    	    request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    	}
	}
}

    	
    	
//    	if (findMemberByName  != null) {
//			
//    		HttpSession session = request.getSession();
//    		
//    		session.setAttribute("findid", findMemberByName ); // loginNember를 findid로 바꾸면 로그인 X 메인 화면을 이동
//    		
//    		request.setAttribute("msg", " 회원님의 아이디는 " +  findid + " 입니다.");
//    		
//    		
//    		response.sendRedirect(request.getContextPath() + "/login");
    		
    		
    		
    		
//    		response.getWriter().write(" 회원님의 아이디는 " +  findid + " 입니다.");
    		
    		
    		
//		} else {
//			
//			request.setAttribute("msg",  "회원 정보가 없습니다.");
//			request.setAttribute("location", "/member/findid");
//			
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}    	
//	}
//		
	


