package com.kh.semi.admin.admin_1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.model.vo.PageInfo;

/**
 * Servlet implementation class MemberListController
 */
@WebServlet("/MemberListController")
public class MemberListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
				int listCount; 
				int currentPage;
				int pageLimit;
				int boardLimit;
				
				int maxPage;
				int startPage;
				int endPage;
				
				// * listCount : 총 게시글의 수
				listCount = new BoardService().selectListCount();
				
				// * currentPage : 현재 페이지(사용자가 요청한 페이지)
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
				// * pageLimit : 페이징바 최대 개수
				pageLimit = 10;
				
				// * boardLimit : 한 페이지에 보여질 게시글의 최대 개수
				boardLimit = 10;
				
				// * maxPage : 가장 마지막페이지가 몇번 페이지인지(총 페이지 개수)
				/*
				 * listCount, boardLimit에 영향을 받음
				 * 
				 * - 공식 구하기
				 * 단, boardLimit이 10이라는 가정 하에 규칙을 찾아보자
				 * 
				 * 총 개수(listCount)	/	게시글 개수(boardLimit)		== maxPage(마지막페이지)
				 * 100				/	10						== 10.0	
				 * 107				/	10						== 10.7
				 * 
				 * => 나눗셈 결과에 소수점을 붙여서 올림처리를 할 경우 maxPage가 됨
				 * 
				 * 스텝
				 * 1. listCount를 double로 변환.
				 * 2. listCount / boardLimit
				 * 3. Math.ceil() => 결과를 올림처리
				 * 4. 결과값을 int로 형변환
				 * 
				 */
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				
				// * startPage : 페이지하단에 보여질 페이징바의 시작 수
				/*
				 * currentPage, pageLimit에 영향을 받음
				 * 
				 * - 공식
				 * 단, pageLimit이 10이라고 가정
				 * 
				 * - startPage : 1,11,21,31,,,,,,, => n * 10 + 1
				 * 
				 * 만약에 pageLimit이 5였다면
				 * - startPage : 1,6,11,16,21,26,,, => n * 5 + 1
				 * 
				 * 즉, startPage = n * pageLimit + 1;
				 * 
				 * currentPage = 1
				 * 
				 * startPage = ((currentpage-1) / pageLimit) * 
				 * 
				 */
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				
				// * endPage : 페이지 하단에 보여질 페이징바의 끝 수
				/*
				 * stargPage, pageLimit에 영향을 받음(단, maxPage도 마지막 페이징 바에 대해 영향을 끼침)
				 * 
				 * - 공식
				 * 	  단, pageLimit이 10 이라고 가정
				 * 
				 * startPage : 1  => endPage : 10
				 * startPage : 11 => endPage : 20
				 * startPage : 21 => endPage : 30
				 * 
				 */
				endPage = startPage + pageLimit - 1;
				
				// 예시) startPage가 31이라서 endPage에는 40이 들어갔는데
				// maxPage가 35다?
				// endPage를 maxPage값으로 변경
				if(endPage > maxPage) {
					endPage = maxPage;
				}
				
				// 여기까지 총 7개의 변수를 만들었음!!
				// 3) VO로 가공
				PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
				
				// System.out.println(pi);
				
				// 4) Service 호출
				ArrayList<Board> boardList = new BoardService().selectList(pi);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
