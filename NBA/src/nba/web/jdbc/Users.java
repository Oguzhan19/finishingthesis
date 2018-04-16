package nba.web.jdbc;

public class Users {
	private String userName;
	private int userId;
	private String fullname;
	private String email;
	private String password;
	private String userType;

	public Users(String userName, int userId, String fullname, String email, String password, String userType) {
		super();
		this.userName = userName;
		this.userId = userId;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.userType = userType;
	}

	public Users(String userName, String fullname, String email, String password, String userType) {
		super();
		this.userName = userName;
		this.fullname = fullname;
		this.email = email;
		this.password = password;
		this.userType = userType;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String toString() {

		return "Users[userName=" + userName + ",+userId=" + userId + ",fullname=" + fullname + ",email=" + email
				+ ",password=" + password + ",userType=" + userType + "]";
	}
}
