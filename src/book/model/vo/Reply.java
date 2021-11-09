package book.model.vo;

import java.util.Date;

public class Reply {
	private int rid;			// 리뷰번호
	private int bid;			// 도서번호
	private int userNo;			// 작성자(MEMBER 참조 값)
	private Date createDate;	// 작성일
	private String rcontent;	// 내용
	private double avgScore;	// 평점
	private int refRid;			// 참조리뷰번호
//	REVIEW_NO	NUMBER
//	BOOK_ID	NUMBER
//	USER_NO	NUMBER
//	CREATE_DATE	DATE
//	CONTENT	VARCHAR2(300 BYTE)
//	RATING	NUMBER
//	REF_NO	NUMBER
	
	public Reply(int rid, int bid, int userNo, Date createDate, String rcontent, double avgScore, int refRid) {
		super();
		this.rid = rid;
		this.bid = bid;
		this.userNo = userNo;
		this.createDate = createDate;
		this.rcontent = rcontent;
		this.avgScore = avgScore;
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

	public double getAvgScore() {
		return avgScore;
	}

	public void setAvgScore(double avgScore) {
		this.avgScore = avgScore;
	}

	public int getRefRid() {
		return refRid;
	}

	public void setRefRid(int refRid) {
		this.refRid = refRid;
	}

	@Override
	public String toString() {
		return "Reply [rid=" + rid + ", bid=" + bid + ", userNo=" + userNo + ", createDate=" + createDate
				+ ", rcontent=" + rcontent + ", avgScore=" + avgScore + ", refRid=" + refRid + "]";
	}
	
}
