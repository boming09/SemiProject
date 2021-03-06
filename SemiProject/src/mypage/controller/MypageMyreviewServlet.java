package mypage.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import book.model.vo.Search;
import mypage.model.service.B_ReviewService;
import mypage.model.service.MyreviewService;


/**
 * Servlet implementation class MypageMyreviewServlet
 */
@WebServlet("/mypagemyreview")
public class MypageMyreviewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMyreviewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 마이페이지 에서 마이리뷰 클릭 시 마이리뷰로 단순 이동
		/*RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/mypage/mypage-myreview.jsp");
		view.forward(request, response);
		*/
		int user_no = 0;
		if(request.getParameter("user_no") != null) {
			user_no = Integer.parseInt(request.getParameter("user_no"));
		}
		
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		String searchCondition = request.getParameter("searchCondition");
		String searchValue = request.getParameter("searchValue");
		
		Map<String, Object> map 
		= new B_ReviewService().selectList(page, new Search(searchCondition, searchValue));
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("b_reviewList", map.get("b_reviewList"));
		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/mypage/mypage-myreview.jsp");
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
