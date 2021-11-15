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
import notice.model.vo.Commu;

/**
 * Servlet implementation class CommuServlet
 */
@WebServlet("/commu")
public class CommuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 소통게시판 리스트 가져와서 뷰로 넘기기
		
		// 내가 쓴 글 체크시
		int user_no = 0;
		if(request.getParameter("user_no") != null) {
			user_no = Integer.parseInt(request.getParameter("user_no"));
			//System.out.println(user_no);
		}
		
		// page : 현재 요청 페이지
		int page = 1;
		
		// 하지만 페이지 전환 시 view 화면에서 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		// => 페이지 클릭한거 들고온닷
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Map<String, Object> map = new CommuService().selectList(page, user_no);
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("commuList", map.get("commuList"));
		
		// 카테고리 작가소통게시판 클릭시 소통게시판 페이지로 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/commuView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
