package order.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class payingServlet
 */
@WebServlet("/order/paying")
public class payingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public payingServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//여기서 결제수단 저장해야한다

		String pay = request.getParameter("pay");
		HttpSession session = request.getSession();
		session.setAttribute("pay", pay);
		
		//쿠폰 저장  쿠폰이 없을때 처리
		/*String coupon_no = request.getParameter("coupon_no");
		if(coupon_no != null) {			
			session.setAttribute("coupon_no", coupon_no);
		}*/
		
		// 
		/*String coupon_no;
		if(request.getParameter("coupon_no") != null ) {
			coupon_no = request.getParameter("coupon_no");
			//Integer.parseInt(coupon_no);
			session.setAttribute("coupon_no", coupon_no);
		} else {
			coupon_no="none";
			session.setAttribute("coupon_no", coupon_no);
		}*/
	
		String coupon_no = request.getParameter("coupon_no");
		if(coupon_no == null || coupon_no.trim().equals("")){
			coupon_no = "0";
		}

		session.setAttribute("coupon_no", coupon_no);
	
		
		/*int coupon_no = 0;
		if(request.getParameter("coupon_no") != null) {
		coupon_no = Integer.parseInt(request.getParameter("coupon_no"));
		//Integer.parseInt(coupon_no);
		session.setAttribute("coupon_no", coupon_no);
		} */
	
		
		
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/order/paying.jsp"); //여기
		view.forward(request, response);
	
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
