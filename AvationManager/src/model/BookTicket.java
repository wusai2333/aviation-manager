package model;

public class BookTicket {
      public String brandNum;
	  public String orderId;
	  public String time;
	  public String name;
	  public String cardId;
	  public String start_point;
	  public String end_point;
	  public double price;
	  public  String seat;
	@Override
	public String toString() {
		return "BookTicket [orderId=" + orderId + ", time=" + time + ", name=" + name + ", cardId=" + cardId
				+ ", start_point=" + start_point + ", end_point=" + end_point + ", price=" + price + "]";
	}
	public BookTicket(String brandNum,String orderId,String time, String name, String cardId, String start_point, String end_point, double price,String seat) {
		this.brandNum = brandNum;
		this.orderId = orderId;
		this.time = time;
		this.seat  = seat;
		this.name = name;
		this.cardId = cardId;
		this.start_point = start_point;
		this.end_point = end_point;
		this.price = price;
	}
	public BookTicket() {
	}
	
	  
	  
}
