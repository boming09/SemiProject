package mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import mypage.model.service.MyreviewService;
import mypage.model.vo.Myreview;

/**
 * Servlet implementation class MyreviewUpdateServlet
 */
@WebServlet("/myreview/update")
public class MyreviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyreviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mid = Integer.parseInt(request.getParameter("mid"));
		int category_id = Integer.parseInt(request.getParameter("category"));
		String mtitle = request.getParameter("title");
		String mcontent = request.getParameter("content");
		
				
		Myreview myreview = new Myreview();
		myreview.setMid(mid);
		myreview.setCategory_id(category_id);
		myreview.setMtitle(mtitle);
		myreview.setMcontent(mcontent);
		
		int result = new MyreviewService().updateMyreview(myreview);
		
		if(result > 0) {	
			request.getSession().setAttribute("message", "게시글 수정이 완료 되었습니다.");
			response.sendRedirect(request.getContextPath() + "/mypagemyreviewdetail?mid=" + mid);
		} else {		
			request.setAttribute("message", "게시글 수정에 실패하였습니다.");
			request.getRequestDispatcher("/WEB-INF/views/member/errorpage.jsp").forward(request, response);
		}
		
	}

}
