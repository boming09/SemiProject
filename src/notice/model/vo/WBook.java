package notice.model.vo;

public class WBook {
	/*
	BOOK_ID	NUMBER
	WCK_NO	NUMBER
	*/
	private int bid; 	// 도서번호(book 테이블 조인)
	private int wck_no; // 참조 인증게시글 번호
	
	public WBook() {}

	public WBook(int bid, int wck_no) {
		super();
		this.bid = bid;
		this.wck_no = wck_no;
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

	@Override
	public String toString() {
		return "WBook [bid=" + bid + ", wck_no=" + wck_no + "]";
	}
	
	
	
	
}
