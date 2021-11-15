package order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.model.vo.Member;
import order.model.vo.Order;
import order.model.vo.OrderDirect;

/**
 * Servlet implementation class directPayServlet
 */
@WebServlet("/dpayment")
public class directPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public directPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
		
		//쿠폰
		//int couponNo =  Integer.parseInt(request.getParameter("couponNo"));
		//int couponDis = Integer.parseInt(request.getParameter("couponDis"));
		//int cpNo = Integer.parseInt(request.getParameter("cp_no"));
		//int cpDis = Integer.parseInt(request.getParameter("cp_dis"));
		
		
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
		
		
		HttpSession session = request.getSession();
		session.setAttribute("orderName", orderName);
		session.setAttribute("orderPhone", phone);
		session.setAttribute("orderAddr", address); //주소 두개 합친거
		session.setAttribute("postCode", postCode);
		session.setAttribute("orderEmail", email);
		
		// 책번호랑 가격 수량 추출
		int book_id = Integer.parseInt(request.getParameter("book_id"));
		int book_amt = Integer.parseInt(request.getParameter("book_amt"));
		int book_pri = Integer.parseInt(request.getParameter("book_pri"));
		
		//수량 여러개일 경우
		int sum = book_pri * book_amt;
		
		OrderDirect odr = new OrderDirect();
		odr.setBook_id(book_id);
		odr.setAmount(book_amt);
		odr.setSale_price(sum);
		
		request.setAttribute("odr", odr);
		request.getRequestDispatcher("/WEB-INF/views/order/dpayment.jsp").forward(request, response);
		
		
		
	}

}
