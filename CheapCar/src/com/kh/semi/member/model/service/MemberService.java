package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

public class MemberService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().selectListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Member> selectList(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	
	
	
public Member login(String memberId, String memberPwd) {
		
		Connection conn = getConnection();

		
		Member m = new MemberDao().login(conn, memberId, memberPwd);
		
		// 3) Connection 객체 반납
		close(conn);
		
		// 4) Controller에게 결과 반환
		return m;
	}

	public int insertMember(Member member) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().insertMember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			rollback(conn);
		}
		
		
		return result;
	}
	
	
	public int updatemember(Member member) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatemember(conn, member);
		
		if(result > 0) {
			commit(conn);
		} else {
			
		}
		
		close(conn);
		
		
		return result;
	}
	
	
	public int idCheck(String checkId) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().idCheck(conn, checkId);
		
		
		
		close(conn);
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	

}
