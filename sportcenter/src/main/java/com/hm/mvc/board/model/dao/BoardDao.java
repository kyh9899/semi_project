package com.hm.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.hm.mvc.board.model.vo.Board;
import com.hm.mvc.board.model.vo.Reply;
import com.hm.mvc.common.util.PageInfo;

import static com.hm.mvc.common.jdbc.JDBCTemplate.close;

public class BoardDao {

	public int getBoardCount(Connection connection) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM BOARD WHERE STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return count;
	}

	public List<Board> findAll(Connection connection, PageInfo pageInfo) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT RNUM, NO, TITLE, ID, CREATE_DATE, ORIGINAL_FILENAME, READCOUNT, STATUS "
				    + "FROM ("
				    +    "SELECT ROWNUM AS RNUM, "
				    +           "NO, "
				    + 			"TITLE, "
				    + 			"ID, "
				    + 			"CREATE_DATE, "
				    + 			"ORIGINAL_FILENAME, "
				    +  			"READCOUNT, "
				    +     		"STATUS "
				    + 	 "FROM ("
				    + 	    "SELECT B.NO, "
				    + 			   "B.TITLE, "
				    +  			   "M.ID, "
				    + 			   "B.CREATE_DATE, "
				    + 			   "B.ORIGINAL_FILENAME, "
				    + 			   "B.READCOUNT, "
				    + 	   		   "B.STATUS "
				    + 		"FROM BOARD B "
				    + 		"JOIN MEMBER M ON(B.WRITER_NO = M.NO) "
				    + 		"WHERE B.STATUS = 'Y' ORDER BY B.NO DESC"
				    + 	 ")"
				    + ") WHERE RNUM BETWEEN ? and ?";

		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, pageInfo.getStartList());
			pstmt.setInt(2, pageInfo.getEndList());
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board();
				
				board.setNo(rs.getInt("NO"));
				board.setRowNum(rs.getInt("RNUM"));
				board.setWriterId(rs.getString("ID"));
				board.setTitle(rs.getString("TITLE"));
				board.setCreateDate(rs.getDate("CREATE_DATE"));
				board.setOriginalFilename(rs.getString("ORIGINAL_FILENAME"));
				board.setReadCount(rs.getInt("READCOUNT"));
				board.setStatus(rs.getString("STATUS"));
				
				list.add(board);
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public Board findBoardByNo(Connection connection, int no) {
		Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT  B.NO, "
							 + "B.TITLE, "
							 + "M.ID, "
							 + "B.READCOUNT, "
							 + "B.ORIGINAL_FILENAME, "
							 + "B.RENAMED_FILENAME, "
							 + "B.CONTENT, "
							 + "B.CREATE_DATE, "
							 + "B.MODIFY_DATE "
					 + "FROM BOARD B "
					 + "INNER JOIN MEMBER M ON(B.WRITER_NO = M.NO) "
					 + "WHERE B.STATUS = 'Y' AND B.NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new Board();
				
				board.setNo(rs.getInt("NO"));
				board.setTitle(rs.getString("TITLE"));
				board.setWriterId(rs.getString("ID"));
				board.setReadCount(rs.getInt("READCOUNT"));
				board.setOriginalFilename(rs.getString("ORIGINAL_FILENAME"));
				board.setRenamedFilename(rs.getString("RENAMED_FILENAME"));
				board.setContent(rs.getString("CONTENT"));
				// 댓글 조회
				board.setReplies(this.getRepliesByNo(connection, no));
				board.setCreateDate(rs.getDate("CREATE_DATE"));
				board.setModifyDate(rs.getDate("MODIFY_DATE"));
			}			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return board;
	}

	public int insertBoard(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO BOARD VALUES(SEQ_BOARD_NO.NEXTVAL,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, board.getWriterNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getOriginalFilename());
			pstmt.setString(5, board.getRenamedFilename());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateBoard(Connection connection, Board board) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET TITLE=?,CONTENT=?,ORIGINAL_FILENAME=?,RENAMED_FILENAME=?,MODIFY_DATE=SYSDATE WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setString(3, board.getOriginalFilename());
			pstmt.setString(4, board.getRenamedFilename());
			pstmt.setInt(5, board.getNo());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}		
		
		return result;
	}

	public int updateStatus(Connection connection, int no, String status) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE BOARD SET STATUS=? WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, status);
			pstmt.setInt(2, no);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
	
	
	public List<Reply> getRepliesByNo(Connection connection, int boardNo) {
		List<Reply> replies = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT R.NO, "
							 + "R.BOARD_NO, "
							 + "R.CONTENT, "
							 + "M.ID, "
							 + "R.CREATE_DATE, "
							 + "R.MODIFY_DATE "
					  + "FROM REPLY R "
					  + "JOIN MEMBER M ON(R.WRITER_NO = M.NO) "
					  + "WHERE R.STATUS='Y' AND BOARD_NO=? "
					  + "ORDER BY R.NO DESC";	
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, boardNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Reply reply = new Reply();
				
				reply.setNo(rs.getInt("NO"));
				reply.setBoardNo(rs.getInt("BOARD_NO"));
				reply.setContent(rs.getString("CONTENT"));
				reply.setWriterId(rs.getString("ID"));
				reply.setCreateDate(rs.getDate("CREATE_DATE"));
				reply.setModifyDate(rs.getDate("MODIFY_DATE"));
				
				replies.add(reply);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}		
		
		return replies;
	}
	
	public int insertReply(Connection connection, Reply reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO REPLY VALUES(SEQ_REPLY_NO.NEXTVAL, ?, ?, ?, DEFAULT, DEFAULT, DEFAULT)";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, reply.getBoardNo());
			pstmt.setInt(2, reply.getWriterNo());
			pstmt.setString(3, reply.getContent());
			
			result = pstmt.executeUpdate();	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}
}
