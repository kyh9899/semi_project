package com.hm.mvc.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hm.mvc.board.model.service.BoardService;
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
		String content = request.getParameter("content");
    	HttpSession session = request.getSession(false);
    	Member loginMember = session != null ? (Member)session.getAttribute("loginMember") : null;

    	if(loginMember != null) {
			Reply reply = new Reply();
			
			reply.setBoardNo(boardNo);
			reply.setWriterNo(loginMember.getNo());
			reply.setContent(content);
			
			result = service.saveReply(reply);
			
			if(result > 0) {
         		request.setAttribute("msg", "답변 등록 성공!");
         		request.setAttribute("location", "/board/view?no=" + boardNo);
			} else {
				request.setAttribute("msg", "답변 등록 실패!");
         		request.setAttribute("location", "/board/view?no=" + boardNo);
			}
    	} else {
     		request.setAttribute("msg", "로그인 후 사용할 수 있습니다.");
     		request.setAttribute("location", "/");
    	}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
   	}
}