package com.hm.mvc.board.controller;

import java.io.IOException;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

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

@WebServlet(name = "boardView", urlPatterns = { "/board/view" })
public class BoardViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BoardViewServlet() {
    }

    @Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int no = Integer.parseInt(request.getParameter("no"));
    	// boardId 파라미터 값을 읽어옴
    	String boardId = request.getParameter("boardId");
    	
    
	
		// 게시글 번호 받아서 조회수 증가 & 업데이트
		int updateCount = new BoardService().updateCount(no); 
    	
		if (updateCount > 0) {
			// 조회수 증가 성공
		    System.out.println("조회수가 증가하였습니다.");
		} else {
			// 조회수 증가 실패
		    System.out.println("조회수 증가에 실패하였습니다.");
		}	

		  
    	// 업데이트된 조회수를 가져와서 board 객체에 설정
        Board board = new BoardService().getBoardByNo(no);
        request.setAttribute("board", board);
        request.setAttribute("boardId", boardId);  // ✔ 속성 설정을 해줘야 view.jsp에서 boardId 값 사용 가능.  
	
    	board.setReadCount(board.getReadCount());

        // JSP 페이지로 포워드
        request.getRequestDispatcher("/views/board/view.jsp").forward(request, response);
	}
    
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int no = 0;
    	Board board = null;
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	String boardId = request.getParameter("boardId");
    	
    	board = new BoardService().getBoardByNo(no);
    	
    	
        Set<Integer> viewedPosts = (Set<Integer>) session.getAttribute("viewedPosts");
        
        if (viewedPosts == null) {
            viewedPosts = new HashSet<>();
            session.setAttribute("viewedPosts", viewedPosts);
        }

        // session에서 조회하지 않은 게시글인 경우
        if (!viewedPosts.contains(no)) {
            // 조회수 증가 및 업데이트
            int readCount = new BoardService().updateCount(no);
            if (readCount > 0) {
                // 조회수 증가 성공
                System.out.println("조회수가 증가하였습니다.");
                viewedPosts.add(no); 
            } else {
                // 조회수 증가 실패
                System.out.println("조회수 증가에 실패하였습니다.");
            }
        } else {
            // session 에서 이미 조회한 게시글인 경우
            System.out.println("이미 조회한 게시글입니다.");
        }

        System.out.println("게시글번호" + no);
    }
   	
}