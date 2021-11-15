package order.model.vo;

public class Cart {

	private String book_name;
	private int category_id;
	private String author;
	private String publisher;
	private int sale_price;
	private int price;
	private int stock;
	private String book_img;
	
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
	
	
	
	public Cart(String book_name, int category_id, String author, String publisher, int sale_price, int price,
			int stock, String book_img, int cart_no, int book_id, int user_no, int amount) {
		super();
		this.book_name = book_name;
		this.category_id = category_id;
		this.author = author;
		this.publisher = publisher;
		this.sale_price = sale_price;
		this.price = price;
		this.stock = stock;
		this.book_img = book_img;
		this.cart_no = cart_no;
		this.book_id = book_id;
		this.user_no = user_no;
		this.amount = amount;
	}



	public String getBook_name() {
		return book_name;
	}



	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}



	public int getCategory_id() {
		return category_id;
	}



	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}



	public String getAuthor() {
		return author;
	}



	public void setAuthor(String author) {
		this.author = author;
	}



	public String getPublisher() {
		return publisher;
	}



	public void setPublisher(String publisher) {
		this.publisher = publisher;
	}



	public int getSale_price() {
		return sale_price;
	}



	public void setSale_price(int sale_price) {
		this.sale_price = sale_price;
	}



	public int getPrice() {
		return price;
	}



	public void setPrice(int price) {
		this.price = price;
	}



	public int getStock() {
		return stock;
	}



	public void setStock(int stock) {
		this.stock = stock;
	}



	public String getBook_img() {
		return book_img;
	}



	public void setBook_img(String book_img) {
		this.book_img = book_img;
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
		return "Cart [book_name=" + book_name + ", category_id=" + category_id + ", author=" + author + ", publisher="
				+ publisher + ", sale_price=" + sale_price + ", price=" + price + ", stock=" + stock + ", book_img="
				+ book_img + ", cart_no=" + cart_no + ", book_id=" + book_id + ", user_no=" + user_no + ", amount="
				+ amount + "]";
	}

	
	
}
