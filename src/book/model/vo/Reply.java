package book.model.vo;

import java.util.Date;

public class Reply {
	private int rid;			// 리뷰번호
	private int bid;			// 도서번호
	private int userNo;			// 작성자(MEMBER 참조 값)
	private String userId;		// 작성자 ID
	private Date createDate;	// 작성일
	private String rcontent;	// 내용
	private int starScore;		// 별점
	private int refRid;			// 참조리뷰번호
//	REVIEW_NO	NUMBER
//	BOOK_ID	NUMBER
//	USER_NO	NUMBER
//	CREATE_DATE	DATE
//	CONTENT	VARCHAR2(300 BYTE)
//	RATING	NUMBER
//	REF_NO	NUMBER
	
	public Reply() {}

	public Reply(int rid, int bid, int userNo, String userId, Date createDate, String rcontent, int starScore, int refRid) {
		super();
		this.rid = rid;
		this.bid = bid;
		this.userNo = userNo;
		this.userId = userId;
		this.createDate = createDate;
		this.rcontent = rcontent;
		this.starScore = starScore;
		this.refRid = refRid;
	}

	public int getRid() {
		return rid;
	}


	public void setRid(int rid) {
		this.rid = rid;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getRcontent() {
		return rcontent;
	}

	public void setRcontent(String rcontent) {
		this.rcontent = rcontent;
	}

	public int getStarScore() {
		return starScore;
	}

	public void setStarScore(int starScore) {
		this.starScore = starScore;
	}

	public int getRefRid() {
		return refRid;
	}

	public void setRefRid(int refRid) {
		this.refRid = refRid;
	}

	@Override
	public String toString() {
		return "Reply [rid=" + rid + ", bid=" + bid + ", userNo=" + userNo + ", userId=" + userId + ", createDate="
				+ createDate + ", rcontent=" + rcontent + ", starScore=" + starScore + ", refRid=" + refRid + "]";
	}
	
	
}
