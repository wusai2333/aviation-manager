package model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.sun.org.apache.xalan.internal.xsltc.compiler.sym;

import control.MyControls;

public class DbUtils {

	private static final String CONN_MYSQLQ="jdbc:mysql://localhost:3306/avation?user=root&password=mysqladmin&useUnicode=true&characterEncoding=UTF-8";
	
	
	private static DbUtils dbUtils;
	private static Connection connection;
	public static DbUtils getInstance(){
	if(dbUtils==null){
		synchronized (DbUtils.class) {
			if(dbUtils==null){
				dbUtils = new DbUtils();
				try {
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					connection = DriverManager.getConnection(CONN_MYSQLQ);
					return dbUtils;
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				} catch (InstantiationException e) {
					e.printStackTrace();
				} catch (IllegalAccessException e) {
					e.printStackTrace();
				} 
			}
		}
	}
		return dbUtils;
	}
	 /**
	  * 获取所有的航班信息
	  * @return
	  */
	 public List<AirScheduled> getAirSchedule(){
		 List<AirScheduled> airScheduleds = new ArrayList<AirScheduled>();
		 String sql = "select*from air_line";
		 try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				AirScheduled airScheduled = new AirScheduled(resultSet.getString(2),resultSet.getString(3),resultSet.getString(4),resultSet.getString(5),resultSet.getString(6),resultSet.getDouble(7),resultSet.getString(8),resultSet.getInt(9));
				airScheduleds.add(airScheduled);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return airScheduleds;
	 }
	 public boolean deleteOrder(String order){
		 System.out.println(order);
		 String sql="delete from book_tickets where orderId=?";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1,MyControls.encodingStr(order));
			boolean  executeUpdate = prepareStatement.execute();
			if(executeUpdate){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }
	 public boolean queryUserInfo(String username,String psd){
		 String sql ="select*from users where username=? and psd=?";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, username);
			prepareStatement.setString(2, psd);
			ResultSet executeQuery = prepareStatement.executeQuery();
			return executeQuery.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }
	 public boolean insertUserInfo(User user){
		 String sql="insert into users (name,username,psd,cardId) value(?,?,?,?)";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1,user.name);
			prepareStatement.setString(2, user.username);
			prepareStatement.setString(3, user.psd);
			prepareStatement.setString(4, user.cardId);
			int executeUpdate = prepareStatement.executeUpdate();
			if(executeUpdate>0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }
	 public boolean return_ticket(String orderId,String name){
		 String sql = "delete from books where oriderIds=?";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, orderId);
