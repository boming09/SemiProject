package mypage.model.vo;

import java.sql.Date;

public class B_review {
	/*
	 *  REVIEW_NO	NUMBER	No		1	리뷰번호
		BOOK_ID	NUMBER	No		2	도서코드
		USER_NO	NUMBER	No		3	회원번호
		DATE	DATE	Yes	"SYSDATE	"	4	작성일
		CONTENT	VARCHAR2(200 BYTE)	Yes		5	내용
		RATING	NUMBER	Yes		6	평점
		REF_NO	NUMBER	No		7	참조리뷰번호
	 */
	private int review_no;		// 리뷰 번호
	private int book_id;		// 도서 코드
	private int user_no;		// 회원 번호
	private Date date;			// 작성일
	private String content;		// 내용
	private int rating;			// 평점
	private int ref_no;			// 참조리뷰 번호
	
	public B_review() {}

	public B_review(int review_no, int book_id, int user_no, Date date, String content, int rating, int ref_no) {
		super();
		this.review_no = review_no;
		this.book_id = book_id;
		this.user_no = user_no;
		this.date = date;
		this.content = content;
		this.rating = rating;
		this.ref_no = ref_no;
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

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	@Override
	public String toString() {
		return "B_review [review_no=" + review_no + ", book_id=" + book_id + ", user_no=" + user_no + ", date=" + date
				+ ", content=" + content + ", rating=" + rating + ", ref_no=" + ref_no + "]";
	}
	
	
	
}
