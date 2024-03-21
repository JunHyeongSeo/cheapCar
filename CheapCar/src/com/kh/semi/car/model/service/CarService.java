package com.kh.semi.car.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.car.model.dao.CarDao;
import com.kh.semi.car.model.vo.Car;
import com.kh.semi.car.model.vo.Option;
import com.kh.semi.common.JDBCTemplate;

public class CarService {
	
	public void selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new CarDao().selectListCount(conn);
		
		
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
