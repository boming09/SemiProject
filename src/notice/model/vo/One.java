package notice.model.vo;

import java.sql.Date;

public class One {
	/*
	ONE_NO	NUMBER
	TITLE	VARCHAR2(100 BYTE)
	CONTENT	VARCHAR2(4000 BYTE)
	CREATE_DATE	DATE
	STATUS	VARCHAR2(1 BYTE)
	USER_NO	NUMBER
	REPLY	VARCHAR2(4000 BYTE)
	FILEID	VARCHAR2(1000 BYTE)
	ORIGIN_FILE	VARCHAR2(255 BYTE)
	CHANGE_FILE	VARCHAR2(255 BYTE)
	*/
	private int owriter;            // 로그인 유저=게시글 작성자(추후 member랑 조인)
	private int one_no;				// 1:1문의 게시글번
	private String otitle;			// 제목
	private String ocontent; 		// 내용
	private Date odate;				// 게시글 작성일
	private String status;			// 미답변=N/답변완료=Y
	private String oreply;	        // 관리자 답변
	private String file_path;       // 첨부파일 저장 경로
	private String origin_file;
	private String change_file;
	
	public One() {}

	public One(int owriter, int one_no, String otitle, String ocontent, Date odate, String status, String oreply,
			String file_path, String origin_file, String change_file) {
		super();
		this.owriter = owriter;
		this.one_no = one_no;
		this.otitle = otitle;
		this.ocontent = ocontent;
		this.odate = odate;
		this.status = status;
		this.oreply = oreply;
		this.file_path = file_path;
		this.origin_file = origin_file;
		this.change_file = change_file;
	}

	public int getOwriter() {
		return owriter;
	}

	public void setOwriter(int owriter) {
		this.owriter = owriter;
	}

	public int getOne_no() {
		return one_no;
	}

	public void setOne_no(int one_no) {
		this.one_no = one_no;
	}

	public String getOtitle() {
		return otitle;
	}

	public void setOtitle(String otitle) {
		this.otitle = otitle;
	}

	public String getOcontent() {
		return ocontent;
	}

	public void setOcontent(String ocontent) {
		this.ocontent = ocontent;
	}

	public Date getOdate() {
		return odate;
	}

	public void setOdate(Date odate) {
		this.odate = odate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getOreply() {
		return oreply;
	}

	public void setOreply(String oreply) {
		this.oreply = oreply;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getOrigin_file() {
		return origin_file;
	}

	public void setOrigin_file(String origin_file) {
		this.origin_file = origin_file;
	}

	public String getChange_file() {
		return change_file;
	}

	public void setChange_file(String change_file) {
		this.change_file = change_file;
	}

	@Override
	public String toString() {
		return "One [owriter=" + owriter + ", one_no=" + one_no + ", otitle=" + otitle + ", ocontent=" + ocontent
				+ ", odate=" + odate + ", status=" + status + ", oreply=" + oreply + ", file_path=" + file_path
				+ ", origin_file=" + origin_file + ", change_file=" + change_file + "]";
	}

	
	
}
