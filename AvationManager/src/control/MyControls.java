package control;

import java.io.UnsupportedEncodingException;
import java.util.List;

import model.AirScheduled;
import model.BookTicket;
import model.DbUtils;
import model.User;

/**
 * 控制类
 * @author 
 *
 */
public class MyControls {

	
	
	
	   public static List<AirScheduled> getAllAirInfo(){
		 return DbUtils.getInstance().getAirSchedule();  
	   }
	   public static List<AirScheduled> queryAirInfo(String start,String end){
		   return DbUtils.getInstance().getQueryAirInfo(start, end);
	   }
	   public static List<AirScheduled> queryAirInfoByTime(String time,String start,String end){
		   return DbUtils.getInstance().getQueryAirInfoByTime(time, start, end);
	   }
	   public static boolean insertOrder(BookTicket bookTicket){
		   return DbUtils.getInstance().insertOrder(bookTicket);
	   }
	   public static boolean return_ticket(String orderId,String name){
		   return DbUtils.getInstance().return_ticket(orderId, name);
	   }
	   public static boolean querUser(String username,String psd){
		   return DbUtils.getInstance().queryUserInfo(username, psd);
	   }
	   public static boolean insertUser(User user){
		   return DbUtils.getInstance().insertUserInfo(user);
	   }
	   public static User queryUserByUsername(String username){
		   return DbUtils.getInstance().queryUserByUsername(username);
	   }
	   public static boolean deleteOrder(String order){
		   return DbUtils.getInstance().deleteOrder(order);
	   }
	   public static boolean insertAirLineInfo(AirScheduled airScheduled){
		return DbUtils.getInstance().insertInfoAirLine(airScheduled);   
	   }
	   public static boolean updateAirlineInfo(String brandNum,String times){
		   return DbUtils.getInstance().updateAirLineInfo(brandNum, times);
	   }
	   public static boolean deleteAirlineInfo(String brandNum){
		   return DbUtils.getInstance().deleteAirlineByBrandNum(brandNum);
	   }
	   public static boolean insertBookTicket(BookTicket bookTicket){
		   return DbUtils.getInstance().insertBookTicket(bookTicket);
	   }
	   public static  boolean updatePrice(String brandNum,double price){
		   return DbUtils.getInstance().updatePrice(brandNum, price);
	   }
	   public static List<BookTicket> getAllBook(){
		   return DbUtils.getInstance().getAllBookTickets();
	   }
	   public static List<BookTicket> getAllBookTicketAlready(){
		   return DbUtils.getInstance().getAllBookTicktAlready();
	   }
	   public static String encodingStr(String src){
		String result = "";
		try {
			byte buff [] = src.getBytes("ISO-8859-1");
			result = new String(buff);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		return result;
	   }
	   
	   
	   
}
