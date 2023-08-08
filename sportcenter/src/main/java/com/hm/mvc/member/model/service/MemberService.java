package com.hm.mvc.member.model.service;

import static com.hm.mvc.common.jdbc.JDBCTemplate.close;
import static com.hm.mvc.common.jdbc.JDBCTemplate.commit;
import static com.hm.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.hm.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.hm.mvc.member.model.dao.MemberDao;
import com.hm.mvc.member.model.vo.Member;

public class MemberService {

	public Member login(String id, String pwd) {
		Member member = this.findMemberById(id);
		
		if (member == null || !member.getPwd().equals(pwd)) {
			return null;
		}
		
		return member;
	}

	public int save(Member member) {
		int result = 0;
		Connection connection = getConnection();
		
		if (member.getNo() > 0) {
			// update 작업
			result = new MemberDao().updateMember(connection, member);
		} else {
			// insert 작업
			result = new MemberDao().insertMember(connection, member);
		}
		
		if(result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}

	public boolean isDuplicateId(String id) {
		
		return this.findMemberById(id) != null;
	}

	public Member findMemberById(String id) {
		Member member = null;
		Connection connection = getConnection();
		
		member = new MemberDao().findMemberById(connection, id);
		
		close(connection);
		
		return member;
	}

	public int delete(int no) {
		int result = 0;
		Connection connection = getConnection();
		
		result = new MemberDao().updateMemberStatus(connection, no, "N");
		
		if (result > 0) {
			commit(connection);
		} else {
			rollback(connection);
		}
		
		close(connection);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
}
