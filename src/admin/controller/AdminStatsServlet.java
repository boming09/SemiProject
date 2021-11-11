package admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import admin.model.service.ChartService;
import admin.model.vo.AreaList;

/**
 * Servlet implementation class AdminStatsServlet
 */
@WebServlet("/admin/stats")
public class AdminStatsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStatsServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		AreaList areaList = new AreaList();
		int seoul = new ChartService().seoulSelect();
		int incheon = new ChartService().incheonSelect();
		int gyeonggi = new ChartService().gyeonggiSelect();
		int gangwon = new ChartService().gangwonSelect();
		int gyeongsang = new ChartService().gyeongsangSelect();
		int chungcheong = new ChartService().chungcheongSelect();
		int jeolla = new ChartService().jeollaSelect();
		int jeju = new ChartService().jejuSelect();
		areaList.setSeoul(seoul);
		areaList.setIncheon(incheon);
		areaList.setGyeonggi(gyeonggi);
		areaList.setGangwon(gangwon);
		areaList.setGyeongsang(gyeongsang);
		areaList.setChungcheong(chungcheong);
		areaList.setJeolla(jeolla);
		areaList.setJeju(jeju);
		
		int man = new ChartService().manSelect();
		int man1 = new ChartService().man1Select();
		int man2 = new ChartService().man2Select();
		int man3 = new ChartService().man3Select();
		int man4 = new ChartService().man4Select();
		int man5 = new ChartService().man5Select();
		int man6 = new ChartService().man6Select();
		int woman = new ChartService().womanSelect();
		int woman1 = new ChartService().woman1Select();
		int woman2 = new ChartService().woman2Select();
		int woman3 = new ChartService().woman3Select();
		int woman4 = new ChartService().woman4Select();
		int woman5 = new ChartService().woman5Select();
		int woman6 = new ChartService().woman6Select();
		areaList.setMan(man);
		areaList.setMan1(man1);
		areaList.setMan2(man2);
		areaList.setMan3(man3);
		areaList.setMan4(man4);
		areaList.setMan5(man5);
		areaList.setMan6(man6);
		areaList.setWoman(woman);
		areaList.setWoman1(woman1);
		areaList.setWoman2(woman2);
		areaList.setWoman3(woman3);
		areaList.setWoman4(woman4);
		areaList.setWoman5(woman5);
		areaList.setWoman6(woman6);
		
		
		
		
		request.setAttribute("areaList", areaList);
		request.getRequestDispatcher("/WEB-INF/views/adminpage/adminStats.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
