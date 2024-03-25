package com.kh.semi.car.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.kh.semi.car.model.vo.Car;
import com.kh.semi.car.model.vo.Option;
import com.kh.semi.common.JDBCTemplate;
import com.kh.semi.common.model.vo.PageInfo;

public class CarDao {

	private Properties prop = new Properties();
	
	public CarDao() {
		String filePath = CarDao.class.getResource("/sql/car/car-mapper.xml").getPath();
		
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
Google
datepicker
	public int selectListCount(Connection conn) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			rset.next();
			
			listCount = rset.getInt("COUNT(*)");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return listCount;
	}
	
	public ArrayList<Car> selectCarList(Connection conn, PageInfo pi) {
		
		ArrayList<Car> carList = new ArrayList<Car>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectCarList"); 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Car car = new Car();
				car.setManagementNo(rset.getInt("MANAGEMENT_NO"));
				car.setStatus(rset.getString("STATUS"));
				car.setCarNo(rset.getString("CAR_NO"));
				car.setLocationNo(rset.getInt("LOCATION_NO"));
				car.setLocationName(rset.getString("LOCATION_NAME"));
				car.setModelName(rset.getString("MODEL_NAME"));
				car.setFuelName(rset.getString("FUEL_NAME"));
				car.setBrandName(rset.getString("BRAND_NAME"));
				car.setGradeName(rset.getString("GRADE_NAME"));
				car.setYear(rset.getInt("YEAR"));
				car.setGradePrice(rset.getInt("GRADE_PRICE"));
				car.setModelPrice(rset.getInt("MODEL_PRICE"));
				car.setYearPrice(rset.getInt("YEAR_PRICE"));
				
				carList.add(car);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(conn);
		}
		return carList;
	}
	
	public ArrayList<Option> selectOptionList(Connection conn){
		
		ArrayList<Option> optionList = new ArrayList<Option>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectOptionList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Option option = new Option();
				option.setManagementNo(rset.getInt("MANAGEMENT_NO"));
				option.setOptionNo(rset.getInt("OPTION_NO"));
				option.setOptionName(rset.getString("OPTION_NAME"));
				option.setOptionPrice(rset.getInt("OPTION_PRICE"));
				
				optionList.add(option);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return optionList;
	}
	
	public Car selectDetailCar(Connection conn, int managementNo) {
		
		Car car = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDetailCar");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, managementNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				car = new Car();
				car.setManagementNo(rset.getInt("MANAGEMENT_NO"));
				car.setStatus(rset.getString("STATUS"));
				car.setCarNo(rset.getString("CAR_NO"));
				car.setLocationNo(rset.getInt("LOCATION_NO"));
				car.setLocationName(rset.getString("LOCATION_NAME"));
				car.setModelName(rset.getString("MODEL_NAME"));
				car.setFuelName(rset.getString("FUEL_NAME"));
				car.setBrandName(rset.getString("BRAND_NAME"));
				car.setGradeName(rset.getString("GRADE_NAME"));
				car.setYear(rset.getInt("YEAR"));
				car.setGradePrice(rset.getInt("GRADE_PRICE"));
				car.setModelPrice(rset.getInt("MODEL_PRICE"));
				car.setYearPrice(rset.getInt("YEAR_PRICE"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return car;
	}
	
	public List<Option> selectDetailOption(Connection conn, int managementNo) {
		
		List<Option> optionList = new ArrayList<Option>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectDetailOption");
		
		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, managementNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Option option = new Option();
				
				option.setManagementNo(rset.getInt("MANAGEMENT_NO"));
				option.setOptionNo(rset.getInt("OPTION_NO"));
				option.setOptionName(rset.getString("OPTION_NAME"));
				option.setOptionPrice(rset.getInt("OPTION_PRICE"));
				
				optionList.add(option);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return optionList;
	}
}
