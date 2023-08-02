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

	public int getBoardCount() {
		int count = 0;
		Connection connection = getConnection();
		
		count = new BoardDao().getBoardCount(connection);
		
		close(connection);
		
		return count;
	}

	public List<Board> getBoardList(PageInfo pageInfo) {
		List<Board> list = null;
		Connection connection = getConnection();
		
		list = new BoardDao().findAll(connection, pageInfo);
		
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
}
