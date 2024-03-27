package com.kh.semi.car.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.semi.car.model.service.CarService;
import com.kh.semi.car.model.vo.Car;
import com.kh.semi.car.model.vo.Option;

/**
 * Servlet implementation class ListCarDetailController
 */
@WebServlet("/listDetail.do")
public class ListCarDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ListCarDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int managementNo = Integer.parseInt(request.getParameter("carNo"));
		
		int hours = Integer.parseInt(request.getParameter("hours"));
		
		
		String startRent = (String)request.getParameter("startRent");
	    String endRent = (String)request.getParameter("endRent");
	    
		Car car = new CarService().selectDetailCar(managementNo);
		
		List<Option> optionList = new CarService().selectDetailOption(managementNo);
		
		request.setAttribute("car", car);
		request.setAttribute("hours", hours);
		request.setAttribute("optionList", optionList);
		request.setAttribute("startRent", startRent);
		request.setAttribute("endRent", endRent);
		
		request.getRequestDispatcher("views/car/carDetail.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
