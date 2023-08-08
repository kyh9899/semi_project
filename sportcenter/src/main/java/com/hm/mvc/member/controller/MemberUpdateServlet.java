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

@WebServlet(name = "memberUpdate", urlPatterns = { "/member/update" })
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberUpdateServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// 1. 로그인 된 사용자인지 체크
    	Member member = null;
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	
    	if(loginMember != null) {    	
    		// 2. 사용자가 수정한 내용을 가지고 Member 객체를 생성
    		member = new Member();
    		
    		member.setNo(loginMember.getNo());
    		member.setId(request.getParameter("userId"));
        	member.setName(request.getParameter("userName"));
        	member.setPhone(request.getParameter("phone"));
        	member.setEmail(request.getParameter("email"));
        	member.setAddress1(request.getParameter("address1"));
        	member.setAddress2(request.getParameter("address2"));
        	
        	// 3. 회원 정보 수정
        	int result = new MemberService().save(member);
        	
        	if(result > 0) {
        		// 정보 수정 성공
        		// 세션을 갱신한다.
        		session.setAttribute("loginMember", new MemberService().findMemberById(loginMember.getId()));
        		request.setAttribute("msg", "회원 정보 수정 완료");
        		request.setAttribute("location", "/member/myPage");    		
        	} else {
        		// 정보 수정 실패
        		request.setAttribute("msg", "회원 정보 수정 실패");
        		request.setAttribute("location", "/member/myPage");    		
        	}
    	} else {
    		request.setAttribute("msg", "로그인 후 수정해 주세요.");
    		request.setAttribute("location", "/");    		
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
    
    
    
    
    
    
}
