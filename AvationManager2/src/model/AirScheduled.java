package model;

public class AirScheduled {
 
	
	    @Override
	public String toString() {
		return "AirScheduled [times=" + times + ", start_point=" + start_point + ", end_point=" + end_point
				+ ", brandNum=" + brandNum + ", airline=" + airline + "]";
	}

		public String times;
	    public String start_point; 
	    public String end_point;
	    public String brandNum;
	    public String airline;
	    public double price;
	    public int seat;
	    public String landTime;
	    public AirScheduled(){}

		public AirScheduled(String times, String start_point, String end_point, String brandNum, String airline,double price,String landTime,int seat) {
			this.times = times;
			this.start_point = start_point;
			this.end_point = end_point;
			this.brandNum = brandNum;
			this.airline = airline;
			this.seat =seat;
			this.price = price;
			this.landTime = landTime;
		}

		public String getTimes() {
			return times;
		}

		public void setTimes(String times) {
			this.times = times;
		}

		public String getStart_point() {
			return start_point;
		}

		public void setStart_point(String start_point) {
			this.start_point = start_point;
		}

		public String getEnd_point() {
			return end_point;
		}

		public void setEnd_point(String end_point) {
			this.end_point = end_point;
		}

		public String getBrandNum() {
			return brandNum;
		}

		public void setBrandNum(String brandNum) {
			this.brandNum = brandNum;
		}

		public String getAirline() {
			return airline;
		}

		public void setAirline(String airline) {
			this.airline = airline;
		};
		
	    
}
