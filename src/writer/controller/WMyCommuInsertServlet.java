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
 * Servlet implementation class WMyCommuInsertServlet
 */
@WebServlet("/w-commu/insert")
public class WMyCommuInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WMyCommuInsertServlet() {
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
		
		// 작가소통게시판 게시글 답변상세 페이지
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/writer/wMyCommuInsertView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 번호 + 답변 가져오기
		int commu_no = Integer.parseInt(request.getParameter("commu_no"));
		String reply = request.getParameter("reply");
		//System.out.println(reply);
		
		int result = new CommuService().updateWCommu(commu_no, reply);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "답변 등록이 완료되었습니다.");
			response.sendRedirect(request.getContextPath() + "/w-commu");
		} else {
			request.getSession().setAttribute("msg", "실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/writer/wMyPageView.jsp").forward(request, response);
		}
	
	}

}
