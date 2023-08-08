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
		String query = "SELECT * FROM MEMBER WHERE MG_ONF='Y'";
		
		try {
			stmt = connection.prepareStatement(query);

			stmt.setString(1, userId);
			
			rs = stmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("MB_NO"));
				member.setId(rs.getString("MB_ID"));
				member.setPwd(rs.getString("MB_PASSWORD"));
				member.setName(rs.getString("MB_NAME"));
				member.setSSN1(rs.getString("MB_SSN1"));
				member.setSSN2(rs.getString("MB_SSN2"));			    
				member.setPhone(rs.getString("MB_PHONE"));
				member.setAddress1(rs.getString("MB_ADDRESS1"));
				member.setAddress2(rs.getString("MB_ADDRESS2"));
				member.setEmail(rs.getString("MB_EMAIL"));
				member.setStatus(rs.getString("MB_STATUS"));
				member.setJoinDate(rs.getDate("JOIN_DATE"));
				member.setQuitDate(rs.getDate("QUIT_DATE"));
				member.setONF(rs.getString("MB_ONF"));
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
		String query = "INSERT INTO MEMBER VALUES(?,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,Y)";
		
		try {			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setInt(1, member.getNo());
			pstmt.setString(2, member.getId());
			pstmt.setString(3, member.getPwd());
			pstmt.setString(4, member.getName());
			pstmt.setString(5, member.getSSN1());
			pstmt.setString(6, member.getSSN2());
			pstmt.setString(7, member.getPhone());
			pstmt.setString(8, member.getEmail());
			pstmt.setString(9, member.getAddress1() + member.getAddress2());
			
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
		String query = "UPDATE MEMBER SET NAME=?,PHONE=?,EMAIL=?,ADDRESS=?,MODIFY_DATE=SYSDATE WHERE NO=?";
		
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
