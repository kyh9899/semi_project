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
		
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		
		Member findMemberById = new MemberService().findpwd(id, phone);
    	
    	System.out.println(findMemberById);
    	
    	if (findMemberById != null) {
			
    		HttpSession session = request.getSession();
    		
    		session.setAttribute("findpwd", findMemberById);
    		
    		request.setAttribute("msg", "회원닙의 비밀번호는 " + findMemberById.getPwd() + " 입니다.");
    		
//    		response.sendRedirect(request.getContextPath() + "/");
    		
request.setAttribute("findid", findMemberById);
    	    
    	    request.setAttribute("location", "/member/findpwd");
    	    
    	    request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    		
    		
		} else {
			
			request.setAttribute("msg",  "회원 정보가 없습니다.");
			request.setAttribute("location", "/member/findpwd");
			
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}    	
	}
	}