package com.hm.mvc.member.controller;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hm.mvc.common.util.EncryptUtil;
import com.hm.mvc.member.model.service.MemberService;
import com.hm.mvc.member.model.vo.Member;

@WebServlet(name = "memberLogin", urlPatterns = { "/login" })
public class MemberLoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public MemberLoginServlet() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/views/member/signin.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("id");
        
        // SHA-256 암호화 수행
        String rawPassword = request.getParameter("pwd");
        String encryptedPassword = encryptSHA256(rawPassword);

        String saveId = request.getParameter("saveId");

        System.out.println(id + ", " + encryptedPassword + ", " + saveId);

        // 로그인 조회 기능이 성공하고 나서 '아이디 기억하기' 기능 활성화시 주석 풀기
        if (saveId != null) {
            // 전달된 아이디를 쿠키에 저장
            // 1. 쿠키 생성
            Cookie cookie = new Cookie("saveId", id);

            cookie.setMaxAge(259200); // 3일 동안 유지

            // 2. response 객체에 쿠키 추가
            response.addCookie(cookie);
        } else {
            // 기존 쿠키 값을 삭제
            Cookie cookie = new Cookie("saveId", "");

            cookie.setMaxAge(0);
            response.addCookie(cookie);
        }

        Member loginMember = new MemberService().login(id, encryptedPassword);

        System.out.println(loginMember);

        if (loginMember != null) {
            // loginMember 세션에 저장
            // 로그인 성공 시
            HttpSession session = request.getSession();

            session.setAttribute("loginMember", loginMember);

            response.sendRedirect(request.getContextPath() + "/");
        } else {
            // 로그인 실패 시
            // 메시지를 띄워주고 홈 화면으로 이동
            request.setAttribute("msg", "아이디나 비밀번호가 일치하지 않습니다.");
            request.setAttribute("location", "/login");

            // reqeust 객체의 데이터를 유지해서 에러 메시지를 전달하기 위해 forward를 실행한다.
            request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
        }
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
