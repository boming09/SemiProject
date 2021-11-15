package order.model.vo;

import java.util.Date;
import java.util.List;

public class Order {
	
	private int order_no;				// 주문 번호
	private Date order_date;			// 주문 접수일
	private Date rel_date;				// 출고 예상일
	private Date receipte_date;			// 수령 예상일
	private String address;				// 배송지
	private String phone;				// 연락처
	private String payment;				// 결제 수단
	private String delivery;			// 배송상태
	private String delivery_number;		// 운송장 번호
	private int user_no;				// 회원 번호
	
	//주문이름
	//우편번호
	
	private List<OrderDetail> orderDetail;
	private int couponNo;
	
	/*
	 *  ORDER_NO	NUMBER
		ORDER_DATE	DATE
		REL_DATE	DATE
		RECEIPTE_DATE	DATE
		ADDRESS	VARCHAR2(200 BYTE)
		PHONE	VARCHAR2(13 BYTE)
		PAYMENT	VARCHAR2(20 BYTE)
		DELIVERY	VARCHAR2(20 BYTE)
		DELIVERY_NUMBER	VARCHAR2(20 BYTE)
		USER_NO	NUMBER
		주문번호

	 * */
	
	public Order() {}


	
	public Order(int order_no, Date order_date, Date rel_date, Date receipte_date, String address, String phone,
			String payment, String delivery, String delivery_number, int user_no, List<OrderDetail> orderDetail,
			int couponNo) {
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
		this.orderDetail = orderDetail;
		this.couponNo = couponNo;
	}



	public Order(int order_no, Date order_date, Date rel_date, Date receipte_date, String address, String phone,
			String payment, String delivery, String delivery_number, int user_no, List<OrderDetail> orderDetail) {
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
		this.orderDetail = orderDetail;
	}



	public Order(int order_no, Date order_date, Date rel_date, Date receipte_date, String address, String phone,
			String payment, String delivery, String delivery_number, int user_no) {
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
	}


	public List<OrderDetail> getOrderDetail() {
		return orderDetail;
	}



	public int getCouponNo() {
		return couponNo;
	}



	public void setCouponNo(int couponNo) {
		this.couponNo = couponNo;
	}



	public void setOrderDetail(List<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
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


	public String getDelivery_number() {
		return delivery_number;
	}


	public void setDelivery_number(String delivery_number) {
		this.delivery_number = delivery_number;
	}


	public int getUser_no() {
		return user_no;
	}


	public void setUser_no(int user_no) {
		this.user_no = user_no;
	}



	@Override
	public String toString() {
		return "Order [order_no=" + order_no + ", order_date=" + order_date + ", rel_date=" + rel_date
				+ ", receipte_date=" + receipte_date + ", address=" + address + ", phone=" + phone + ", payment="
				+ payment + ", delivery=" + delivery + ", delivery_number=" + delivery_number + ", user_no=" + user_no
				+ ", orderDetail=" + orderDetail + ", couponNo=" + couponNo + "]";
	}




	
	
	
}
