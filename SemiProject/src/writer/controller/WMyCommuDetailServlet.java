package writer.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import notice.model.service.CommuService;
import notice.model.vo.Commu;

/**
 * Servlet implementation class WMyCommuDetailServlet
 */
@WebServlet("/w-commu/detail")
public class WMyCommuDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WMyCommuDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 고객센터-소통게시판 디테일 재활용(정보 갖고가기)
		int commu_no = Integer.parseInt(request.getParameter("commu_no"));
				
		Commu commu = new CommuService().selectCommu(commu_no);
		
		request.setAttribute("commu", commu);
		
		// 작가소통게시판 게시글 상세 페이지
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/writer/wMyCommuDetailView.jsp");
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
