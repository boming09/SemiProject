package notice.model.vo;

import java.util.Date;

public class Commu {
	/*
	COMMU_NO	NUMBER
	TITLE	VARCHAR2(100 BYTE)
	CONTENT	VARCHAR2(4000 BYTE)
	USER_NO	NUMBER
	CREATE_DATE	DATE
	REPLY	VARCHAR2(4000 BYTE)
	COUNT	NUMBER
	WRITER_NO	NUMBER
	STATUS	VARCHAR2(20 BYTE)
	*/
	private int commu_no;		// 소통 게시글 번호
	private String ctitle;		// 제목
	private String ccontent;	// 내용
	private int user_no;		// 작성자
	private String user_id;	// 작성자 id
	private Date create_date;	// 등록일
	private String creply;		// 답변
	private int count;			// 조회수
	private int cwriter_no;		// 질문할 작가(member 조인)
	private String cwriter_name;  // 작가 이름(member 조인)
	private String status;		// 미답변/답변완료
	
	public Commu() {}

	public Commu(int commu_no, String ctitle, String ccontent, int user_no, String user_id, Date create_date,
			String creply, int count, int cwriter_no, String cwriter_name, String status) {
		super();
		this.commu_no = commu_no;
		this.ctitle = ctitle;
		this.ccontent = ccontent;
		this.user_no = user_no;
		this.user_id = user_id;
		this.create_date = create_date;
		this.creply = creply;
		this.count = count;
		this.cwriter_no = cwriter_no;
		this.cwriter_name = cwriter_name;
		this.status = status;
	}

	public int getCommu_no() {
		return commu_no;
	}

	public void setCommu_no(int commu_no) {
		this.commu_no = commu_no;
	}

	public String getCtitle() {
		return ctitle;
	}

	public void setCtitle(String ctitle) {
		this.ctitle = ctitle;
	}

	public String getCcontent() {
		return ccontent;
	}

	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
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

	public String getCreply() {
		return creply;
	}

	public void setCreply(String creply) {
		this.creply = creply;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getCwriter_no() {
		return cwriter_no;
	}

	public void setCwriter_no(int cwriter_no) {
		this.cwriter_no = cwriter_no;
	}

	public String getCwriter_name() {
		return cwriter_name;
	}

	public void setCwriter_name(String cwriter_name) {
		this.cwriter_name = cwriter_name;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Commu [commu_no=" + commu_no + ", ctitle=" + ctitle + ", ccontent=" + ccontent + ", user_no=" + user_no
				+ ", user_id=" + user_id + ", create_date=" + create_date + ", creply=" + creply
				+ ", count=" + count + ", cwriter_no=" + cwriter_no + ", cwriter_name=" + cwriter_name + ", status="
				+ status + "]";
	}

	
	
	
}
