package notice.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.CommuService;
import notice.model.vo.Commu;

/**
 * Servlet implementation class CommuDetailServlet
 */
@WebServlet("/commu/detail")
public class CommuDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommuDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int commu_no = Integer.parseInt(request.getParameter("commu_no"));
		//System.out.println(commu_no);
		
		Commu commu = new CommuService().selectCommu(commu_no);
		//System.out.println(commu);
		
		if(commu != null) {
			// 소통게시판 게시글 디테일 페이지 이동
			request.setAttribute("commu", commu);
			request.getRequestDispatcher("/WEB-INF/views/notice/commuDetailView.jsp").forward(request, response);
		} else {
			request.getSession().setAttribute("massage", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/notice/csPageView.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

}
