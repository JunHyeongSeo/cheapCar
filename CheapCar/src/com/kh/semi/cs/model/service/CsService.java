package com.kh.semi.cs.model.service;

import static com.kh.semi.common.JDBCTemplate.*;

import java.sql.Connection;

import com.kh.semi.cs.model.dao.CsDao;

public class CsService {
	
	public int selectCsListCount() {
		
		Connection conn = getConnection();
		
		int result = new CsDao().selectCsListCount(conn);
		
		close(conn);
		
		return result;
	}

}
