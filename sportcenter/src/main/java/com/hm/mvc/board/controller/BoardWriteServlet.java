package com.hm.mvc.board.controller;

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
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet(name = "boardWrite", urlPatterns = { "/board/write" })
public class BoardWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BoardWriteServlet() {
    }

    @Override    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	// boardId 파라미터 값을 읽어옴
    	String boardId = request.getParameter("boardId");
    	
    	// ✔ 속성 설정을 해줘야 write.jsp에서 boardId 값 사용 가능.    	
    	request.setAttribute("boardId", boardId);
    	    	
    	if (loginMember != null) {			
    		request.getRequestDispatcher("/views/board/write.jsp").forward(request, response);
		} else {
			// 비회원의 경우 로그인창으로 연결시킴
			request.setAttribute("msg", "로그인 후 작성해 주세요.");
			request.setAttribute("location", "/login");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}
	}
    
    @Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	Member loginMember = (Member) session.getAttribute("loginMember");
    	// boardId 속성값을 얻어옴
    	String boardId = (String) request.getAttribute("boardId");
    	
    	if (loginMember != null) {			
    		// 파일이 저장될 경로
        	String path = getServletContext().getRealPath("/resources/upload/board");
        	
        	// 파일의 최대 사이즈 지정 (10MB)
        	int maxSize = 10485760;
        	
        	// 파일 인코딩 설정
        	String encoding = "UTF-8";    	
        	
        	// DefaultFileRenamePolicy : 중복되는 파일 이름 뒤에 1 ~ 9999 붙인다.
        	MultipartRequest mr = 
//    			new MultipartRequest(request, path, maxSize, encoding, new DefaultFileRenamePolicy());
        		// MultipartRequest(request값, 경로, 최대사이즈, 인코딩, 동일이름Rename정책)
        		new MultipartRequest(request, path, maxSize, encoding, new FileRename());
        	
        	
        	Board board = new Board();
        	
        	// 게시글을 작성한 작성자의 NO 값
        	board.setWriterNo(loginMember.getNo());

        	
        	// 폼 파라미터로 넘어온 값들 
        	board.setTitle(mr.getParameter("title"));
        	board.setContent(mr.getParameter("content"));
        	board.setContent2(mr.getParameter("content2"));        	
            board.setBoardId(mr.getParameter("boardId"));

        	// 파일에 대한 정보
        	board.setRenamedFilename(mr.getFilesystemName("upfile"));
        	board.setOriginalFilename(mr.getOriginalFileName("upfile"));
        	
        	int result = new BoardService().save(board);        	
        	
        	if (result > 0) {
        		// 게시글 등록 성공 후, 해당하는 게시판 첫 페이지로 이동
        		request.setAttribute("msg", "게시글 등록 성공");
        		request.setAttribute("location", "/board/notice?boardId="+board.getBoardId());
        	} else {
        		// 게시글 등록 실패
        		request.setAttribute("msg", "게시글 등록 실패");
        		request.setAttribute("location", "/board/write");
        	}
		} else {
			request.setAttribute("msg", "로그인 후 작성해 주세요.");
			request.setAttribute("location", "/");
		}
    	
    	request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
    }
}
