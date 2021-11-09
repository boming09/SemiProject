package notice.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.FaqService;
import notice.model.vo.Faq;

/**
 * Servlet implementation class FaqNoticeInsertServlet
 */
@WebServlet("/faq/insert")
public class FaqNoticeInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FaqNoticeInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// insert 페이지 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/faqNoticeInsertView.jsp");
		view.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 값 가져오기
		// 카테고리
		//int cate_no = Integer.parseInt(request.getParameter("atype"));
		int ref_no = Integer.parseInt(request.getParameter("btype"));
		String title = request.getParameter("title");
		String reply = request.getParameter("reply");
		
		//System.out.println(cate);
		//System.out.println(ref);
		//System.out.println(question);
		//System.out.println(answer);
		
		Faq faq = new Faq();
		//faq.setFcategory_no(cate_no);
		faq.setFref_no(ref_no);
		faq.setTitle(title);
		faq.setReply(reply);
		
		int result = new FaqService().insertFaq(faq);
		
		//System.out.println(result);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "게시글이 등록 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/faqA");
		} else {
			request.getSession().setAttribute("msg", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/notice/csPageView.jsp").forward(request, response);
		}
		
		
		
	}

}
