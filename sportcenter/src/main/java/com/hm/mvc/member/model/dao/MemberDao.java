package com.hm.mvc.member.model.dao;

import static com.hm.mvc.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.hm.mvc.member.model.vo.Member;

public class MemberDao {

	public Member findMemberById(Connection connection, String id) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String query = "SELECT * FROM MEMBER WHERE MB_ID=? AND MB_STATUS='Y'";
		
		try {
			pstmt = connection.prepareStatement(query);

			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				member = new Member();
				
				member.setNo(rs.getInt("MB_CODE"));
				member.setId(rs.getString("MB_ID"));
				member.setPwd(rs.getString("MB_PWD"));
				member.setName(rs.getString("MB_NAME"));
				member.setSSN1(rs.getString("MB_SSN"));
				member.setSSN2(rs.getString("MB_SSN"));
				member.setPhone(rs.getString("MB_PHONE"));
				member.setAddress1(rs.getString("MB_ADDRESS1"));
				member.setAddress2(rs.getString("MB_ADDRESS2"));
				member.setEmail(rs.getString("MB_EMAIL"));
				member.setStatus(rs.getString("MB_STATUS"));
				member.setJoinDate(rs.getDate("JOIN_DATE"));
				member.setQuitDate(rs.getDate("QUIT_DATE"));
				member.setONF(rs.getString("MG_ONF"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return member;
	}
	
	
	public Member findid(Connection connection, String name, String phone) {
	    Member member = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String query = "SELECT * FROM MEMBER WHERE MB_NAME = ? AND MB_PHONE = ?";
	    
	    try {
	        pstmt = connection.prepareStatement(query);

	        pstmt.setString(1, name);
	        pstmt.setString(2, phone);
	        
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            member = new Member();

	            member.setName(rs.getString("MB_NAME"));
	            member.setPhone(rs.getString("MB_PHONE"));
	            
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    
	    return member;
	}
	
	public Member findpwd(Connection connection, String id, String phone) {
	    Member member = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    String query = "SELECT * FROM MEMBER WHERE MB_ID = ? AND MB_PHONE = ?";
	    
	    try {
	        pstmt = connection.prepareStatement(query);

	        pstmt.setString(1, id);
	        pstmt.setString(2, phone);
	        
	        rs = pstmt.executeQuery();

	        if (rs.next()) {
	            member = new Member();

	            member.setName(rs.getString("MB_ID"));
	            member.setPhone(rs.getString("MB_PHONE"));
	            
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    
	    return member;
	}


	public int insertMember(Connection connection, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "INSERT INTO MEMBER VALUES(SEQ_MB_NO.NEXTVAL,?,?,?,?,?,?,?,?,DEFAULT,DEFAULT,DEFAULT,DEFAULT)";
		
		try {			
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPwd());
			pstmt.setString(3, member.getName());
			pstmt.setString(4, member.getSSN1() + "-" + member.getSSN2() + "******");
			pstmt.setString(5, member.getPhone());
			pstmt.setString(6, member.getAddress1());
			pstmt.setString(7, member.getAddress2());
			pstmt.setString(8, member.getEmailId() + "@" + member.getEmail());
			
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
		String query = "UPDATE MEMBER SET MB_NAME=?,MB_PHONE=?,MB_EMAIL=?,MB_ADDRESS1=?,MB_ADDRESS2=?,JOIN_DATE=SYSDATE WHERE MB_CODE=?";
		
		try {
			pstmt = connection.prepareStatement(query);
			
			pstmt.setString(1, member.getName());
			pstmt.setString(2, member.getPhone());
			pstmt.setString(3, member.getEmailId() + "@" + member.getEmail());
			pstmt.setString(4, member.getAddress1());
			pstmt.setString(5, member.getAddress2());
			pstmt.setInt(6, member.getNo());
			
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
		String query = "UPDATE MEMBER SET MB_STATUS=? WHERE MB_CODE=?";
		
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
