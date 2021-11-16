package admin.model.vo;

import java.sql.Date;

public class ShipList {

	private int orderNo;
	private String userId;
	private String userName;
	private String userNickName;
	private String bookName;
	private int amount;
	private Date order_date;
	private String delivery;
	
	public ShipList() {}

	public ShipList(int orderNo, String userId, String userName, String userNickName, String bookName, int amount,
			Date order_date, String delivery) {
		super();
		this.orderNo = orderNo;
		this.userId = userId;
		this.userName = userName;
		this.userNickName = userNickName;
		this.bookName = bookName;
		this.amount = amount;
		this.order_date = order_date;
		this.delivery = delivery;
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

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	@Override
	public String toString() {
		return "ShipList [orderNo=" + orderNo + ", userId=" + userId + ", userName=" + userName + ", userNickName="
				+ userNickName + ", bookName=" + bookName + ", amount=" + amount + ", order_date=" + order_date
				+ ", delivery=" + delivery + "]";
	}

	
	
	
	
	
}




