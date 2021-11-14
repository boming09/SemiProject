package notice.model.vo;

public class WBook {
	/*
	BOOK_ID	NUMBER
	WCK_NO	NUMBER
	*/
	private int bid; 	// 도서번호(book 테이블 조인)
	private int wck_no; // 참조 인증게시글 번호
	private String b_name;	// 도서명
	private String b_author;  // 도서작가
	private int user_no;
	
	
	public WBook() {}

	public WBook(int bid, int wck_no, String b_name, String b_author, int user_no) {
		super();
		this.bid = bid;
		this.wck_no = wck_no;
		this.b_name = b_name;
		this.b_author = b_author;
		this.user_no = user_no;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getWck_no() {
		return wck_no;
	}

	public void setWck_no(int wck_no) {
		this.wck_no = wck_no;
	}
	

	public String getB_name() {
		return b_name;
	}

	public void setB_name(String b_name) {
		this.b_name = b_name;
	}

	public String getB_author() {
		return b_author;
	}

	public void setB_author(String b_author) {
		this.b_author = b_author;
	}
	
	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	@Override
	public String toString() {
		return "WBook [bid=" + bid + ", wck_no=" + wck_no + ", b_name=" + b_name + ", b_author=" + b_author
				+ ", user_no=" + user_no + "]";
	}

	
}
