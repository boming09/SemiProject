package notice.model.vo;

public class Upload {
	/*
	WC_UP_NO	NUMBER
	WCK_NO	NUMBER
	FILE_PATH	VARCHAR2(1000 BYTE)
	ORIGIN_FILE	VARCHAR2(500 BYTE)
	CHANGE_FILE	VARCHAR2(500 BYTE)
	STATUS	VARCHAR2(1 BYTE)
	*/
	private int wup_no;     		// 첨부파일 번호
	private int wck_no; 			// 참조 인증게시글 번호
	private String file_path;		// 파일경로
	private String origin_file;		// 원본 파일명
	private String change_file;		// 사본 파일명
	private String status;			// 삭제 여부
	
	public Upload() {}

	public Upload(int wup_no, int wck_no, String file_path, String origin_file, String change_file, String status) {
		super();
		this.wup_no = wup_no;
		this.wck_no = wck_no;
		this.file_path = file_path;
		this.origin_file = origin_file;
		this.change_file = change_file;
		this.status = status;
	}

	public int getWup_no() {
		return wup_no;
	}

	public void setWup_no(int wup_no) {
		this.wup_no = wup_no;
	}

	public int getWck_no() {
		return wck_no;
	}

	public void setWck_no(int wck_no) {
		this.wck_no = wck_no;
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

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Upload [wup_no=" + wup_no + ", wck_no=" + wck_no + ", file_path=" + file_path + ", origin_file="
				+ origin_file + ", change_file=" + change_file + ", status=" + status + "]";
	}
	
	
	
}
