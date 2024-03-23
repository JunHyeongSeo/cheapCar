package com.kh.semi.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BlackListController
 */
@WebServlet("/blackList")
public class BlackListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BlackListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 페이지 인포 할라면
		// 게시될 글의 총 갯수
		// 현재 페이지
		// 페이징바에 몇개를 최대로 보여줄지
		// 한 페이지당 몇개의 글을 보여줄지
		// 시작페이지
		// 끝페이지
		// 단, 엔드페이지가 맥스보다 커지면-> 엔드랑 맥스랑 같게끔 설정하기
		
		int listCount;
		int currentPage;
		
		
		
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
