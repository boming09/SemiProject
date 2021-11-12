package mypage.controller;

import java.io.IOException;
import java.util.List;

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
 * Servlet implementation class MypageOrchcaServlet
 */
@WebServlet("/mypageorchca")
public class MypageOrchcaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageOrchcaServlet() {
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
    	
    	// 유저정보 가져오기
    	int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
    	//System.out.println(user_no);
    	List<MyOrder> orderList = new MyOrderService().selectMyOrderList(user_no);
    	//System.out.println(orderList);
    	request.setAttribute("orderList", orderList);
    	
    	// 마이페이지의 주문/변경/취소 클릭 시 주문/변경/취소로 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/mypage/mypage-orchca.jsp");
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
