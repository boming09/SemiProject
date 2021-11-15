package writer.controller;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import notice.model.service.CommuService;

/**
 * Servlet implementation class WMyCommuServlet
 */
@WebServlet("/w-commu")
public class WMyCommuServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WMyCommuServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		// 나에게 온 소통 게시글 가져오기(리스트=페이징처리)
		// 로그인 작가 회원번호 가져오기
		int writer = ((Member)request.getSession().getAttribute("loginUser")).getUserNo();
		
		int page = 1;
		if(request.getParameter("page") != null) {
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		Map<String, Object> map = new CommuService().selectWCommuList(page, writer);
		
		// 미답변 게시글 내역 없을경우 => wMyCommuNoneView.jsp
		// 내역 있을경우 => wMyCommuView.jsp
		String forpage = "";
		
		if(map.get("wCommuList") != null) {
			request.setAttribute("pi", map.get("pi"));
			request.setAttribute("wCommuList", map.get("wCommuList"));
			
			forpage = "/WEB-INF/views/writer/wMyCommuView.jsp";
		} else {
			forpage = "/WEB-INF/views/writer/wMyCommuNoneView.jsp";
		}
		
		request.getRequestDispatcher(forpage).forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
