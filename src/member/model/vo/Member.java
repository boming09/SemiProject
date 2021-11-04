package member.model.vo;

import java.sql.Date;

import member.model.vo.Member;

public class Member {

	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userPhone;
	private String userEmail;
	private String userAddress;
	private int userGrade;
	private Date enrollDate;
	private String status;
	
	/*
	 *  USER_NO	NUMBER	No		1	회원번호
		USER_ID	VARCHAR2(30 BYTE)	No		2	아이디
		USER_PWD	VARCHAR2(100 BYTE)	No		3	비밀번호
		USER_NAME	VARCHAR2(15 BYTE)	No		4	이름
		USER_EMAIL	VARCHAR2(100 BYTE)	Yes		5	이메일
		USER_PHONE	VARCHAR2(13 BYTE)	No		6	휴대전화
		USER_ADDRESS	VARCHAR2(100 BYTE)	No		7	주소
		USER_GRADE	NUMBER	Yes		8	회원등급
		ENROLL_DATE	DATE	Yes	"SYSDATE	"	9	가입일
		STATUS	VARCHAR2(1 BYTE)	Yes	"'Y'	"	10	상태
	 * 
	 * */
	
	public Member() {}	

	public Member(String userId, String userPwd, String userName, String userPhone, String userEmail,
			String userAddress) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
	}



	public Member(int userNo, String userId, String userPwd, String userName, String userPhone, String userEmail,
			String userAddress, int userGrade, Date enrollDate, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.userGrade = userGrade;
		this.enrollDate = enrollDate;
		this.status = status;
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

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getUserPhone() {
		return userPhone;
	}

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}

	public String getUserAddress() {
		return userAddress;
	}

	public void setUserAddress(String userAddress) {
		this.userAddress = userAddress;
	}

	public int getUserGrade() {
		return userGrade;
	}

	public void setUserGrade(int userGrade) {
		this.userGrade = userGrade;
	}

	public Date getEnrollDate() {
		return enrollDate;
	}

	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userEmail=" + userEmail + ", userPhone=" + userPhone + ", userAddress=" + userAddress
				+ ", userGrade=" + userGrade + ", enrollDate=" + enrollDate + ", status=" + status + "]";
	}
	
	
}
