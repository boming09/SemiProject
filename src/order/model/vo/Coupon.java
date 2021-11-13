package order.model.vo;

import java.util.Date;

public class Coupon {
	
	private int couponNo;
	private String couponNm;
	private String couponCtt;
	private int couponDis;
	private Date cExpDate;
	private int userNo;
	

	public Coupon() {}


	public Coupon(int couponNo, String couponNm, String couponCtt, int couponDis, Date cExpDate, int userNo) {
		super();
		this.couponNo = couponNo;
		this.couponNm = couponNm;
		this.couponCtt = couponCtt;
		this.couponDis = couponDis;
		this.cExpDate = cExpDate;
		this.userNo = userNo;
	}


	public int getCouponNo() {
		return couponNo;
	}


	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}


	public String getCouponNm() {
		return couponNm;
	}


	public void setCouponNm(String couponNm) {
		this.couponNm = couponNm;
	}


	public String getCouponCtt() {
		return couponCtt;
	}


	public void setCouponCtt(String couponCtt) {
		this.couponCtt = couponCtt;
	}


	public int getCouponDis() {
		return couponDis;
	}


	public void setCouponDis(int couponDis) {
		this.couponDis = couponDis;
	}


	public Date getcExpDate() {
		return cExpDate;
	}


	public void setcExpDate(Date cExpDate) {
		this.cExpDate = cExpDate;
	}


	public int getUserNo() {
		return userNo;
	}


	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}


	@Override
	public String toString() {
		return "Coupon [couponNo=" + couponNo + ", couponNm=" + couponNm + ", couponCtt=" + couponCtt + ", couponDis="
				+ couponDis + ", cExpDate=" + cExpDate + ", userNo=" + userNo + "]";
	}
	
	
	
}
