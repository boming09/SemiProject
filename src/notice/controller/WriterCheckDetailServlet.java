package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.WCheckService;
import notice.model.vo.WCheck;

/**
 * Servlet implementation class WriterCheckDetailServlet
 */
@WebServlet("/w-check/detail")
public class WriterCheckDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WriterCheckDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 몇번 게시글인지 가져오기
		int wck_no = Integer.parseInt(request.getParameter("wck_no"));
		//System.out.println(wck_no);
		
		WCheck wcheck = new WCheckService().selectWCheck(wck_no);
		
		//System.out.println(wcheck);
		
		if(wcheck != null) {
			request.setAttribute("wcheck", wcheck);
			// 작가인증게시판 상세페이지 이동
			request.getRequestDispatcher("/WEB-INF/views/notice/writerCheckDetailView.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("msg", "실패^^");
			request.getRequestDispatcher("/WEB-INF/views/notice/csPageView.jsp").forward(request, response);
		}
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
