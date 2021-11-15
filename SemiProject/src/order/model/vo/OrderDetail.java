package order.model.vo;

import java.io.Serializable;

public class OrderDetail implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int bookId;
	private int orderNo;
	private int amount;
	/*
	 * BOOK_ID	NUMBER		//도서코드
	   ORDER_NO	NUMBER	  	//주문번호
	   AMOUNT	NUMBER		//수량
	 * */
	
	public OrderDetail(int bookId, int orderNo, int amount) {
		super();
		this.bookId = bookId;
		this.orderNo = orderNo;
		this.amount = amount;
	}
	

	public OrderDetail(int bookId, int amount) {
		super();
		this.bookId = bookId;
		this.amount = amount;
	}


	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}

	public int getBookId() {
		return bookId;
	}

	public void setBookId(int bookId) {
		this.bookId = bookId;
	}

	public int getOrderNo() {
		return orderNo;
	}

	public void setOrderNo(int orderNo) {
		this.orderNo = orderNo;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "OrderDetail [bookId=" + bookId + ", orderNo=" + orderNo + ", amount=" + amount + "]";
	}
	
	
}
