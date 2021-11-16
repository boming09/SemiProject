package mypage.model.vo;

import java.util.Date;

public class B_Review {
	
	private int review_no;
	private int book_id;
	private String book_name;
	private int user_no;
	private Date create_date;
	private String content;
	private int rating;
	private int ref_no;
	private String status;
	private int category_id;
	private String category_name;
	private int writer;
	private String user_nickname;
	
	
	public B_Review() {}


	public B_Review(int review_no, int book_id, String book_name, int user_no, Date create_date, String content,
			int rating, int ref_no, String status, int category_id, String category_name, int writer,
			String user_nickname) {
		super();
		this.review_no = review_no;
		this.book_id = book_id;
		this.book_name = book_name;
		this.user_no = user_no;
		this.create_date = create_date;
		this.content = content;
		this.rating = rating;
		this.ref_no = ref_no;
		this.status = status;
		this.category_id = category_id;
		this.category_name = category_name;
		this.writer = writer;
		this.user_nickname = user_nickname;
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


	public int getCategory_id() {
		return category_id;
	}


	public void setCategory_id(int category_id) {
		this.category_id = category_id;
	}


	public String getCategory_name() {
		return category_name;
	}


	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}


	public int getWriter() {
		return writer;
	}


	public void setWriter(int writer) {
		this.writer = writer;
	}


	public String getUser_nickname() {
		return user_nickname;
	}


	public void setUser_nickname(String user_nickname) {
		this.user_nickname = user_nickname;
	}


	@Override
	public String toString() {
		return "B_Review [review_no=" + review_no + ", book_id=" + book_id + ", book_name=" + book_name + ", user_no="
				+ user_no + ", create_date=" + create_date + ", content=" + content + ", rating=" + rating + ", ref_no="
				+ ref_no + ", status=" + status + ", category_id=" + category_id + ", category_name=" + category_name
				+ ", writer=" + writer + ", user_nickname=" + user_nickname + "]";
	}


	
}
