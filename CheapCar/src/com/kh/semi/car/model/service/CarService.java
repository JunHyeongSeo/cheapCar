package com.kh.semi.car.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.kh.semi.car.model.dao.CarDao;
import com.kh.semi.car.model.vo.Car;
import com.kh.semi.common.JDBCTemplate;

public class CarService {
	
	public void selectListCount() {
		
		
		
	}
	
	public ArrayList<Car> selectCarList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Car> list = new CarDao().selectCarList(conn);
		
		JDBCTemplate.close(conn);
		
		return list;
		
	}
}
