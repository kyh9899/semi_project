package com.hm.mvc.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hm.mvc.board.model.service.BoardService;
import com.hm.mvc.board.model.vo.Board;
import com.hm.mvc.board.model.vo.Reply;
import com.hm.mvc.member.model.vo.Member;

@WebServlet(name = "boardReply", urlPatterns = { "/board/reply" })
public class BoardReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService service = new BoardService();

    public BoardReplyServlet() {
    }

    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int result = 0;
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String boardId = request.getParameter("boardId");
		String content = request.getParameter("content");
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;
//    	List<Reply> replies = null;
    	
    	if(loginMember != null) {
			Reply reply = new Reply();
			
			// 폼 파라미터로 넘어온 값들 
			reply.setBoardId(boardId);
			reply.setBoardNo(boardNo);
			reply.setWriterNo(loginMember.getNo());
			reply.setContent(content);
				
			// 문의에 대한 답변 INSERT 
			result = service.saveReply(reply);
			
			if(result > 0) {
         		request.setAttribute("msg", "답변 등록 성공!");	
//         		// 문의에 대한 답변 조회
//    			replies = new BoardService().getRepliesByNo(boardId, boardNo); // 답변 리스트 	
//    			
//    			System.out.println(replies);
//    			
//    			request.setAttribute("boardId", boardId);
//    			request.setAttribute("boardNo", boardNo);
//    			request.setAttribute("replies", replies);
         		request.setAttribute("location", "/board/question?boardId=" + boardId);
			} else {
				request.setAttribute("msg", "답변 등록 실패!");
         		request.setAttribute("location", "/board/question?boardId=" + boardId);
			}
    	} else {
     		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
     		request.setAttribute("location", "/login");
    	}
    	
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
   	}
}