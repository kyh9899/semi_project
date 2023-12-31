package com.hm.mvc.board.model.service;

import java.sql.Connection;
import java.util.List;

import com.hm.mvc.board.model.dao.BoardDao;
import com.hm.mvc.board.model.vo.Board;
import com.hm.mvc.board.model.vo.Reply;
import com.hm.mvc.common.util.PageInfo;

import static com.hm.mvc.common.jdbc.JDBCTemplate.close;
import static com.hm.mvc.common.jdbc.JDBCTemplate.commit;
import static com.hm.mvc.common.jdbc.JDBCTemplate.rollback;
import static com.hm.mvc.common.jdbc.JDBCTemplate.getConnection;

public class BoardService {

	public int getBoardCount(String boardId) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection, boardId);
		
		close(connection);
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo, String boardId) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo, boardId);
		
		close(connection);
		
		return list;
	}

	public Board getBoardByNo(int no) {
		Board board = null;
		Connection connection = getConnection();
		
		board = new BoardDao().findBoardByNo(connection, no);
		
		close(connection);
		
		return board;
	}

	public int save(Board board) {
		int result = 0;
		Connection connection = getConnection();
		
		if (board.getNo() > 0) {
			// update
			result = new BoardDao().updateBoard(connection, board);
		} else {
			// insert
			result = new BoardDao().insertBoard(connection, board);
		}
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);			
		}
		
		close(connection);
		
		return result;
	}

	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new BoardDao().updateStatus(connection, no, "N");
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	// 게시글에 대한 답변 오라클에 INSERT
	public int saveReply(Reply reply) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new BoardDao().insertReply(connection, reply);
		
		if(result > 0) {
			commit(connection);
			
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	// 조회수 증가 및 업데이트 메소드 호출
	public int updateCount(int no) {
		int updateCount = 0;
		Connection connection = getConnection();
		
		updateCount = new BoardDao().updateReadCount(connection, no);
		
		if (updateCount > 0) {
		    commit(connection);
		} else {
		    rollback(connection);
		}
		
		close(connection);
		
		return updateCount;
	}

	// 검색된 게시물 개수 조회
	public int getSearchTitleCount(String boardId, String searchField, String searchText) {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getSearchTitleCount(connection, boardId, searchField, searchText);
		
		close(connection);
		
		return count;
	}

	// 검색된 게시물 목록 조회
	public List<Board> getSearchTitleList(PageInfo pageInfo, String boardId, String searchField, String searchText) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findSearchResult(connection, pageInfo, boardId, searchField, searchText);
		
		close(connection);
		
		return list;
	}

	// 문의에 대한 답변 조회
//	public List<Reply> getRepliesByNo(int no) {
//		List<Reply> replies = null;
//		Connection connection = getConnection();
//		
//		replies = new BoardDao().getRepliesByNo(connection, no);
//		
//		close(connection);
//		
//		return replies;
//	}
}
