package writer.model.vo;

import java.util.Date;

public class WReview {
	/*
	REVIEW_NO	NUMBER
	BOOK_ID	NUMBER
	USER_NO	NUMBER
	CREATE_DATE	DATE
	CONTENT	VARCHAR2(300 BYTE)
	RATING	NUMBER
	REF_NO	NUMBER
	STATUS	VARCHAR2(1 BYTE)
	*/
	private int review_no;
	private int book_id;
	private String book_name;
	private int user_no;
	private String user_id;
	private Date create_date;
	private String content;
	private int rating;
	private int ref_no;
	private String status;
	
	public WReview() {}

	public WReview(int review_no, int book_id, String book_name, int user_no, String user_id, Date create_date,
			String content, int rating, int ref_no, String status) {
		super();
		this.review_no = review_no;
		this.book_id = book_id;
		this.book_name = book_name;
		this.user_no = user_no;
		this.user_id = user_id;
		this.create_date = create_date;
		this.content = content;
		this.rating = rating;
		this.ref_no = ref_no;
		this.status = status;
	}

	public int getReview_no() {
		return review_no;
	}

	public void setReview_no(int review_no) {
		this.review_no = review_no;
	}

	public int getBook_id() {
		return book_id;
	}

	public void setBook_id(int book_id) {
		this.book_id = book_id;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getRef_no() {
		return ref_no;
	}

	public void setRef_no(int ref_no) {
		this.ref_no = ref_no;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "WReview [review_no=" + review_no + ", book_id=" + book_id + ", book_name=" + book_name + ", user_no="
				+ user_no + ", user_id=" + user_id + ", create_date=" + create_date + ", content=" + content
				+ ", rating=" + rating + ", ref_no=" + ref_no + ", status=" + status + "]";
	}

	
	
	
}
