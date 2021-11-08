package writer.model.vo;

import java.util.Date;
import java.util.List;

public class WriterInfo {
	/* member 테이블에서 필요한것만
	USER_NO	NUMBER
	USER_ID	VARCHAR2(30 BYTE)
	USER_PWD	VARCHAR2(100 BYTE)
	USER_NAME	VARCHAR2(15 BYTE)
	-- GENDER	VARCHAR2(10 BYTE)
	USER_EMAIL	VARCHAR2(100 BYTE)
	USER_PHONE	VARCHAR2(13 BYTE)
	USER_ADDRESS	VARCHAR2(100 BYTE)
	USER_GRADE	NUMBER
	ENROLL_DATE	DATE
	STATUS	VARCHAR2(1 BYTE)
	-- USER_CERTIFY	VARCHAR2(10 BYTE) 
	-- USER_NICKNAME	VARCHAR2(30 BYTE) 
	*/
	private int user_no;
	private String id;
	private String pwd;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String grade;
	private Date enrolldate;
	private String status;
	
	private WProfile wprofile; 	
	
	public WriterInfo() {}
	
	public WriterInfo(int user_no, String id, String pwd, String name, String email, String phone, String address,
			String grade, Date enrolldate, String status, WProfile wprofile) {
		super();
		this.user_no = user_no;
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.grade = grade;
		this.enrolldate = enrolldate;
		this.status = status;
		this.wprofile = wprofile;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getGrade() {
		return grade;
	}

	public void setGrade(String grade) {
		this.grade = grade;
	}

	public Date getEnrolldate() {
		return enrolldate;
	}

	public void setEnrolldate(Date enrolldate) {
		this.enrolldate = enrolldate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public WProfile getWprofile() {
		return wprofile;
	}

	public void setWprofile(WProfile wprofile) {
		this.wprofile = wprofile;
	}

	@Override
	public String toString() {
		return "WriterInfo [user_no=" + user_no + ", id=" + id + ", pwd=" + pwd + ", name=" + name + ", email=" + email
				+ ", phone=" + phone + ", address=" + address + ", grade=" + grade + ", enrolldate=" + enrolldate
				+ ", status=" + status + ", wprofile=" + wprofile + "]";
	}
	
	
	
	
	
}
