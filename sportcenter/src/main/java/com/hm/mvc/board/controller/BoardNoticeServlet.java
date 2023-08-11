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

@WebServlet(name = "boardNotice", urlPatterns = { "/board/notice", "/board/faq" })
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
    	String boardId = request.getParameter("boardId");
    	String searchTerm = request.getParameter("searchTerm");
        // 검색 결과를 request나 session에 저장
//      request.setAttribute("searchResults", searchResults);
      
     
//      RequestDispatcher dispatcher = request.getRequestDispatcher("/path/to/notice.jsp");
//      dispatcher.forward(request, response);
    	
    	
    	   
	    	try {    		
	    		page = Integer.parseInt(request.getParameter("page"));
	    	} catch (NumberFormatException e) {
	    		page = 1;
			}
	    	
	    	listCount = new BoardService().getBoardCount(boardId); // 게시글 개수
	    	pageInfo = new PageInfo(page, 10, listCount, 10); // page 정보
	    	
	    	list = new BoardService().getBoardList(pageInfo, boardId); // 게시글 list 
	    	
	   	    	
	    	System.out.println(boardId);
	    	System.out.println(listCount);
	    	System.out.println(list);
	
	    	request.setAttribute("boardId", boardId);
	    	request.setAttribute("pageInfo", pageInfo);
	    	request.setAttribute("list", list);
	    	
	    	
	    	if (boardId.equals("faq")){
	    		request.getRequestDispatcher("/views/board/faq.jsp").forward(request, response);
	    	} else {
	    		request.getRequestDispatcher("/views/board/notice.jsp").forward(request, response);
	    	}
      }
    }	    	

