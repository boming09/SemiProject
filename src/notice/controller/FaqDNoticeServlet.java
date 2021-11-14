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
 * Servlet implementation class FaqDNoticeServlet
 */
@WebServlet("/faqD")
public class FaqDNoticeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqDNoticeServlet() {
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
		int cate_no = Integer.parseInt(request.getParameter("btype"));
		List<Faq> topList = null;
		if(cate_no == 0) {
			topList = new FaqService().selectDAlltopList();
		} else {
			topList = new FaqService().selectDtopList(cate_no);
		}
		request.setAttribute("topList", topList);
		
		// total List 가져오기
		// faqD => category_no = 14 인거 = 안변함 
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Map<String, Object> map = new FaqService().selectDList(page);
		
		request.setAttribute("pi", map.get("pi"));
		request.setAttribute("faqList", map.get("faqList"));

		
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/faqDNoticeView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
