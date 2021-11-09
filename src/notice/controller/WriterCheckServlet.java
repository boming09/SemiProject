package notice.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.CommuService;
import notice.model.service.WCheckService;
import notice.model.vo.WCheck;

/**
 * Servlet implementation class WriterCheckServlet
 */
@WebServlet("/w-check")
public class WriterCheckServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriterCheckServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작가인증게시판 리스트 가져오기
		
		// 내가 쓴 글 체크시
		int user_no = 0;
		if(request.getParameter("user_no") != null) {
			user_no = Integer.parseInt(request.getParameter("user_no"));
			//System.out.println(user_no);
		}
		
		// page : 현재 요청 페이지
		int page = 1;
		// 하지만 페이지 전환 시 view 화면에서 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Map<String, Object> map = new WCheckService().selectList(page, user_no);	
		
		request.setAttribute("wcheckList", map.get("wcheckList"));
		request.setAttribute("pi", map.get("pi"));
		
		// 카테고리 작가 인증게시판 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/writerCheckView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
