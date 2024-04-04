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
import com.kh.semi.car.model.vo.Search;
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
	
	/* 근경 시작 */
	
	public int adminCarListCount(Connection conn) {
	
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("adminCarListCount");
		
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
	
	
	public ArrayList<Car> adminCarList(Connection conn, PageInfo pi) {
		
		ArrayList<Car> list = new ArrayList();
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
	
	public int searchedCarCount(Connection conn, String searchCar) {
		
		int listCount = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchedCarCount");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, searchCar);
			
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
	
	public ArrayList<Car> searchedCarList(Connection conn, PageInfo pi, String searchCar){
		
		ArrayList<Car> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("searchedCarList");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
			int endRow = startRow + pi.getBoardLimit() - 1;
			
			pstmt.setString(1, searchCar);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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
	
	public Car selectCar(Connection conn, int managementNo) {
		
		Car car = new Car();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("selectCar");
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, managementNo);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
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
	
	
	
	
	
	
	
	
	
	
	
	
	/* 근경 끝 */
	
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
				car.setChangeName(rset.getString("CHANGE_NAME"));
				car.setCarPhotoAddress(rset.getString("CAR_PHOTO_ADDRESS"));
				
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
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(4, endDate);
			pstmt.setString(5, startDate);

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
				car.setChangeName(rset.getString("CHANGE_NAME"));
				car.setCarPhotoAddress(rset.getString("CAR_PHOTO_ADDRESS"));
			
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
				car.setTotalPrice(rset.getInt("TOTAL_PRICE"));
				
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
				car1.setTotalPrice(rset.getInt("TOTAL_PRICE"));
				car.add(car1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return car;
	}
	
	
	public ArrayList<Car> locationSale(Connection conn, String checkLocations){
		
		ArrayList<Car> carLocation = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkLocations");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, checkLocations);
			
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
				car1.setTotalPrice(rset.getInt("TOTAL_PRICE"));
				carLocation.add(car1);
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return carLocation;
	}
	
	public ArrayList<Car> selectOptionAndCarList(Connection conn, Search search, int hours, String locations, String startDate, String endDate){
		
		ArrayList<Car> carList = new ArrayList<Car>();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String optionSql = "";
		
		int num = search.getOptions().length;
		
		if(search != null) {
			
			for(int i = 0; i < num; i++) {
						
			optionSql += 
					"SELECT "
							+ "TB_CAR.MANAGEMENT_NO "
					 +"FROM "
							+ "TB_CAR "
					 +"JOIN "
							+ "TB_OPTION_BRIDGE OB "
					 +"ON	(TB_CAR.MANAGEMENT_NO = OB.MANAGEMENT_NO) "
					 +"JOIN "
					 		+ "TB_OPTION O "
					 +"ON	(OB.OPTION_NO = O.OPTION_NO) "
					 +"WHERE "
					 		+ "OPTION_NAME = '" + search.getOptions()[i] + "' ";
				if(i != num - 1) {
					optionSql += "INTERSECT ";
				}
			}
		}
		
		String sql = 
		
				"SELECT "
						+ "MANAGEMENT_NO, "
						+ "STATUS, "
						+ "CAR_NO, "
						+ "LOCATION_NO, "
						+ "LOCATION_NAME, "
						+ "MODEL_NAME, "
						+ "FUEL_NAME, "
						+ "BRAND_NAME, "
						+ "GRADE_NAME, "
						+ "YEAR, "
						+ "GRADE_PRICE, "
						+ "MODEL_PRICE, "
						+ "YEAR_PRICE, "
						+ "CHANGE_NAME, "
						+ "CAR_PHOTO_ADDRESS "
				+ "FROM "
						+ "(SELECT "
									+ "MANAGEMENT_NO, "
									+ "STATUS, "
									+ "CAR_NO, "
									+ "LOCATION_NO, "
									+ "LOCATION_NAME, "
									+ "MODEL_NAME, "
									+ "FUEL_NAME, "
									+ "BRAND_NAME, "
									+ "GRADE_NAME, "
									+ "YEAR, "
									+ "GRADE_PRICE, "
									+ "MODEL_PRICE, "
									+ "YEAR_PRICE, "
									+ "CHANGE_NAME, "
									+ "CAR_PHOTO_ADDRESS, "
									+ "ROWNUM RNUM "
									
							+"FROM "
									+ "(SELECT "
												+ "C.MANAGEMENT_NO, "
												+ "C.STATUS, "
												+ "CAR_NO, "
												+ "C.LOCATION_NO, "
												+ "LOCATION_NAME, "
												+ "MODEL_NAME, "
												+ "FUEL_NAME, "
												+ "BRAND_NAME, "
												+ "GRADE_NAME, "
												+ "YEAR, "
												+ "GRADE_PRICE, "
												+ "MODEL_PRICE, "
												+ "YEAR_PRICE, "
												+ "START_DATE, "
												+ "END_DATE, "
												+ "CHANGE_NAME, "
												+ "CAR_PHOTO_ADDRESS "
												
										+"FROM "
												+ "TB_CAR C "
										
										+"JOIN "
												+ "TB_CAR_BRIDGE CB "
										+"ON	(C.MANAGEMENT_NO = CB.MANAGEMENT_NO) "
												
										+"JOIN "
												+ "TB_LOCATION L "
										+"ON	(C.LOCATION_NO = L.LOCATION_NO) "
												
										+"JOIN "
												+ "TB_MODEL M "
										+"ON	(CB.MODEL_NO = M.MODEL_NO) "
												
										+"JOIN "
												+ "TB_FUEL F "
										+"ON	(CB.FUEL_NO = F.FUEL_NO) "
										
										+"JOIN "
												+ "TB_BRAND B "
										+"ON	(CB.BRAND_NO = B.BRAND_NO) "
										
										+"JOIN "
												+ "TB_GRADE G "
										+"ON	(CB.GRADE_NO = G.GRADE_NO) "
												
										+"JOIN "	
												+ "TB_YEAR Y "
										+"ON	(CB.YEAR_NO = Y.YEAR_NO) "
										
										+"JOIN "
												+ "TB_OPTION_BRIDGE OB "
										+"ON	(C.MANAGEMENT_NO = OB.MANAGEMENT_NO) "
												
										+"JOIN "
												+ "TB_OPTION O "
										+"ON	(OB.OPTION_NO = O.OPTION_NO) "
										
										+"LEFT "
										+"JOIN "
												+ "TB_CAR_PHOTO CP "
										+"ON	(C.MANAGEMENT_NO = CP.MANAGEMENT_NO) "
												
										+"LEFT " 
										+"JOIN "
												+ "TB_RESERVATION R "
										+"ON	(C.MANAGEMENT_NO = R.MANAGEMENT_NO) "
										
									    +"WHERE "
									   			+ "LOCATION_NAME = ? "
									    +"AND "
									   			+ "C.MANAGEMENT_NO "
									    +"IN "
									   			+"( "
									   			
									   			+ optionSql
									   			
									   			+") "
									    
									    +"ORDER BY "
									   			+ "C.MANAGEMENT_NO)) "
									    
				+"WHERE "
						+ "STATUS = 'Y' "
				  +"AND " 
						+ "MODEL_NAME = ? "
				  +"AND "
						+ "FUEL_NAME = ? "
				  +"AND "
						+ "BRAND_NAME = ? "
				  +"AND "
						+ "GRADE_NAME = ? "
				  +"AND "
						+ "MANAGEMENT_NO "
				  
				  +"NOT IN "
				  
						+ "(SELECT "
									+ "C.MANAGEMENT_NO "
							+ "FROM "
									+ "TB_CAR C "
							
							+ "JOIN "
									+ "TB_RESERVATION R "
							+ "ON	 (C.MANAGEMENT_NO = R.MANAGEMENT_NO) "
									
							+ "WHERE "
									+ "TO_CHAR(START_DATE, 'YYYY-MM-DD HH24:MI') <= ? "
							+ "AND "
									+ "TO_CHAR(END_DATE, 'YYYY-MM-DD HH24:MI') >= ? )"
							
				+ "GROUP BY "
							+ "MANAGEMENT_NO, "
							+ "STATUS, "
							+ "CAR_NO, "
							+ "LOCATION_NO, "
							+ "LOCATION_NAME, "
							+ "MODEL_NAME, "
							+ "FUEL_NAME, "
							+ "BRAND_NAME, "
							+ "GRADE_NAME, "
							+ "YEAR, "
							+ "GRADE_PRICE, "
							+ "MODEL_PRICE, "
							+ "YEAR_PRICE, "
							+ "CHANGE_NAME, "
							+ "CAR_PHOTO_ADDRESS "
				+ "ORDER BY "
							+ "MANAGEMENT_NO";
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, locations);
			pstmt.setString(2, search.getModel());
			pstmt.setString(3, search.getFuel());
			pstmt.setString(4, search.getBrand());
			pstmt.setString(5, search.getGrade());
			pstmt.setString(6, endDate);
			pstmt.setString(7, startDate);
			
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
				car.setChangeName(rset.getString("CHANGE_NAME"));
				car.setCarPhotoAddress(rset.getString("CAR_PHOTO_ADDRESS"));
				
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
	
	public ArrayList<Car> popularCar(Connection conn){
		
		ArrayList<Car> list = new ArrayList();
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String sql = prop.getProperty("popularCar");
	
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				Car car = new Car();
				
				car.setModelName(rset.getString("MODEL_NAME"));
				car.setCount(rset.getInt("COUNT(*)"));
				
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
	
	
	
	
	
	
	
	
	
	
	
}

