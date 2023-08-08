package com.hm.mvc.member.model.dao;

import static com.hm.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hm.mvc.member.model.vo.Member;

public class MemberDao {

	public Member findMemberById(Connection connection, String userId) {
		Member member = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE ID=? AND STATUS='Y'";
		
		try {
			stmt = connection.prepareStatement(query);

			stmt.setString(1, userId);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setName(rs.getString("NAME"));
				member.setId(rs.getString("ID"));
				member.setPwd(rs.getString("PASSWORD"));
				member.setSSN1(rs.getString("SSN1"));
				member.setSSN2(rs.getString("SSN2"));			    
				member.setPhone(rs.getString("PHONE"));
				member.setAddress1(rs.getString("ADDRESS1"));
				member.setAddress2(rs.getString("ADDRESS2"));
				member.setEmail(rs.getString("EMAIL"));
				member.setStatus(rs.getString("STATUS"));
				member.setJoinDate(rs.getDate("JOIN_DATE"));
				member.setQuitDate(rs.getDate("QUIT_DATE"));
				member.setONF(rs.getString("ONF"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(stmt);
		}
		
		return member;
	}

	public int insertMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEMBER VALUES(SEQ_UNO.NEXTVAL,?,?,DEFAULT,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT)";
		
		try {			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getPwd());
			pstmt.setString(4, member.getSSN1());
			pstmt.setString(5, member.getSSN2());
			pstmt.setString(6, member.getPhone());
			pstmt.setString(7, member.getEmail());
			pstmt.setString(8, member.getAddress1() + member.getAddress2());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET NAME=?,PHONE=?,EMAIL=?,ADDRESS=?,JOIN_DATE=SYSDATE WHERE NO=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getAddress1() + member.getAddress2());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

	public int updateMemberStatus(Connection connection, int no, String status) {
		int result = 0; 
		PreparedStatement pstmt = null;
		String query = "UPDATE MEMBER SET STATUS=? WHERE NO=?";
		
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
}
