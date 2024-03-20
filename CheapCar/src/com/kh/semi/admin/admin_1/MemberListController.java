package com.kh.semi.admin.admin_1;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.member.model.service.MemberService;

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
				
				listCount = new MemberService().selectListCount();
				
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
				pageLimit = 10;
				
				boardLimit = 5;
				
				maxPage = (int)Math.ceil((double)listCount / boardLimit);
				
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
				
				endPage = startPage + pageLimit - 1;
				
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
