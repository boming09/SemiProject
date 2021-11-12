package mypage.model.vo;

import java.util.Date;
import java.util.List;

public class MyOrder {
	/*
	ORDER_NO	NUMBER
	ORDER_DATE	DATE
	REL_DATE	DATE
	RECEIPTE_DATE	DATE
	ADDRESS	VARCHAR2(200 BYTE)
	PHONE	VARCHAR2(13 BYTE)
	PAYMENT	VARCHAR2(20 BYTE)
	DELIVERY	VARCHAR2(20 BYTE)
	DELIVERY_NUMBER	VARCHAR2(20 BYTE)
	USER_NO	NUMBER
	ORDERCHANGE	NUMBER
	*/
	private int order_no;     // 주문번호
	private Date order_date;  // 주문 날짜
	private Date rel_date;    // 출고예상일
	private Date receipte_date;  // 수령 예상일
	private String address;   // 주소
	private String phone;     // 전화번호
	private String payment;		// 결제수단
	private String delivery;	// 배송상태
	private int delivery_number;	// 운송장번호
	private int user_no;	// 주문한사람=유저
	private int orderchange;   // 주문취소:10 / 교환:20 / 반품:30
	private int detailCount;  //
	
	private List<MyDetail> myDetail;   // orderDetail 조인
	
	public MyOrder() {}

	

	public MyOrder(int order_no, Date order_date, Date rel_date, Date receipte_date, String address, String phone,
			String payment, String delivery, int delivery_number, int user_no, int orderchange, int detailCount,
			List<MyDetail> myDetail) {
		super();
		this.order_no = order_no;
		this.order_date = order_date;
		this.rel_date = rel_date;
		this.receipte_date = receipte_date;
		this.address = address;
		this.phone = phone;
		this.payment = payment;
		this.delivery = delivery;
		this.delivery_number = delivery_number;
		this.user_no = user_no;
		this.orderchange = orderchange;
		this.detailCount = detailCount;
		this.myDetail = myDetail;
	}

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public Date getOrder_date() {
		return order_date;
	}

	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}

	public Date getRel_date() {
		return rel_date;
	}

	public void setRel_date(Date rel_date) {
		this.rel_date = rel_date;
	}

	public Date getReceipte_date() {
		return receipte_date;
	}

	public void setReceipte_date(Date receipte_date) {
		this.receipte_date = receipte_date;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPayment() {
		return payment;
	}

	public void setPayment(String payment) {
		this.payment = payment;
	}

	public String getDelivery() {
		return delivery;
	}

	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}

	public int getDelivery_number() {
		return delivery_number;
	}

	public void setDelivery_number(int delivery_number) {
		this.delivery_number = delivery_number;
	}

	public int getUser_no() {
		return user_no;
	}

	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}

	public int getOrderchange() {
		return orderchange;
	}

	public void setOrderchange(int orderchange) {
		this.orderchange = orderchange;
	}
	
	public int getDetailCount() {
		return detailCount;
	}

	public void setDetailCount(int detailCount) {
		this.detailCount = detailCount;
	}


	public List<MyDetail> getMyDetail() {
		return myDetail;
	}

	public void setMyDetail(List<MyDetail> myDetail) {
		this.myDetail = myDetail;
	}



	@Override
	public String toString() {
		return "MyOrder [order_no=" + order_no + ", order_date=" + order_date + ", rel_date=" + rel_date
				+ ", receipte_date=" + receipte_date + ", address=" + address + ", phone=" + phone + ", payment="
				+ payment + ", delivery=" + delivery + ", delivery_number=" + delivery_number + ", user_no=" + user_no
				+ ", orderchange=" + orderchange + ", detailCount=" + detailCount + ", myDetail=" + myDetail + "]";
	}

	
	
}
