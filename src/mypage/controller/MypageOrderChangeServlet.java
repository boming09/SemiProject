package mypage.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import mypage.model.service.MyOrderService;

/**
 * Servlet implementation class MypageOrderChangeServlet
 */
@WebServlet("/myorder/change")
public class MypageOrderChangeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrderChangeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 주문취소/교환/반품 내역 가져가기
    	
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
    	Map<String, Object> map =new MyOrderService().selectOrderChangeList(page, user_no);
    	
    	String forpage = ""; 	
    	if(map.get("orderList") != null) {
    		request.setAttribute("pi", map.get("pi"));
        	request.setAttribute("changeList", map.get("changeList"));
        	
        	forpage = "/WEB-INF/views/mypage/mypage-orderChange.jsp";
    	} else {
    		forpage = "/WEB-INF/views/mypage/mypage-orderChangeNone.jsp";
    	}
    	request.getRequestDispatcher(forpage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
