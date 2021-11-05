package notice.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.vo.Member;
import notice.model.service.CommuService;
import notice.model.vo.Commu;

/**
 * Servlet implementation class CommuInsertServlet
 */
@WebServlet("/commu/insert")
public class CommuInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CommuInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 작가 리스트 보내기(글작성시 작가 검색기능 있음)
		List<Member> writerList = new CommuService().getWriterList();
		
		//System.out.println(memberList);
		
		request.setAttribute("writerList", writerList);
		
		// 카테고리 작가소통게시판 클릭시 소통게시판 페이지로 단순 이동
		RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/notice/commuInsertView.jsp");
		view.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// ((Member)request.getSession().getAttribute("loginUser")).getUserId();
		int cuser = 44;  // 작성자 
		
		// 선택한 작가 회원번호 들고오기
		int cwriter = Integer.parseInt(request.getParameter("writer"));
		String ctitle = request.getParameter("title");
		String ccontent = request.getParameter("content");
		
		//System.out.println(cwriter);
		//System.out.println(ctitle);
		//System.out.println(ccontent);
		
		Commu commu = new Commu();
		commu.setUser_no(cuser);
		commu.setCwriter_no(cwriter);
		commu.setCtitle(ctitle);
		commu.setCcontent(ccontent);
		
		int result = new CommuService().insertCommu(commu);
		//System.out.println(result);
		
		if(result > 0) {
			request.getSession().setAttribute("msg", "게시글 작성 완료!!");
			response.sendRedirect(request.getContextPath() + "/commu");
		} else {
			request.getSession().setAttribute("msg", "게시글 작성 실패9ㅅ9");
			request.getRequestDispatcher("/WEB-INF/views/notice/commuInsertView.jsp").forward(request, response);
		}
		
	}
	
}
