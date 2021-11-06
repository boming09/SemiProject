package notice.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import notice.model.service.OneService;


/**
 * Servlet implementation class OneQuestionServlet
 */
@WebServlet("/one")
public class OneQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1:1문의 내역있을시 리스트 가져오기 => 로그인한 유저만
		
		// 로그인 유저 가져오기
		int ouser = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		//int ouser = 2;
		
		// 1. 페이징 처리
		int page = 1;
		
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Map<String, Object> map = new OneService().selectList(ouser, page);
				
		// 만약 1:1문의 내역 없을경우 => oneQuestionView.jsp
		// 내역 있을경우 => oneQuestionViewList.jsp
		String forpage = "";
				
		if(map.get("oneList") != null) { 
			// 1:1문의 있을때 리스트 화면 이동 
			request.setAttribute("pi", map.get("pi"));
			request.setAttribute("oneList", map.get("oneList"));
			
			forpage = "/WEB-INF/views/notice/oneQuestionListView.jsp";
			
		} else {
			//1:1문의 없을때 보이는 화면 이동
			forpage = "/WEB-INF/views/notice/oneQuestionView.jsp";
		}
		request.getRequestDispatcher(forpage).forward(request, response);
		 
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
