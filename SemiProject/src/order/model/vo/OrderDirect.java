package order.model.vo;

public class OrderDirect {
	private int amount;
	private String book_name;
	private int price;
	private int sale_price;
	private int book_id;
	
	public OrderDirect() {}
	
	
	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public OrderDirect(int amount, String book_name, int price, int sale_price, int book_id) {
		super();
		this.amount = amount;
		this.book_name = book_name;
		this.price = price;
		this.sale_price = sale_price;
		this.book_id = book_id;
	}

	public OrderDirect(int amount, String book_name, int price, int sale_price) {
		super();
		this.amount = amount;
		this.book_name = book_name;
		this.price = price;
		this.sale_price = sale_price;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getBook_name() {
		return book_name;
	}
	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSale_price() {
		return sale_price;
	}
	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}


	@Override
	public String toString() {
		return "OrderDirect [amount=" + amount + ", book_name=" + book_name + ", price=" + price + ", sale_price="
				+ sale_price + ", book_id=" + book_id + "]";
	}

	
}
