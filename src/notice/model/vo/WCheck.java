package notice.model.vo;

import java.util.Date;
import java.util.List;

public class WCheck {
	/*
	WCK_NO	NUMBER
	TITLE	VARCHAR2(100 BYTE)
	CONTENT	VARCHAR2(4000 BYTE)
	USER_NO	NUMBER
	CREATE_DATE	DATE
	STATUS	VARCHAR2(20 BYTE)
	*/
	private int wck_no;				// 작가 인증 게시글 번호
	private String wtitle;			// 제목
	private String wcontent;		// 내용
	private int user_no;			// 회원번호(작가등급 바뀌기전=일반회원)
	private String user_name;			// 회원이름(작가인증게시판은 작성자-이름으로보이게)
	private Date create_date;		// 작성일
	private String status;			// 확인 상태
	
	private List<WBook> wbook;		// 작가 도서
	private List<Upload> wupload;   // 게시글 첨부파일(1 or 2개)
	
	public WCheck() {}

	public WCheck(int wck_no, String wtitle, String wcontent, int user_no, String user_name, Date create_date,
			String status, List<WBook> wbook, List<Upload> wupload) {
		super();
		this.wck_no = wck_no;
		this.wtitle = wtitle;
		this.wcontent = wcontent;
		this.user_no = user_no;
		this.user_name = user_name;
		this.create_date = create_date;
		this.status = status;
		this.wbook = wbook;
		this.wupload = wupload;
	}



	public int getWck_no() {
		return wck_no;
	}

	public void setWck_no(int wck_no) {
		this.wck_no = wck_no;
	}

	public String getWtitle() {
		return wtitle;
	}

	public void setWtitle(String wtitle) {
		this.wtitle = wtitle;
	}

	public String getWcontent() {
		return wcontent;
	}

	public void setWcontent(String wcontent) {
		this.wcontent = wcontent;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}
	

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public Date getCreate_date() {
		return create_date;
	}

	public void setCreate_date(Date create_date) {
		this.create_date = create_date;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<WBook> getWbook() {
		return wbook;
	}

	public void setWbook(List<WBook> wbook) {
		this.wbook = wbook;
	}

	public List<Upload> getWupload() {
		return wupload;
	}

	public void setWupload(List<Upload> wupload) {
		this.wupload = wupload;
	}

	@Override
	public String toString() {
		return "WCheck [wck_no=" + wck_no + ", wtitle=" + wtitle + ", wcontent=" + wcontent + ", user_no=" + user_no
				+ ", user_name=" + user_name + ", create_date=" + create_date + ", status=" + status + ", wbook="
				+ wbook + ", wupload=" + wupload + "]";
	}

	

	
	
	
}
