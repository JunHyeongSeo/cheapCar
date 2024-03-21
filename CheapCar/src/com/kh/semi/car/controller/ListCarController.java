package com.kh.semi.car.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.car.model.service.CarService;
import com.kh.semi.car.model.vo.Car;
import com.kh.semi.car.model.vo.Option;

/**
 * Servlet implementation class ListCarController
 */
@WebServlet("/list.car")
public class ListCarController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCarController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		int listCount; // 현재 게시판 글 총 개수
		int currentPage; // 현재 페이지
		int pageLimit; // 페이지 하단에 보여질 페이징 바 개수
		int boardLimit; // 한페이지에 보여질 최대 개수
		
		int maxPage; // 가장 마지막 페이지가 몇 번 페이지인지
		int startPage; // 페이지 하단에 보여줄 페이징바의 시작수
		int endPage; // 페이지 하단에 보여질 페이징바의 끝 수
		
		listCount = new CarService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5;
		
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit / pageLimit * pageLimit + 1;
		
		ArrayList<Car> carList = new CarService().selectCarList();
		
		ArrayList<Option> optionList = new CarService().selectOptionList();
		
		request.setAttribute("carList", carList);
		request.setAttribute("optionList", optionList);
		
		request.getRequestDispatcher("views/car/carList.jsp").forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
