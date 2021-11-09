package admin.model.vo;

import java.sql.Date;

public class GradeList {
	private int wNo;
	private int uNo;
	private String title;
	private String userId;
	private String userNickName;
	private String userName;
	private Date create_date;
	
	public GradeList() {}

	public GradeList(int wNo, int uNo, String title, String userId, String userNickName, String userName,
			Date create_date) {
		super();
		this.wNo = wNo;
		this.uNo = uNo;
		this.title = title;
		this.userId = userId;
		this.userNickName = userNickName;
		this.userName = userName;
		this.create_date = create_date;
	}

	public int getwNo() {
		return wNo;
	}

	public void setwNo(int wNo) {
		this.wNo = wNo;
	}

	public int getuNo() {
		return uNo;
	}

	public void setuNo(int uNo) {
		this.uNo = uNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	@Override
	public String toString() {
		return "GradeList [wNo=" + wNo + ", uNo=" + uNo + ", title=" + title + ", userId=" + userId + ", userNickName="
				+ userNickName + ", userName=" + userName + ", create_date=" + create_date + "]";
	}

	
	
	
	
	
}
