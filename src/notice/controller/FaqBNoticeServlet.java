package notice.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.FaqService;
import notice.model.vo.Fcategory;

/**
 * Servlet implementation class FaqBNoticeServlet
 */
@WebServlet("/faqB")
public class FaqBNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqBNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// page : 현재 요청 페이지
		int page = 1;
		
		// 하지만 페이지 전환 시 view 화면에서 전달 받은 현재 페이지가 있을 경우 해당 페이지를 page로 적용
		// page가 어디서 넘어올까...? view 화면에서 없는뎅...9ㅅ9
		// => 페이지 클릭한거 들고온닷
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 검색기능은 없으니 뛰어넘기
		// 페이징과 관련 된 데이터, 조회된 faqList를 map에 담아 리턴
		Map<String, Object> map = new FaqService().selectList(page);
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("faqList", map.get("faqList"));
		
		
		// 카테고리 가져오기
		List<Fcategory> fcate = new ArrayList<>();
		
		fcate = new FaqService().selectCateList();
		//System.out.println(fcate);
		request.setAttribute("fcate", fcate);		
		
		// 취소/교환/반품
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/faqBNoticeView.jsp");
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
