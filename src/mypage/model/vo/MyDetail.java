package mypage.model.vo;

public class MyDetail {
	/*
	BOOK_ID	NUMBER
	ORDER_NO	NUMBER
	AMOUNT	NUMBER
	ORDER_ID	VARCHAR2(20 BYTE)
	*/
	private int book_id;   // 도서 번호
	private int order_no;  // order번호 조인
	private int amount;		// 도서 구매 수량
	private int order_id;		// orderDetail 고유번호
	
	public MyDetail() {}

	public MyDetail(int book_id, int order_no, int amount, int order_id) {
		super();
		this.book_id = book_id;
		this.order_no = order_no;
		this.amount = amount;
		this.order_id = order_id;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getOrder_id() {
		return order_id;
	}

	public void setOrder_id(int order_id) {
		this.order_id = order_id;
	}

	@Override
	public String toString() {
		return "MyodDetail [book_id=" + book_id + ", order_no=" + order_no + ", amount=" + amount + ", order_id="
				+ order_id + "]";
	}
	
	
	
}
