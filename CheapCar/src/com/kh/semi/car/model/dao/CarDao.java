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
import com.kh.semi.car.model.vo.Reservation;
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
	
	public ArrayList<Car> adminCarList(Connection conn, PageInfo pi) {
		
		ArrayList<Car> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminCarList");
		
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
				
				list.add(car);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return list;
	}
	
	public int selectLocationListCount(Connection conn,String locations) {
	
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectLocationListCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, locations);
			
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
	
	public ArrayList<Car> selectedCarList(Connection conn, PageInfo pi, String locations, String startDate, String endDate){
		
		ArrayList<Car> carList = new ArrayList<Car>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("selectedCarList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, locations);
			pstmt.setString(2, endDate);
			pstmt.setString(3, startDate);
			pstmt.setInt(4, startRow);
			pstmt.setInt(5, endRow);
			
			System.out.println( startDate );
			System.out.println( endDate );
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
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return carList;
	}
	
	
public ArrayList<Car> carcarall(Connection conn){
		
		ArrayList<Car> carList = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("carcarall");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
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
				car.setStartDate(rset.getDate("START_DATE"));
				car.setEndDate(rset.getDate("END_DATE"));
				car.setMemberId(rset.getString("MEMBER_ID"));
				car.setReservationNo(rset.getInt("RESERVATION_NO"));
				car.setMemberName(rset.getString("MEMBER_NAME"));
				car.setPhone(rset.getString("PHONE"));
				car.setEmail(rset.getString("EMAIL"));
				
				carList.add(car);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return carList;
	}
	
	

	

	public Car carcarone(Connection conn, int checkReservationNo) {
		
		Car car = new Car();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("carcarone");

		

			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, checkReservationNo);
				
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
					car.setStartDate(rset.getDate("START_DATE"));
					car.setEndDate(rset.getDate("END_DATE"));
					car.setMemberId(rset.getString("MEMBER_ID"));
					car.setReservationNo(rset.getInt("RESERVATION_NO"));
					car.setMemberName(rset.getString("MEMBER_NAME"));
					car.setPhone(rset.getString("PHONE"));
					car.setEmail(rset.getString("EMAIL"));
					
					//System.out.println(rset.getString("MEMBER_ID"));
				}
				
				
				
				
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			
		
		
		return car;
	}
	
	public int insertReservation(Connection conn, Reservation reservation) {
	
		int result = 0;
		PreparedStatement pstmt = null;
		
		String sql =  prop.getProperty("insertReservation");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, reservation.getStartDate());
			pstmt.setString(2, reservation.getEndDate());
			pstmt.setInt(3, reservation.getMemberNo());
			pstmt.setInt(4, reservation.getManagementNo());
			pstmt.setInt(5, reservation.getTotalPrice());
			
			result = pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	public ArrayList<Car> modelSale(Connection conn, String modelSale) {
		
		ArrayList<Car> car = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("modelSale");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, modelSale);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Car car1 = new Car();
				car1.setManagementNo(rset.getInt("MANAGEMENT_NO"));
				car1.setStatus(rset.getString("STATUS"));
				car1.setCarNo(rset.getString("CAR_NO"));
				car1.setLocationNo(rset.getInt("LOCATION_NO"));
				car1.setLocationName(rset.getString("LOCATION_NAME"));
				car1.setModelName(rset.getString("MODEL_NAME"));
				car1.setFuelName(rset.getString("FUEL_NAME"));
				car1.setBrandName(rset.getString("BRAND_NAME"));
				car1.setGradeName(rset.getString("GRADE_NAME"));
				car1.setYear(rset.getInt("YEAR"));
				car1.setGradePrice(rset.getInt("GRADE_PRICE"));
				car1.setModelPrice(rset.getInt("MODEL_PRICE"));
				car1.setYearPrice(rset.getInt("YEAR_PRICE"));
				car1.setStartDate(rset.getDate("START_DATE"));
				car1.setEndDate(rset.getDate("END_DATE"));
				car1.setMemberId(rset.getString("MEMBER_ID"));
				car1.setReservationNo(rset.getInt("RESERVATION_NO"));
				car1.setMemberName(rset.getString("MEMBER_NAME"));
				car1.setPhone(rset.getString("PHONE"));
				car1.setEmail(rset.getString("EMAIL"));
				
				car.add(car1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		
		return car;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}

