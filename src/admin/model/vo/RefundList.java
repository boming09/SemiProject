package admin.model.vo;

import java.sql.Date;

public class RefundList {

	
	private int orderNo;
	private String userId;
	private String userName;
	private String userNickName;
	private String userPhone;
	private String bookName;
	private int amount;
	private int orderChange;
	
	public RefundList() {}

	public RefundList(int orderNo, String userId, String userName, String userNickName, String userPhone,
			String bookName, int amount, int orderChange) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;
		this.userName = userName;
		this.userNickName = userNickName;
		this.userPhone = userPhone;
		this.bookName = bookName;
		this.amount = amount;
		this.orderChange = orderChange;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
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

	public String getUserNickName() {
		return userNickName;
	}

	public void setUserNickName(String userNickName) {
		this.userNickName = userNickName;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getOrderChange() {
		return orderChange;
	}

	public void setOrderChange(int orderChange) {
		this.orderChange = orderChange;
	}

	@Override
	public String toString() {
		return "RefundList [orderNo=" + orderNo + ", userId=" + userId + ", userName=" + userName + ", userNickName="
				+ userNickName + ", userPhone=" + userPhone + ", bookName=" + bookName + ", amount=" + amount
				+ ", orderChange=" + orderChange + "]";
	}
	
	
	
}
