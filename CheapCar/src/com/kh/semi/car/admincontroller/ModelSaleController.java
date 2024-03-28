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
 * Servlet implementation class ModelSaleController
 */
@WebServlet("/modelsale")
public class ModelSaleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModelSaleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String checkmodels =  request.getParameter("checkmodels");
		
		System.out.println(checkmodels);
	
			
		ArrayList<Car> car = new CarService().modelSale(checkmodels);
	
		if(car.isEmpty()) {
			
		}else {
			response.setContentType("application/json; charset=UTF-8");
			Gson gson = new Gson();
			gson.toJson(car, response.getWriter());
		}
		
		//System.out.println(car);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
