package com.hm.mvc.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.hm.mvc.member.model.service.MemberService;

@WebServlet(name = "idCheckServlet", urlPatterns = { "/member/idCheck" })
public class MemberIdCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public MemberIdCheckServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// ID 값을 가져와서 DB에 있는 값인지 확인하고 결과(JSON)를 전달한다.
    	Map<String, Boolean> map = new HashMap<>();
    	String userId = request.getParameter("userId");
    	
    	map.put("duplicate", new MemberService().isDuplicateId(userId));
    	
    	response.setContentType("application/json;charset=UTF-8");
    	response.getWriter().write(new Gson().toJson(map));    	
	}
}
