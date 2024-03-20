package com.kh.semi.car.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.car.model.dao.CarDao;
import com.kh.semi.car.model.vo.Car;
import com.kh.semi.car.model.vo.Option;
import com.kh.semi.common.JDBCTemplate;

public class CarService {
	
	public void selectListCount() {
		
		
		
	}
	
	public ArrayList<Car> selectCarList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Car> carList = new CarDao().selectCarList(conn);
		
		JDBCTemplate.close(conn);
		
		return carList;
	}
	
	public ArrayList<Option> selectOptionList(){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Option> optionList = new CarDao().selectOptionList(conn);
		
		JDBCTemplate.close(conn);
		
		return optionList;
	}
}
