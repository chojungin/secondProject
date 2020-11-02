package room.roomController;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import room.roomDAO.RoomDAO;
import room.roomVO.RoomVO;

/**
 * Servlet implementation class RoomController
 */
//@WebServlet("/RoomController")
@WebServlet("/room/*")
public class RoomController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RoomController() {
		 super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		// System.out.println(request.getRequestURI());
		// System.out.println(request.getContextPath());

		String c = request.getRequestURI().substring(request.getContextPath().length());
		String str = null;

		switch (c) {
		case "/room/RoomSelectAll.do": // 객실 전체보기
			RoomDAO rdao1 = null;
			ArrayList<RoomVO> roomlist = null;
			
			try {
				rdao1 = new RoomDAO();
				roomlist = rdao1.getAllRoomList();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("roomlist", roomlist);
			str = "/Room/RoomSelectAll.jsp";

			break;

		case "/room/RoomSelectOne.do": // 선택한 객실

			String room_no = request.getParameter("room_no");
			RoomDAO rdao2 = null;

			Map<String, Object> roominfo = new HashMap<>();

			try {
				rdao2 = new RoomDAO();
				roominfo = rdao2.getOneRoomInfo(room_no);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			
			JSONObject jsonObj = convertMapToJson(roominfo);

			request.setAttribute("result", jsonObj);
			str = "/Room/ajaxParam.jsp";

			break;
			
		case "/room/RoomSort.do" : // 검색정렬
			str = "/Room/RoomSelectAll.jsp";
			Map<String, Object> param = getParameterMap2(request);
			ArrayList<RoomVO> result = new ArrayList<RoomVO>();
			System.out.println(param);
			Map<String, Object> roomsort = null;
			
			RoomDAO rdao3 = null;
			
			try {
				rdao3 = new RoomDAO();
				result = rdao3.RoomRequireSort(param);
				request.setAttribute("roomlist", result);
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			break;
		}
		
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		System.out.println(str);
		rd1.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	
	//JSON
	@SuppressWarnings({ "unchecked" })
	public static JSONObject convertMapToJson(Map<String, Object> map) {

		JSONObject json = new JSONObject();

		for (Map.Entry<String, Object> entry : map.entrySet()) {

			String key = entry.getKey();
			Object value = entry.getValue();
			// json.addProperty(key, value);
			json.put(key, value);

		}
		return json;
	}
	protected Map<String, Object> getParameterMap2(HttpServletRequest req) {
		Map<String, Object> map = new HashMap();

		Enumeration enm = req.getParameterNames();

		String name = null;
		String value = null;
		String[] arr = null;

		while (enm.hasMoreElements()) {
			name = (String) enm.nextElement();
			arr = req.getParameterValues(name);

			if (name.startsWith("arr")) {
				map.put(name, arr);
			} else {
				if (arr != null && arr.length > 0) {
					value = arr[0];
				} else {
					value = req.getParameter(name);
				}

				map.put(name, value);
			}
		}

		return map;
	}
}
