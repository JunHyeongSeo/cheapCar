package com.kh.jsp.member.model.service;

import java.sql.Connection;

import com.kh.jsp.common.JDBCTemplate;
import com.kh.jsp.member.model.dao.MemberDao;
import com.kh.jsp.member.model.vo.Member;

public class MemberService {
	
	public Member login(String userId, String userPwd) {
		
		// Service => Connection 객체 생성
		
		// 1) Connection객체 생성
		Connection conn = JDBCTemplate.getConnection();
		
		// 2) Controller에서 넘어온 전달값과 Connection객체를 DAO메소드를 호출하면서 전달
		
		Member m = new MemberDao().login(userId, userPwd, conn);
		
		// 3) Connection 객체 반납
		JDBCTemplate.close(conn);
		
		// 4) Controller에게 결과 반환
		return m;
	}

	public int insertMember(Member member) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().insertMember(conn, member);
		// 성공했다면 1 / 실패했다면 0
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public int updateMember(Member member) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updateMember(conn, member);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public Member selectMember(String userId) {
		Connection conn = JDBCTemplate.getConnection();
		
		Member updateMem = new MemberDao().selectMember(conn, userId);
		
		JDBCTemplate.close(conn);
		
		return updateMem;
	}
	
	public int updatePwd(String userPwd, String changePwd, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().updatePwd(conn, userPwd, changePwd, userNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}
	
	public int delete(String userPwd, int userNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new MemberDao().delete(conn, userPwd, userNo);
		
		if(result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		return result;
	}
	
}
