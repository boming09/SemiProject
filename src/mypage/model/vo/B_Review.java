package mypage.model.vo;

import java.util.Date;

public class B_Review {
	/*
	 * REVIEW_NO	NUMBER	No		1	리뷰번호
		BOOK_ID	NUMBER	No		2	도서코드
		USER_NO	NUMBER	No		3	회원번호
		DATE	DATE	Yes	"SYSDATE	"	4	작성일
		CONTENT	VARCHAR2(200 BYTE)	Yes		5	내용
		RATING	NUMBER	Yes		6	평점
		REF_NO	NUMBER	No		7	참조리뷰번호
		STATUS	VARCHAR2(1 BYTE)	No	'Y' 	8	
	 */
	
	private int review_no;
	private int book_id;
	private int user_no;
	private Date create_date;
	private String content;
	private int rating;
	private int ref_no;
	private String status;
	
	public B_Review() {}

	public B_Review(int review_no, int book_id, int user_no, Date create_date, String content, int rating, int ref_no,
			String status) {
		super();
		this.review_no = review_no;
		this.book_id = book_id;
		this.user_no = user_no;
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

	@Override
	public String toString() {
		return "B_Review [review_no=" + review_no + ", book_id=" + book_id + ", user_no=" + user_no + ", create_date="
				+ create_date + ", content=" + content + ", rating=" + rating + ", ref_no=" + ref_no + ", status="
				+ status + "]";
	}
		
	
}
