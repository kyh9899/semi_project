package com.hm.mvc.member.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hm.mvc.member.model.dao.MemberDao;
import com.hm.mvc.member.model.service.MemberService;
import com.hm.mvc.member.model.vo.Member;

@WebServlet(name = "memberPasswordChange", urlPatterns = { "/password/change" })
public class MemberPasswordChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ServletRequest session;
       
    public MemberPasswordChangeServlet() {

    }

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		
        String currentPassword = request.getParameter("userPwd");
        String encryptedPassword1 = encryptSHA256(currentPassword);
        
        String newPassword = request.getParameter("newPassword");
        String encryptedPassword2 = encryptSHA256(newPassword);
        
        Member loginMember = (Member) session.getAttribute("loginMember");
        


        System.out.println(encryptedPassword1);
        System.out.println(encryptedPassword2);
        
        // 비밀번호 변경 로직
        if (loginMember != null && loginMember.getPwd().equals(encryptedPassword1)) {
            int result = new MemberService().updateMemberPwd(loginMember.getNo(), encryptedPassword2);
            if (result > 0) {
                request.setAttribute("msg", "비밀번호 변경 성공");
                request.setAttribute("location", "/member/myPage");
            } else {
                request.setAttribute("msg", "비밀번호 변경 실패");
                request.setAttribute("location", "/member/myPage");
            }
        } else {
            request.setAttribute("msg", "비밀번호 변경에 실패하였습니다. 기존 비밀번호를 확인해주세요.");
            request.setAttribute("location", "/member/myPage");
        }

        request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }
	
	 // SHA-256 암호화 메서드
    private String encryptSHA256(String input) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(input.getBytes());

            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = String.format("%02x", b);
                hexString.append(hex);
            }

            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
