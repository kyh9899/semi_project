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

@WebServlet(name = "boardNotice", urlPatterns = { "/board/notice", "/board/faq", "/board/question", "/board/search"})
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
    	
    	// 검색 조건과 검색 입력값을 받아옴
    	String searchField = request.getParameter("searchField"); // 검색 조건 : title or userId
    	String searchText = request.getParameter("searchText"); // 검색어 : 사용자 입력값
    	
    	System.out.println(boardId);
    	System.out.println(searchField);
    	System.out.println(searchText);

	  
			 try {    		
			 	page = Integer.parseInt(request.getParameter("page"));
			 } catch (NumberFormatException e) {
			  	page = 1;
			 }
			   
			 
		// 검색하는 값이 있는 경우
		if((searchField != null) && (searchText != null && !searchText.trim().equals(""))) {   
			listCount = new BoardService().getSearchTitleCount(boardId, searchField, searchText); // 게시글 개수
			pageInfo = new PageInfo(page, 10, listCount, 10); // page 정보
			list = new BoardService().getSearchTitleList(pageInfo, boardId, searchField, searchText); // 게시글 list 
		} else {
		// 검색하는 값이 없는 경우 (게시판의 게시글 모두 출력)
			listCount = new BoardService().getBoardCount(boardId); // 게시글 개수
		    pageInfo = new PageInfo(page, 10, listCount, 10); // page 정보
		    list = new BoardService().getBoardList(pageInfo, boardId); // 게시글 list 	
		}	   
			  
			  System.out.println("검색 게시판 아이디" + boardId);
			  System.out.println("검색 게시글 총 개수 " + listCount);
			  System.out.println("검색 게시글 목록" + list);
			
			  request.setAttribute("boardId", boardId);
			  request.setAttribute("pageInfo", pageInfo);
			  request.setAttribute("list", list);
			
			// 결과값을 게시판 별로 출력 
		    if (boardId.equals("faq")){
		    	request.getRequestDispatcher("/views/board/faq.jsp").forward(request, response);
		    } else if(boardId.equals("question")) {
		    	request.getRequestDispatcher("/views/board/question.jsp").forward(request, response);	    	
		    } else {
		    	request.getRequestDispatcher("/views/board/notice.jsp").forward(request, response);
		    } 
	    
    }
}
    	
    	
    	
//	    	try {    		
//	    		page = Integer.parseInt(request.getParameter("page"));
//	    	} catch (NumberFormatException e) {
//	    		page = 1;
//			}
//	    	
//	    	listCount = new BoardService().getBoardCount(boardId); // 게시글 개수
//	    	pageInfo = new PageInfo(page, 10, listCount, 10); // page 정보
//	    	list = new BoardService().getBoardList(pageInfo, boardId); // 게시글 list 
//	    	
//	   	    	
//	    	System.out.println(boardId);
//	    	System.out.println(listCount);
//	    	System.out.println(list);
//	
//	    	request.setAttribute("boardId", boardId);
//	    	request.setAttribute("pageInfo", pageInfo);
//	    	request.setAttribute("list", list);
//	    	
//	    	
//	    	if (boardId.equals("faq")){
//	    		request.getRequestDispatcher("/views/board/faq.jsp").forward(request, response);
//	    	} else {
//	    		request.getRequestDispatcher("/views/board/notice.jsp").forward(request, response);
//	    	}
//      }
//    }	    	

