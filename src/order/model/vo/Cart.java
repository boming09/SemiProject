package order.model.vo;

public class Cart {

	private int cart_no;
	private int book_id;
	private int user_no;
	private int amount;
	/*
	    CART_NO	NUMBER
		BOOK_ID	NUMBER
		USER_NO	NUMBER
		AMOUNT	NUMBER
	 * */
	
	public Cart() {}
	
	public Cart(int cart_no, int book_id, int user_no, int amount) {
		super();
		this.cart_no = cart_no;
		this.book_id = book_id;
		this.user_no = user_no;
		this.amount = amount;
	}
	
	public int getCart_no() {
		return cart_no;
	}
	public void setCart_no(int cart_no) {
		this.cart_no = cart_no;
	}
	public int getBook_id() {
		return book_id;
	}
	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}
	public int getUser_no() {
		return user_no;
	}
	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}

	@Override
	public String toString() {
		return "Cart [cart_no=" + cart_no + ", book_id=" + book_id + ", user_no=" + user_no + ", amount=" + amount
				+ "]";
	}
	
	
}
