package com.hm.mvc.member.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;  // 추가
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hm.mvc.member.model.service.MemberService;
import com.hm.mvc.member.model.vo.Member;

@WebServlet(name = "memberEnroll", urlPatterns = { "/member/enroll" })
public class MemberEnrollServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    public MemberEnrollServlet() {
    }
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 회원가입 페이지로 포워딩
        request.getRequestDispatcher("/views/member/enroll.jsp").forward(request, response);
    }
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // request.setCharacterEncoding("UTF-8");

        Member member = new Member();

        member.setName(request.getParameter("name"));
        member.setId(request.getParameter("id"));

        // SHA-256 암호화 수행
        String rawPassword = request.getParameter("pwd");
        String encryptedPassword = encryptSHA256(rawPassword);
        member.setPwd(encryptedPassword);

        member.setSSN1(request.getParameter("SSN1"));
        member.setSSN2(request.getParameter("SSN2"));
        member.setPhone(request.getParameter("contactNumber"));
        member.setAddress1(request.getParameter("addr"));
        member.setAddress2(request.getParameter("addr_dtl"));
        member.setEmail(request.getParameter("email"));

        System.out.println(member);

        int result = new MemberService().save(member);

        if (result > 0) {
            // 회원 가입 완료
            request.setAttribute("msg", "회원 가입 성공");
            request.setAttribute("location", "/");
        } else {
            // 회원 가입 실패
            request.setAttribute("msg", "회원 가입 실패");
            request.setAttribute("location", "/member/enroll");
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
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            
            return hexString.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
            return null;
        }
    }
}
