package com.kh.semi.event.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.common.model.vo.PageInfo;
import com.kh.semi.event.model.service.EventService;
import com.kh.semi.event.model.vo.EventBoard;
import com.kh.semi.notice.model.service.NoticeService;

/**
 * Servlet implementation class EventListController
 */
@WebServlet("/list.event")
public class EventListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount = 0;
		int currentPage= 0;
		int pageLimit= 0;
		int boardLimit= 0;
		
		int maxPage= 0;
		int startPage= 0;
		int endPage= 0;
		
		listCount = new EventService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5;
		boardLimit = 6;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = ((currentPage - 1) / pageLimit) * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		//값
		ArrayList<EventBoard> list = new EventService().selectEventList(pi);
		
		request.setAttribute("list", list);
		request.setAttribute("pi", pi);
		
		System.out.println(list);
		
		request.getRequestDispatcher("views/event/event.jsp").forward(request, response);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
