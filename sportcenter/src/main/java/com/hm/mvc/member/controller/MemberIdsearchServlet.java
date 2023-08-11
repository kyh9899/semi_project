package com.hm.mvc.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hm.mvc.member.model.service.MemberService;
import com.hm.mvc.member.model.vo.Member;

@WebServlet(name = "memberIdsearch", urlPatterns = { "/member/idsearch" })
public class MemberIdsearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    public MemberIdsearchServlet() {
    }

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		request.getRequestDispatcher("/views/member/findid.jsp").forward(request, response);
		
				//1.인코딩
				request.setCharacterEncoding("utf-8");
				//2.변수저장
				String memberName = request.getParameter("name");
				String phone = request.getParameter("phone");
				//3.비지니스로직
				MemberService service = new MemberService();
				Member member = service.findid(memberName,phone);
				
				System.out.println("member : " + member);

				//4.뷰 처리
				if(member != null) {
					RequestDispatcher rd = request.getRequestDispatcher("/views/member/idsearch.jsp");
					request.setAttribute("members", member);
					rd.forward(request, response);
					
				}else {
					request.setAttribute("msg", "정확한 정보를 입력해 주세요!");
					request.setAttribute("location", "/member/findid");
					RequestDispatcher rd = request.getRequestDispatcher("/views/common/msg.jsp");
					rd.forward(request, response);
				}
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
