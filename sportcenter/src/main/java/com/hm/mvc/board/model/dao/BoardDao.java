package com.hm.mvc.board.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.hm.mvc.board.model.vo.Board;
import com.hm.mvc.board.model.vo.Reply;
import com.hm.mvc.common.util.PageInfo;

import static com.hm.mvc.common.jdbc.JDBCTemplate.close;

public class BoardDao {

	public int getBoardCount(Connection connection, String boardId) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT COUNT(*) FROM POST WHERE P_STATUS='Y' AND B_ID=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, boardId);  // boardId 파라미터 값을 넘겨준다. 
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

	public List<Board> findAll(Connection connection, PageInfo pageInfo, String boardId) {
		List<Board> list = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Board board = null;
		
		String query = "SELECT RNUM, P_NO, P_TITLE, MB_ID, P_CREATE_DATE, P_ORG_FILENAME, P_RDCOUNT, P_STATUS "
					 + "FROM (SELECT B.B_ID, P.P_NO, P.P_TITLE, M.MB_ID, P.P_CREATE_DATE, P.P_ORG_FILENAME, P.P_RDCOUNT, P.P_STATUS, ROWNUM AS RNUM "
					 + "FROM POST P "
					 + "JOIN MEMBER M ON (P.MB_CODE = M.MB_CODE) JOIN BOARD B ON (P.B_ID = B.B_ID) "
					 + "WHERE P.P_STATUS = 'Y' AND B.B_ID=? "
					 + "ORDER BY P.P_NO DESC) SUBQ "
					 + "WHERE RNUM BETWEEN ? AND ? ";

		try {
			pstmt = connection.prepareStatement(query);
			pstmt.setString(1, boardId);
			
			System.out.println(pageInfo.getEndList());
			System.out.println(pageInfo.getStartList());
			
			pstmt.setInt(2, pageInfo.getEndList());
		    pstmt.setInt(3, pageInfo.getStartList());
			
			rs = pstmt.executeQuery();
			
				while (rs.next()) {
					
				board = new Board();
					
				board.setNo(rs.getInt("P_NO"));
				board.setRowNum(rs.getInt("RNUM"));
				board.setWriterId(rs.getString("MB_ID"));
				board.setTitle(rs.getString("P_TITLE"));
				board.setCreateDate(rs.getDate("P_CREATE_DATE"));
				board.setOriginalFilename(rs.getString("P_ORG_FILENAME"));
				board.setReadCount(rs.getInt("P_RDCOUNT"));
				board.setStatus(rs.getString("P_STATUS"));
						
				list.add(board);			
			}	
				
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(list);
		return list;
	}

	public Board findBoardByNo(Connection connection, int no) {
		Board board = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT P.P_NO, P.P_TITLE, M.MB_ID, P.P_RDCOUNT, P.P_ORG_FILENAME, P.P_RND_FILENAME, P.P_CONTENT, P.P_CREATE_DATE, P.P_MODIFY_DATE "
		       + "FROM POST P INNER JOIN MEMBER M ON (P.MB_CODE = M.MB_CODE) WHERE P.P_STATUS = 'Y' AND P.P_NO=? ";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, no);
			
			rs = pstmt.executeQuery();
			
			if (rs.next()) {
				board = new Board();
				
				board.setTitle(rs.getString("P_TITLE"));
				board.setNo(rs.getInt("P_NO"));
				board.setWriterId(rs.getString("MB_ID"));
				board.setReadCount(rs.getInt("P_RDCOUNT"));
				board.setOriginalFilename(rs.getString("P_ORG_FILENAME"));
				board.setRenamedFilename(rs.getString("P_RND_FILENAME"));
				board.setContent(rs.getString("P_CONTENT"));
				// 댓글 조회
				board.setReplies(this.getRepliesByNo(connection, no));
				board.setCreateDate(rs.getDate("P_CREATE_DATE"));
				board.setModifyDate(rs.getDate("P_MODIFY_DATE"));
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
//		Date sqlCreateDate = new Date(board.getCreateDate().getTime());
		
		String query = "INSERT INTO POST VALUES(SEQ_POST_NO.NEXTVAL,DEFAULT,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
		
		
		try {
			pstmt = connection.prepareStatement(query);
				
			pstmt.setInt(1, board.getWriterNo());
			pstmt.setString(2, board.getTitle());
			pstmt.setString(3, board.getContent());
			pstmt.setString(4, board.getOriginalFilename());
			pstmt.setString(5, board.getRenamedFilename());
//			pstmt.setInt(6, board.getReadCount());
//			pstmt.setDate(7, (java.sql.Date) sqlCreateDate);
			
			
			System.out.println(board);
						
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
		String query = "UPDATE POST SET P_TITLE=?,P_CONTENT=?,P_ORG_FILENAME=?,P_RND_FILENAME=?,P_MODIFY_DATE=SYSDATE WHERE P_NO=?";
		
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
		String query = "UPDATE POST SET P_STATUS=? WHERE P_NO=?";
		
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

	public int updateReadCount(Connection connection, int no) {
		int updateCount = 0;
	    PreparedStatement pstmt = null;
	    String query = "UPDATE POST SET P_RDCOUNT = P_RDCOUNT + 1 WHERE P_NO = ?";

	    try {
	        pstmt = connection.prepareStatement(query);
	        pstmt.setInt(1, no);
	        
	        updateCount = pstmt.executeUpdate();
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(pstmt);
	    }

	    return updateCount;
	}
	
}
