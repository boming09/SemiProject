package order.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import order.model.service.CartService;
import order.model.vo.Order;
import order.model.vo.OrderDetail;
import order.model.vo.OrderDirect;

/**
 * Servlet implementation class paymentServlet
 */
@WebServlet("/payment")
public class paymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public paymentServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/order/payment.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//주소랑 사용자 정보 추출(새로 입력했을 수 있으니...)
		String orderName = request.getParameter("order_name");
		String receiveNm = request.getParameter("receive_name");
		String postCode = request.getParameter("address1"); //세줄인디
		String address1 = request.getParameter("address2");
		String address2 = request.getParameter("address3");
		//String address = address1.concat(address2);
		
		String phone = request.getParameter("phone");
		String tel = request.getParameter("tel"); //안넣으면 null인디..어드레스 1,2,3 하거나 배열에 넣거나
		String delLoca = request.getParameter("delLoca");
		String enterDoor = request.getParameter("enter_door");
		String enterPass = request.getParameter("enter_pass");
		String email = request.getParameter("email"); //이메일 없을 경우 처리해야됨(함)
		
		int userNo = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		//결제수단
		//String pay = request.getParameter("pay"); //아니 페이는 다음 서블릿에서 해야지
	     /* amount : '1',
	        buyer_email : '구매자 이메일',
	        buyer_name : '구매자 이름',
	        buyer_tel : '구매자 번호',
	        buyer_addr : '구매자 주소',
	        buyer_postcode : '구매자 주소',*/
		
		String address ="";
		if(address1 != null) {
			
			address = address1.concat(address2);
		}
		
		Order order = new Order();
		order.setAddress(address);
		order.setPhone(phone);
		order.setUser_no(userNo);
		//포스트 코드 넣을까말까
		
		
		HttpSession session = request.getSession();
		session.setAttribute("orderName", orderName);
		session.setAttribute("orderPhone", phone);
		session.setAttribute("orderAddr", address); //주소 두개 합친거
		session.setAttribute("postCode", postCode);
		session.setAttribute("orderEmail", email);
		//session.setAttribute("pay", pay);
		

		
		//System.out.println(postCode);
		// 책번호랑 가격 수량 추출
		String [] book_id = request.getParameterValues("book_id");
		String [] sale_price = request.getParameterValues("sale_price");
		String [] amount = request.getParameterValues("amount");
		String [] cart_no = request.getParameterValues("cart_no");
		
		int [] bookId = new int[book_id.length];
		int [] salePrice = new int[sale_price.length];
		int [] amounts = new int[amount.length]; //수량은 안보내도
		int [] cartNo = new int[cart_no.length]; // 이건 필요한가? 주문완료후에 삭제하려면 필요할지도
		
		// 정수처리
		for(int i=0; i<bookId.length; i++) {
			
			bookId[i] = Integer.parseInt(book_id[i]);
			salePrice[i] = Integer.parseInt(sale_price[i]);
			amounts[i] = Integer.parseInt(amount[i]);
			cartNo[i] = Integer.parseInt(cart_no[i]);
			
		}
		
		// 오더 디테일에 북아이디 + 오더넘버 + 수량 각각 묶어서 넣고싶은디......
	/*	OrderDetail ot = new OrderDetail();  //리스트에 넣어야할까...
		//[bookId[0],salePrice[0],amounts[0]] 이런식으로*/

		List<OrderDetail> orderDt = new ArrayList<>();
		for(int i=0; i<bookId.length; i++) {
			
			orderDt.add(new OrderDetail(bookId[i],amounts[i])); //생성자 새로
		}
		//System.out.println(orderDt);
		
		
		order.setOrderDetail(orderDt);		
		//세션에 주문정보(오더디테일 포함) 저장
		session.setAttribute("order", order);

		
		//session.setAttribute("orderDt", orderDt); //세션에 저장하는게 맞나???
		request.setAttribute("orderDt", orderDt);
		
		//얘네를 보내서 오더디테일에 인서트 해야되는데 물건은 여러개인데 같은 주문 번호를 어떻게 부여하지?
		//int result = new CartService().insertOrderDetail(orderDt);
		//System.out.println(result);
				
				
		
		
		
		// 가격 계산
		int sum = 0;
		for(int i = 0; i < bookId.length; i++) {
			sum += amounts[i] * salePrice[i];
		}
		//System.out.println(sum);
		
		// 수량 계산
		int tamount = 0;
		for(int i = 0; i < bookId.length; i++) {
			tamount += amounts[i];
		}
		//System.out.println(tamount);
		
		// 총가격과 수량 보내기
		OrderDirect od = new OrderDirect();
		od.setAmount(tamount);
		od.setSale_price(sum);
		
		request.setAttribute("od", od);
		
		//request.setAttribute("orderName", orderName); 되자너 주소정보 세션에 저장해서 쓰자
		
		request.getRequestDispatcher("/WEB-INF/views/order/payment.jsp").forward(request, response);
	}

}
