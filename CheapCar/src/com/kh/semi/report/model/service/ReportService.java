package com.kh.semi.report.model.service;

public class ReportService {
	
	public int selectListCount() {
		
		int result = new ReviewDao().selectListCount();
		
		return result;
	}

}
