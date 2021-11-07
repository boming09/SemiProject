package mypage.model.vo;

import java.util.Date;

public class Myreview {

	/*
	 *  MID	NUMBER	No							1	게시글번호
		MTYPE	NUMBER	No						2	게시글 타입
		CID	NUMBER	No							3	카테고리ID
		MNAME	VARCHAR2(100 BYTE)	No			4	카테고리명
		MTITLE	VARCHAR2(100 BYTE)	No			5	게시글제목
		MCONTENT	VARCHAR2(4000 BYTE)	No		6	게시글내용
		MWRITER	NUMBER	No						7	게시글작성자
		USERNAME	VARCHAR2(50 BYTE)	No		8	작성자명
		MCOUNT	NUMBER	No						9	게시글조회수
		CREATE_DATE	DATE	Yes	SYSDATE 		10	작성일
		MODIFY_DATE	DATE	Yes	SYSDATE 		11	수정일
		STATUS	VARCHAR2(1 BYTE)	Yes	'Y' 	12	상태
	 */
	private int mid;			
	private int mtype;		
	private int cid;	
	private String mname;			
	private String mtitle;		
	private String mcontent;			
	private int mwriter;			
	private String userName;		
	private int mcount;
	private Date create_Date;
	private Date modify_Date;
	private String status;
	
	public Myreview() {}

	
	public Myreview(int mid, int mtype, int cid, String mname, String mtitle, String mcontent, int mwriter,
			String userName, int mcount, Date create_Date, Date modify_Date, String status) {
		super();
		this.mid = mid;
		this.mtype = mtype;
		this.cid = cid;
		this.mname = mname;
		this.mtitle = mtitle;
		this.mcontent = mcontent;
		this.mwriter = mwriter;
		this.userName = userName;
		this.mcount = mcount;
		this.create_Date = create_Date;
		this.modify_Date = modify_Date;
		this.status = status;
	}


	public int getMid() {
		return mid;
	}


	public void setMid(int mid) {
		this.mid = mid;
	}


	public int getMtype() {
		return mtype;
	}


	public void setMtype(int mtype) {
		this.mtype = mtype;
	}


	public int getCid() {
		return cid;
	}


	public void setCid(int cid) {
		this.cid = cid;
	}


	public String getMname() {
		return mname;
	}


	public void setMname(String mname) {
		this.mname = mname;
	}


	public String getMtitle() {
		return mtitle;
	}


	public void setMtitle(String mtitle) {
		this.mtitle = mtitle;
	}


	public String getMcontent() {
		return mcontent;
	}


	public void setMcontent(String mcontent) {
		this.mcontent = mcontent;
	}


	public int getMwriter() {
		return mwriter;
	}


	public void setMwriter(int mwriter) {
		this.mwriter = mwriter;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getMcount() {
		return mcount;
	}


	public void setMcount(int mcount) {
		this.mcount = mcount;
	}


	public Date getCreate_Date() {
		return create_Date;
	}


	public void setCreate_Date(Date create_Date) {
		this.create_Date = create_Date;
	}


	public Date getModify_Date() {
		return modify_Date;
	}


	public void setModify_Date(Date modify_Date) {
		this.modify_Date = modify_Date;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
	}


	@Override
	public String toString() {
		return "Mypagemyreview [mid=" + mid + ", mtype=" + mtype + ", cid=" + cid + ", mname=" + mname + ", mtitle="
				+ mtitle + ", mcontent=" + mcontent + ", mwriter=" + mwriter + ", userName=" + userName + ", mcount="
				+ mcount + ", create_Date=" + create_Date + ", modify_Date=" + modify_Date + ", status=" + status + "]";
	}


}
