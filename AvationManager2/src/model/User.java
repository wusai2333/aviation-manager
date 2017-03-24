package model;

public class User {

	
	
	    public String username;
	    public String name;
	    public String psd;
	    public String cardId;
		public User(String username, String name, String psd, String cardId) {
			super();
			this.username = username;
			this.name = name;
			this.psd = psd;
			this.cardId = cardId;
		}
		@Override
		public String toString() {
			return "User [username=" + username + ", name=" + name + ", psd=" + psd + ", cardId=" + cardId + "]";
		}
}
