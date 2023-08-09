package com.hm.mvc.board.controller;

import static com.hm.mvc.common.jdbc.JDBCTemplate.commit;
import static com.hm.mvc.common.jdbc.JDBCTemplate.rollback;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hm.mvc.board.model.service.BoardService;
import com.hm.mvc.board.model.vo.Board;
import com.hm.mvc.common.util.FileRename;
import com.hm.mvc.member.model.vo.Member;
import com.oreilly.servlet.MultipartRequest;

@WebServlet(name = "boardUpdate", urlPatterns = { "/board/update" })
public class BoardUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardUpdateServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int no = 0;
    	Board board = null;
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	
    	no = Integer.parseInt(request.getParameter("no"));
		board = new BoardService().getBoardByNo(no);
		
		request.setAttribute("board", board);
		request.getRequestDispatcher("/views/board/update.jsp").forward(request, response);   
		
		
		
//    	if (loginMember != null) {			
//    		no = Integer.parseInt(request.getParameter("no"));
//    		board = new BoardService().getBoardByNo(no);
//    		
//    		if (board != null && loginMember.getId().equals(board.getWriterId())) {
//    			request.setAttribute("board", board);
//    			request.getRequestDispatcher("/views/board/update.jsp").forward(request, response);    			
//    		} else {
//    			request.setAttribute("msg", "잘못된 접근입니다.");
//    			request.setAttribute("location", "/board/notice");
//    			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);	
//    		}    		
//		} else {
//			request.setAttribute("msg", "로그인 후 수정해 주세요.");
//			request.setAttribute("location", "/");
//			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
//		}
	}

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int no = 0;
    	Board board = null;
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
  
    	
    	String path = getServletContext().getRealPath("/resources/upload/board");
    	int maxSize = 10485760;
    	String encoding = "UTF-8";    	
    	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
		
		no = Integer.parseInt(mr.getParameter("no"));
		board = new BoardService().getBoardByNo(no);
		
		board.setTitle(mr.getParameter("title"));
		board.setContent(mr.getParameter("content"));
		
		String originalFileName = mr.getOriginalFileName("upfile");
		String filesystemName = mr.getFilesystemName("upfile");
		
		if (originalFileName != null && filesystemName != null) {
			board.setOriginalFilename(originalFileName);
			board.setRenamedFilename(filesystemName);
		}
		
		int result = new BoardService().save(board);
		
		if (result > 0) {
			// 게시글 수정 성공
			request.setAttribute("msg", "게시글 수정 성공");
			request.setAttribute("location", "/board/view?no=" + board.getNo());
		} else {
			// 게시글 수정 실패
			request.setAttribute("msg", "게시글 수정 실패");
			request.setAttribute("location", "/board/update?no=" + board.getNo());
		}
		
   	
    	
    	
//    	if (loginMember != null) {		
//        	String path = getServletContext().getRealPath("/resources/upload/board");
//        	int maxSize = 10485760;
//        	String encoding = "UTF-8";    	
//        	MultipartRequest mr = new MultipartRequest(request, path, maxSize, encoding, new FileRename());
//    		
//    		no = Integer.parseInt(mr.getParameter("no"));
//    		board = new BoardService().getBoardByNo(no);
//    		
//    		if (board != null && loginMember.getId().equals(board.getWriterId())) {
//    			board.setTitle(mr.getParameter("title"));
//    			board.setContent(mr.getParameter("content"));
//    			
//    			String originalFileName = mr.getOriginalFileName("upfile");
//    			String filesystemName = mr.getFilesystemName("upfile");
//    			
//    			if (originalFileName != null && filesystemName != null) {
//    				board.setOriginalFilename(originalFileName);
//					board.setRenamedFilename(filesystemName);
//				}
//    			
//    			int result = new BoardService().save(board);
//    			
//    			if (result > 0) {
//					// 게시글 수정 성공
//    				request.setAttribute("msg", "게시글 수정 성공");
//    				request.setAttribute("location", "/board/view?no=" + board.getNo());
//				} else {
//					// 게시글 수정 실패
//					request.setAttribute("msg", "게시글 수정 실패");
//					request.setAttribute("location", "/board/update?no=" + board.getNo());
//				}
//    		} else {
//    			request.setAttribute("msg", "잘못된 접근입니다.");
//    			request.setAttribute("location", "/board/notice");
//    		}    		
//		} else {
//			request.setAttribute("msg", "로그인 후 수정해 주세요.");
//			request.setAttribute("location", "/");
//		}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
	}
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
