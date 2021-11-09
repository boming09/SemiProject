package writer.model.vo;

public class WProfile {
	/*
	PRO_NO	NUMBER
	WRITER_NO	NUMBER
	FILE_PATH	VARCHAR2(1000 BYTE)
	GREETING	VARCHAR2(4000 BYTE)
	ORIGIN_FILE	VARCHAR2(255 BYTE)
	CHANGE_FILE	VARCHAR2(255 BYTE)
	*/
	private int pro_no;
	private int writer_no;      // 작가 회원번호
	private String writer_name;    // 작가 이름
	private String file_path; 
	private String greeting;     // 인사말
	private String origin_file;
	private String change_file;
	private String delete_file;  // 덮어쓰기 시 삭제할 파일명
	
	public WProfile() {}

	public WProfile(int pro_no, int writer_no, String writer_name, String file_path, String greeting, String origin_file,
			String change_file, String delete_file) {
		super();
		this.pro_no = pro_no;
		this.writer_no = writer_no;
		this.writer_name = writer_name;
		this.file_path = file_path;
		this.greeting = greeting;
		this.origin_file = origin_file;
		this.change_file = change_file;
		this.delete_file = delete_file;
	}


	public int getPro_no() {
		return pro_no;
	}

	public void setPro_no(int pro_no) {
		this.pro_no = pro_no;
	}

	public int getWriter_no() {
		return writer_no;
	}

	public void setWriter_no(int writer_no) {
		this.writer_no = writer_no;
	}

	public String getWriter_name() {
		return writer_name;
	}

	public void setWriter_name(String writer_name) {
		this.writer_name = writer_name;
	}

	public String getFile_path() {
		return file_path;
	}

	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}

	public String getGreeting() {
		return greeting;
	}

	public void setGreeting(String greeting) {
		this.greeting = greeting;
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

	
	public String getDelete_file() {
		return delete_file;
	}

	public void setDelete_file(String delete_file) {
		this.delete_file = delete_file;
	}

	@Override
	public String toString() {
		return "WProfile [pro_no=" + pro_no + ", writer_no=" + writer_no + ", writer_name=" + writer_name
				+ ", file_path=" + file_path + ", greeting=" + greeting + ", origin_file=" + origin_file
				+ ", change_file=" + change_file + ", delete_file=" + delete_file + "]";
	}

	

	
	
}
