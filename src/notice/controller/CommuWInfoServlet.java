package notice.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.CommuService;

/**
 * Servlet implementation class CommuWInfoServlet
 */
@WebServlet("/commu/w-info")
public class CommuWInfoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommuWInfoServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작가 리스트 가져오기
		// page : 현재 요청 페이지
		int page = 1;
		
		// 하지만 페이지 전환 시 view 화면에서 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		// => 페이지 클릭한거 들고온닷
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 작가 검색 파라미터 추출
		String w_name = request.getParameter("w_name");
		//System.out.println(w_name);
		
		Map<String, Object> map = new CommuService().selectWriterList(page, w_name);
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("writerList", map.get("writerList"));
		
		
		// 작가 소개 페이지 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/commuWInfoView.jsp");
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
