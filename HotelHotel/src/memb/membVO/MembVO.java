package memb.membVO;

public class MembVO {

	private String userId;
	private String userName;
	private String userNic;
	private String userTel;
	private int userStatus;
	private String userCardnum;
	
	
	
	public MembVO() {
		super();
	}

	public MembVO(String userId, String userName, String userNic, String userTel, int userStatus, String userCardnum) {
		super();
		this.userId = userId;
		this.userName = userName;
		this.userNic = userNic;
		this.userTel = userTel;
		this.userStatus = userStatus;
		this.userCardnum = userCardnum;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserNic() {
		return userNic;
	}
	public void setUserNic(String userNic) {
		this.userNic = userNic;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public int getUserStatus() {
		return userStatus;
	}
	public void setUserStatus(int userStatus) {
		this.userStatus = userStatus;
	}
	public String getUserCardnum() {
		return userCardnum;
	}
	public void setUserCardnum(String userCardnum) {
		this.userCardnum = userCardnum;
	}

	@Override
	public String toString() {
		return "[userId=" + userId + ", userName=" + userName + ", userNic=" + userNic + ", userTel=" + userTel
				+ ", userStatus=" + userStatus + ", userCardnum=" + userCardnum + "]";
	}
	
	
	
	
	
}
