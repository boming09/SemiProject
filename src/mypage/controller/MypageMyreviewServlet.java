package mypage.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Map<String, Object> map = new MyreviewService().selectList(page);
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("myreviewList", map.get("myreviewList"));
		
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
