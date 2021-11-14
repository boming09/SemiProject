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

import org.json.simple.JSONObject;

import notice.model.service.FaqService;
import notice.model.vo.Faq;
import notice.model.vo.Fcategory;

/**
 * Servlet implementation class FaqNoticeServlet
 */
@WebServlet("/faq")
public class FaqNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqNoticeServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 카테고리 가져오기
		List<Fcategory> fcate = new ArrayList<>();
		fcate = new FaqService().selectCateList();
		request.setAttribute("fcate", fcate);
		
		// top3 가져오기
		List<Faq> topList = new FaqService().selectAlltopList();
		request.setAttribute("topList", topList);
		
		// total List 가져오기
		// faq => category_no 전부 
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Map<String, Object> map = new FaqService().selectAllList(page);
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("faqList", map.get("faqList"));
		
		// 고객센터 FAQ-주문/결제 클릭시 화면 페이지로 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/faqNoticeView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
