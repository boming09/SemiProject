package mypage.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import mypage.model.service.MyOrderService;
import mypage.model.vo.MyOrder;

/**
 * Servlet implementation class MypageOrderServlet
 */
@WebServlet("/myorder")
public class MypageOrderServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrderServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 오더 주문 가져오기
    	// 주문 조회/주문 취소(= delevery가 배송중이면 못함/배송전이면 주문 취소 요청) or 컬럼 한개 추가??
    	// 반품/교환 신청 내역 = 배송완료 후 => 버튼 만들어서 delevery 반품/교환 변경 or 컬럼 한개 추가???
    	
    	// page : 현재 요청 페이지
		int page = 1;
		// 하지만 페이지 전환 시 view 화면에서 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
    	
    	// 유저정보 가져오기
    	int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
    	//System.out.println(user_no);
    	//List<MyOrder> orderList = new MyOrderService().selectMyOrderList(user_no);
    	Map<String, Object> map =new MyOrderService().selectMyOrderList(page, user_no);
    	
    	String forpage = ""; 	
    	if(map.get("orderList") != null) {
    		request.setAttribute("pi", map.get("pi"));
        	request.setAttribute("orderList", map.get("orderList"));
        	
        	forpage = "/WEB-INF/views/mypage/mypage-order.jsp";
    	} else {
    		forpage = "/WEB-INF/views/mypage/mypage-orderNone.jsp";
    	}
    	
    	request.getRequestDispatcher(forpage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
