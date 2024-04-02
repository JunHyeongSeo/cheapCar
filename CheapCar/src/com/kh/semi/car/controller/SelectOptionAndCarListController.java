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
import com.kh.semi.car.model.vo.Search;
import com.kh.semi.common.model.vo.PageInfo;

/**
 * Servlet implementation class SelectOptionAndCarListController
 */
@WebServlet("/selectOptionAndCarList.do")
public class SelectOptionAndCarListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectOptionAndCarListController() {
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
		
		String model = request.getParameter("model");
		String fuel = request.getParameter("fuel");
		String brand = request.getParameter("brand");
		String grade = request.getParameter("grade");
		
		String[] options = request.getParameterValues("options"); 
		
		int hours = Integer.parseInt(request.getParameter("hours"));
		String startDate = request.getParameter("startDate");
		String endDate = request.getParameter("endDate");
		String locations = request.getParameter("locations");
		
		
		Search search = new Search();
		search.setModel(model);
		search.setFuel(fuel);
		search.setBrand(brand);
		search.setGrade(grade);
		search.setOptions(options);
		
		listCount = new CarService().selectListCount();
		
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
		
		pageLimit = 5;
		
		boardLimit = 5;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		endPage = startPage + pageLimit - 1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		};
		
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);

		ArrayList<Car> carList = new CarService().selectOptionAndCarList(search, pi, hours, locations, startDate, endDate);
		
		System.out.println(carList);
		
		request.getRequestDispatcher("views/car/selectOptionAndCarList.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