//			prepareStatement.setString(2, name);
			int executeUpdate = prepareStatement.executeUpdate();
			if(executeUpdate>0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }
	 public boolean insertOrder(BookTicket bookTicket){
		 String sql ="insert into books (brandNum,oriderIds,times,name,cardIds,start_point,end_point,price,seat) value(?,?,?,?,?,?,?,?,?)";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, bookTicket.brandNum);
			prepareStatement.setString(2, bookTicket.orderId);
			prepareStatement.setString(3, bookTicket.time);
			prepareStatement.setString(4, bookTicket.name);
			prepareStatement.setString(5, bookTicket.cardId);
			prepareStatement.setString(6, bookTicket.start_point);
			prepareStatement.setString(7, bookTicket.end_point);
			prepareStatement.setDouble(8, bookTicket.price);
			prepareStatement.setString(9, bookTicket.seat);
			int executeUpdate = prepareStatement.executeUpdate();
			System.out.println(executeUpdate);
			if(executeUpdate>0){
				return true;
			}
			return false;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }
	 public boolean insertBookTicket(BookTicket bookTicket){
		 String sql ="insert into  book_tickets (brandNum,orderId,time,name,cardId,start_point,end_point,price,seat) value(?,?,?,?,?,?,?,?,?)";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, bookTicket.brandNum);
			prepareStatement.setString(2, getOrderTime());
			prepareStatement.setString(3, bookTicket.time);
			prepareStatement.setString(4, bookTicket.name);
			prepareStatement.setString(5, bookTicket.cardId);
			prepareStatement.setString(6, bookTicket.start_point);
			prepareStatement.setString(7, bookTicket.end_point);
			prepareStatement.setDouble(8, bookTicket.price);
			prepareStatement.setString(9, bookTicket.seat);
			int executeUpdate = prepareStatement.executeUpdate();
			if(executeUpdate>0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }
	 public User queryUserByUsername(String username){
		 String sql="select*from users where username=?";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, username);
			ResultSet executeQuery = prepareStatement.executeQuery();
			if(executeQuery.next()){
				User user = new User(executeQuery.getString(2), executeQuery.getString(3), executeQuery.getString(4), executeQuery.getString(5));
				return user;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return null;
	 }
	 public List<BookTicket> getAllBookTickets(){
		 List<BookTicket> alBookTickets = new ArrayList<BookTicket>();
		 String sql = "select*from book_tickets";
		 try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				BookTicket bookTicket = new BookTicket(resultSet.getString(2),resultSet.getString(3),resultSet.getString(4)
						,resultSet.getString(5),resultSet.getString(6),resultSet.getString(7),resultSet.getString(8),resultSet.getDouble(9),resultSet.getString(10));
				alBookTickets.add(bookTicket);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return alBookTickets;
	 }
	 public List<BookTicket> getAllBookTicktAlready(){
		 List<BookTicket> alBookTickets = new ArrayList<BookTicket>();
		 String sql = "select*from books";
		 try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(sql);
			while(resultSet.next()){
				BookTicket bookTicket = new BookTicket(resultSet.getString(1),resultSet.getString(2),resultSet.getString(3)
						,resultSet.getString(4),resultSet.getString(5),resultSet.getString(6),resultSet.getString(7),resultSet.getDouble(8),resultSet.getString(9));
				alBookTickets.add(bookTicket);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return alBookTickets;
	 }
	 public boolean updatePrice(String brandNum,double price){
		 String sql = "update air_line set price=? where brandNum=?";
		 try {
				PreparedStatement prepareStatement = connection.prepareStatement(sql);
				prepareStatement.setDouble(1, price);
				prepareStatement.setString(2, brandNum);
				int executeUpdate = prepareStatement.executeUpdate();
				System.out.println(executeUpdate);
				if(executeUpdate>0){
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		 return false;
	 }
	 /**
	  * 插入航班信息
	  * @return
	  */
	 public boolean insertInfoAirLine(AirScheduled airScheduled){
		 String sql = "insert into air_line (time,start_point,end_point,brandNum,airline_company,price,landTime,seat) value(?,?,?,?,?,?,?,?)";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, airScheduled.getTimes());
			prepareStatement.setString(2, MyControls.encodingStr(airScheduled.getStart_point()));
			prepareStatement.setString(3, MyControls.encodingStr(airScheduled.getEnd_point()));
			prepareStatement.setString(4,airScheduled.getBrandNum());
			prepareStatement.setString(5, MyControls.encodingStr(airScheduled.getAirline()));
			prepareStatement.setDouble(6, airScheduled.price);
			prepareStatement.setString(7, airScheduled.landTime);
			prepareStatement.setInt(8, airScheduled.seat);
			int update = prepareStatement.executeUpdate();
			if(update>0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }
	 public List<AirScheduled> getQueryAirInfo(String start,String end){
		 List<AirScheduled> airScheduleds = new ArrayList<AirScheduled>();
		 String sql = "select* from air_line where start_point=? and end_point=?";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, start);
			prepareStatement.setString(2, end);
			ResultSet resultSet = prepareStatement.executeQuery();
			
			while(resultSet.next()){
				AirScheduled airScheduled = new AirScheduled(resultSet.getString(2),resultSet.getString(3),resultSet.getString(4)
						,resultSet.getString(5),resultSet.getString(6),resultSet.getDouble(7),resultSet.getString(8),resultSet.getInt(9)
						);
				System.err.println(airScheduled.toString());
				airScheduleds.add(airScheduled);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return airScheduleds;
	 }
	 public List<AirScheduled> getQueryAirInfoByTime(String time,String start,String end){
		 List<AirScheduled> airScheduleds = new ArrayList<AirScheduled>();
		 String sql = "select* from air_line where  time = ? and start_point=? and end_point=?";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, time);
			prepareStatement.setString(2, start);
			prepareStatement.setString(3, end);
			ResultSet resultSet = prepareStatement.executeQuery();
			while(resultSet.next()){
				AirScheduled airScheduled = new AirScheduled(resultSet.getString(2),resultSet.getString(3),resultSet.getString(4)
						,resultSet.getString(5),resultSet.getString(6),resultSet.getDouble(7),
						resultSet.getString(8),resultSet.getInt(9)
						);
				airScheduleds.add(airScheduled);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return airScheduleds;
	 }
	 public boolean updateAirLineInfo(String brandNum,String times){
		 String sql = "update air_line set time=? where brandNum=?";
		 try {
				PreparedStatement prepareStatement = connection.prepareStatement(sql);
				prepareStatement.setString(1,times);
				prepareStatement.setString(2, brandNum);
				int executeUpdate = prepareStatement.executeUpdate();
				if(executeUpdate>0){
					return true;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		return false; 
	 }
	 /**
	  * 根据航班号删除航班信息
	  * @return
	  */
	 public boolean deleteAirlineByBrandNum(String brandNums){
		 String sql = "delete from air_line where brandNum=?";
		 try {
			PreparedStatement prepareStatement = connection.prepareStatement(sql);
			prepareStatement.setString(1, brandNums);
			int executeUpdate = prepareStatement.executeUpdate();
			if(executeUpdate>0){
				return true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		 return false;
	 }
	 public String getTime(){
		 Date date = new Date();
		 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		 return simpleDateFormat.format(date);
	 }
	 public String getOrderTime(){
		 Date date = new Date();
		 SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyyMMddHHmmss");
		 return simpleDateFormat.format(date);
	 }
	   
}
