package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.commit;
import static com.kh.semi.common.JDBCTemplate.getConnection;
import static com.kh.semi.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.car.model.vo.Car;
import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.dao.MemberDao;
import com.kh.semi.member.model.vo.Member;

public class MemberService {
	
	// 근경 시작 ///////////////////////////////////////////////////////////////////////
	public int selectListCount() {
		// 회원의 리스트 총 갯수를 뽑아주는 메소드
		
		Connection conn = getConnection();
		
		int result = new MemberDao().selectListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Member> selectList(PageInfo pi) {
		// 회원 내역 list에 담아주는 것 + 페이징바까지
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	public int selectBlackListCount() {
		// 회원의 리스트 총 갯수를 뽑아주는 메소드
		
		Connection conn = getConnection();
		
		int result = new MemberDao().selectBlackListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Member> blackListCount(PageInfo pi) {
		
		Connection conn = getConnection();
		
		ArrayList<Member> list = new MemberDao().blackListCount(conn, pi);
		close(conn);
		
		return list;
	}
	
	
	
	
	// 근경 끝 ///////////////////////////////////////////////////////////////////////
	
	
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
	
	public int updatePwd(String memberPwd, String changePwd, int memberNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().updatePwd(conn, memberPwd, changePwd, memberNo);
		
		if(result > 0) {
			commit(conn);
		}
		
		
		close(conn);
		
		return result;
	}
	
	
	public Member selectMember(String memberId) {
		
		Connection conn = getConnection();
		
		Member member = new MemberDao().selectMember(conn, memberId);

		close(conn);
		
		
		return member;
	}
	
	public int deleteMember(String memberPwd, int memberNo) {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().deleteMember(conn, memberPwd, memberNo);
		
		if(result > 0) {
			commit(conn);
		} else {
			
		}
		
		close(conn);
		
		
		return result;
	}
	
	
	public ArrayList<Car> reservation (Member loginUser){
		
		Connection conn = getConnection();
		
		ArrayList<Car> list = new MemberDao().reservation(conn, loginUser);
		
		close(conn);
		
		System.out.println(list);
		
		return list;
	}
	
	
	
	
	
	
	
	
	

}
