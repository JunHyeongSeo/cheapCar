package com.kh.semi.car.model.service;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import com.kh.semi.car.model.dao.CarDao;
import com.kh.semi.car.model.vo.Car;
import com.kh.semi.car.model.vo.Option;
import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;

public class CarService {
	
	public int selectListCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int listCount = new CarDao().selectListCount(conn);
		
		JDBCTemplate.close(conn);
		
		return listCount;
			
	}
	
	public ArrayList<Car> selectCarList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Car> carList = new CarDao().selectCarList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return carList;
	}
	
	public ArrayList<Option> selectOptionList(){
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Option> optionList = new CarDao().selectOptionList(conn);
		
		JDBCTemplate.close(conn);
		
		return optionList;
	}
	
	public Car selectDetailCar(int managementNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		Car car = new CarDao().selectDetailCar(conn,managementNo);
		
		JDBCTemplate.close(conn);

		return car;
	}
	
	public List<Option> selectDetailOption(int managementNo) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		List<Option> optionList = new CarDao().selectDetailOption(conn,managementNo);
		
		JDBCTemplate.close(conn);

		return optionList;		
	}
	
	public ArrayList<Car> adminCarList(PageInfo pi) {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Car> list = new CarDao().adminCarList(conn, pi);
		
		JDBCTemplate.close(conn);
		
		return list;
	}
	
	
	
}
