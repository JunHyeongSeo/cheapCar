package com.kh.semi.car.admincontroller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.semi.car.model.service.CarService;
import com.kh.semi.car.model.vo.Car;

/**
 * Servlet implementation class ReservateionDetail
 */
@WebServlet("/sales2")
public class ReservateionDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReservateionDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int checkReservationNo = Integer.parseInt(request.getParameter("checkReservationNo"));
		
		
		Car car = new CarService().carcarone(checkReservationNo);
		
	
	
		
		if(car == null) {
			
		} else { // 올해 이번 달 자동차 리스트 매출조회 화면에 띄워줄
			System.out.println(car);
			
			
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			gson.toJson(car, response.getWriter());
			
			
		}
	
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
