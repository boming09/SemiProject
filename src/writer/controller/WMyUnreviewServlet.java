package writer.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import writer.model.service.WriterService;

/**
 * Servlet implementation class WMyUnreviewServlet
 */
@WebServlet("/w-unreview")
public class WMyUnreviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WMyUnreviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 도서 리뷰 가져오기
		// 회원번호 필요
		int user_no = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		// page : 현재 요청 페이지
		int page = 1;
		// 하지만 페이지 전환 시 view 화면에서 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 리뷰 리스트 여러개니깐 객체 생성
		Map<String, Object> map = new WriterService().selectReviewList(page, user_no);
		
		String forpage = ""; 	
    	if(map.get("reviewList") != null) {
    		request.setAttribute("pi", map.get("pi"));
        	request.setAttribute("reviewList", map.get("reviewList"));
        	
        	forpage = "/WEB-INF/views/writer/wMyUnreviewListView.jsp";
    	} else {
    		forpage = "/WEB-INF/views/writer/wMyPageView.jsp";
    	}
    	
    	//System.out.println(map.get("reviewList"));
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
