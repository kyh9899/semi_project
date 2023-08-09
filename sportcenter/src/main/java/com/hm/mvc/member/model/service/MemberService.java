package com.hm.mvc.member.model.service;

import static com.hm.mvc.common.jdbc.JDBCTemplate.close;
import static com.hm.mvc.common.jdbc.JDBCTemplate.commit;
import static com.hm.mvc.common.jdbc.JDBCTemplate.getConnection;
import static com.hm.mvc.common.jdbc.JDBCTemplate.rollback;

import java.sql.Connection;

import com.hm.mvc.member.model.dao.MemberDao;
import com.hm.mvc.member.model.vo.Member;

public class MemberService {

	// 1. 로그인 연결 기능. (4번에서 findMemberById 메소드를 통해 DAO에서 얻어온 member 객체를 가져와서 조회)
	public Member login(String id, String pwd) {
		Member member = this.findMemberById(id);
		
		// 사용자가 입력한 아이디/비번과 member 객체에 담긴 아디/비번이 일치하는지 확인(불일치시 null 반환)
		if (member == null || !member.getPwd().equals(pwd)) {
			System.out.println("1번 null 반환중!");
			
			return null;
		}
		System.out.println("1번 member 객체 담아오기 성공");
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

	// 3. 회원가입 시, 아이디가 중복인지 체크 
	public boolean isDuplicateId(String id) {
		
		return this.findMemberById(id) != null;
	}

	// 4. 아이디가 DB에 있는지 조회 후, 있으면 member 객체에 담아옴. 
	public Member findMemberById(String id) {
		Member member = null;
		Connection connection = getConnection();
		
		member = new MemberDao().findMemberById(connection, id);
		
		close(connection);
		
		System.out.println("4번 member 객체 담아오기 성공!");
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
