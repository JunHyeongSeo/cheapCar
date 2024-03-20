package com.kh.semi.member.model.service;

import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.kh.semi.member.model.dao.MemberDao;

public class MemberService {
	
	public int selectListCount() {
		
		Connection conn = getConnection();
		
		int result = new MemberDao().selectListCount(conn);
		
		return result;
		
	}

}
