package com.kh.semi.report.model.service;

import static com.kh.semi.common.JDBCTemplate.close;
import static com.kh.semi.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.report.model.dao.ReportDao;
import com.kh.semi.report.model.vo.Report;

public class ReportService {
	
	public int selectListCount() {
		// 신고내역의 총 갯수를 뽑아주는 메소드
		
		Connection conn = getConnection();
		
		int result = new ReportDao().selectListCount(conn);
		
		close(conn);
		
		return result;
	}
	
	public ArrayList<Report> selectList(PageInfo pi) {
		// 신고내역의 리스트를 뽑아주는 메소드
		
		Connection conn = getConnection();
		
		ArrayList<Report> list = new ReportDao().selectList(conn, pi);
		
		close(conn);
		
		return list;
	}
	
	
	

}
