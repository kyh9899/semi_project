package com.hm.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hm.mvc.board.model.service.BoardService;
import com.hm.mvc.board.model.vo.Board;
import com.hm.mvc.common.util.PageInfo;

@WebServlet(name = "boardNotice", urlPatterns = { "/board/notice" })
public class BoardNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardNoticeServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int page = 0;
    	int listCount = 0;
    	PageInfo pageInfo = null;  
    	List<Board> list = null;
    	
    	try {    		
    		page = Integer.parseInt(request.getParameter("page"));
    	} catch (NumberFormatException e) {
    		page = 1;
		}
    	
    	listCount = new BoardService().getBoardCount();
    	pageInfo = new PageInfo(page, 10, listCount, 10);
    	list = new BoardService().getBoardList(pageInfo);
    	
    	request.setAttribute("pageInfo", pageInfo);
    	request.setAttribute("list", list);
		request.getRequestDispatcher("/views/board/notice.jsp").forward(request, response);
	}
}
