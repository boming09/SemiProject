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
	private String book_name;
	private String category_name;  
	private String author;
	private String publisher;
	private int price;  // 정가
	private int sale_price;  // 판매가
	private String book_img;
	
	public MyDetail() {}

	public MyDetail(int book_id, int order_no, int amount, int order_id, String book_name, String category_name,
			String author, String publisher, int price, int sale_price, String book_img) {
		super();
		this.book_id = book_id;
		this.order_no = order_no;
		this.amount = amount;
		this.order_id = order_id;
		this.book_name = book_name;
		this.category_name = category_name;
		this.author = author;
		this.publisher = publisher;
		this.price = price;
		this.sale_price = sale_price;
		this.book_img = book_img;
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

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
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

	public String getBook_img() {
		return book_img;
	}

	public void setBook_img(String book_img) {
		this.book_img = book_img;
	}

	@Override
	public String toString() {
		return "MyDetail [book_id=" + book_id + ", order_no=" + order_no + ", amount=" + amount + ", order_id="
				+ order_id + ", book_name=" + book_name + ", category_name=" + category_name + ", author=" + author
				+ ", publisher=" + publisher + ", price=" + price + ", sale_price=" + sale_price + ", book_img="
				+ book_img + "]";
	}

	
	
}
