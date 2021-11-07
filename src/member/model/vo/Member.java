package member.model.vo;

import java.sql.Date;

import member.model.vo.Member;

public class Member {

	private int userNo;				// 회원 번호
	private String userId;			// 회원 아이디
	private String userPwd;			// 회원 비밀번호
	private String userName;		// 회원 이름
	private String gender;			// 성별
	private String userEmail;		// 회원 이메일
	private String userPhone;		// 회원 휴대폰
	private String userAddress;		// 회원 주소
	private int userGrade;			// 회원 등급
	private Date enrollDate;		// 회원 가입일
	private String status;			// 회원 탈퇴 여부
	private String userCertify;		// 본인인증
	private String userNickname;	// 닉네임
	
	/*
	 *  USER_NO	NUMBER	No		1	회원번호
	USER_ID	VARCHAR2(30 BYTE)	No		2	아이디
	USER_PWD	VARCHAR2(100 BYTE)	No		3	비밀번호
	USER_NAME	VARCHAR2(15 BYTE)	No		4	이름
	GENDER	VARCHAR2(10 BYTE)	No		5	성별
	USER_EMAIL	VARCHAR2(100 BYTE)	Yes		6	이메일
	USER_PHONE	VARCHAR2(13 BYTE)	No		7	휴대전화
	USER_ADDRESS	VARCHAR2(100 BYTE)	No		8	주소
	USER_GRADE	NUMBER	Yes		9	회원등급
	ENROLL_DATE	DATE	Yes	"SYSDATE	"	10	가입일
	STATUS	VARCHAR2(1 BYTE)	Yes	"'Y'	"	11	상태
	USER_CERTIFY	VARCHAR2(10 BYTE)	Yes	NULL	12	본인인증
	USER_NICKNAME	VARCHAR2(10 BYTE)	Yes	NULL	13	닉네임
	 * 
	 * */
	
	public Member() {}		

	public Member(int userNo, String userName, String userPhone, String userEmail, String userAddress) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
	}

	
	
	public Member(int userNo, String userName, String userPhone, String userEmail, String userAddress,
			String userNickname) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.userNickname = userNickname;
	}

	public Member(String userId, String userPwd, String userName, String gender, String userPhone, String userEmail,
			String userAddress) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
	}

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

	public Member(int userNo, String userId, String userPwd, String userName, String gender, String userPhone,
			String userEmail, String userAddress, int userGrade, Date enrollDate, String status, String userCertify,
			String userNickname) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.gender = gender;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userAddress = userAddress;
		this.userGrade = userGrade;
		this.enrollDate = enrollDate;
		this.status = status;
		this.userCertify = userCertify;
		this.userNickname = userNickname;
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
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getUserCertify() {
		return userCertify;
	}

	public void setUserCertify(String userCertify) {
		this.userCertify = userCertify;
	}

	public String getUserNickname() {
		return userNickname;
	}

	public void setUserNickname(String userNickname) {
		this.userNickname = userNickname;
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
				+ ", gender=" + gender + ", userPhone=" + userPhone + ", userEmail=" + userEmail + ", userAddress="
				+ userAddress + ", userGrade=" + userGrade + ", enrollDate=" + enrollDate + ", status=" + status
				+ ", userCertify=" + userCertify + ", userNickname=" + userNickname + "]";
	}

}
