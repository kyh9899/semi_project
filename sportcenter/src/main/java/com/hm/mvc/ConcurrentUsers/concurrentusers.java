package com.hm.mvc.ConcurrentUsers;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "concurrentUsers", urlPatterns = { "/CCU" })
public class concurrentusers extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public concurrentusers() {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        String userInfo = "Guest"; // 기본적으로 "Guest"로 설정
        
        if (session != null) {
            String MB_ID = (String) session.getAttribute("MB_ID");
            if (MB_ID != null) {
                userInfo = MB_ID; // 로그인한 사용자의 이름으로 설정
            }
        }
        System.out.println("doGet 요청 받음");

        response.setContentType("text/plain");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(userInfo);
    }
    
    

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }
}

