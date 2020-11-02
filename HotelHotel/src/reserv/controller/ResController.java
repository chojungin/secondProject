package reserv.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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

import reserv.reservDAO.ReservDAO;
import reserv.reservVO.ReservVO;

/**
 * Servlet implementation class ResController
 */
@WebServlet("/reservation/*")
public class ResController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ResController() {
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
		request.setCharacterEncoding("UTF-8");

		response.setCharacterEncoding("UTF-8");
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		System.out.println(request.getRequestURI());
		System.out.println(request.getContextPath());
		String c = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(c);
		String str = null;
		switch (c) {

		case "/reservation/RoomSearch.do":
			ReservDAO rsd1 = null;
			try {
				rsd1 = new ReservDAO();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			ArrayList<ReservVO> alist1 = null;

			try {

				String roomClass = request.getParameter("roomClass");
				String firstDay = request.getParameter("firstDate");
				String lastDay = request.getParameter("lastDate");
				System.out.println(roomClass + "aa");
				System.out.println(firstDay + "bb");
				System.out.println(lastDay + "cc");

				if (roomClass.equals("All")) {
					alist1 = rsd1.allRoom(firstDay, lastDay);
					System.out.println(alist1);

				} else {
					alist1 = rsd1.findRoom(firstDay, lastDay, roomClass);
					System.out.println(alist1);
				}
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			request.setAttribute("rn", request.getParameter("roomClass"));
			request.setAttribute("status", 1);
			request.setAttribute("alist1", alist1);
			request.setAttribute("date1", request.getParameter("firstDate"));
			request.setAttribute("date2", request.getParameter("lastDate"));
			str = "/index.jsp";
			break;

		// ------------------------------------------------------------

		case "/reservation/RoomSelect.do":
			ReservDAO rsd2 = null;
			System.out.println("abcde");

			ArrayList<ReservVO> alist2 = new ArrayList<ReservVO>();

			try {
				rsd2 = new ReservDAO();

				Map<String, Object> result = new HashMap<String, Object>();

				Map<String, Object> map = getParameterMap2(request);
				String room_pic = rsd2.insertImg(((String) map.get("lev")));
				String room_price = rsd2.roomPrice(((String) map.get("lev")));
				ReservVO rvo = new ReservVO();
				rvo.setRoom_lev((String) map.get("lev"));
				rvo.setRoom_pic(room_pic);
				rvo.setRoom_price(room_price);
				alist2.add(rvo);
				System.out.println(rvo + "-------------");
				System.out.println(map);
				System.out.println(room_price);

				/*
				 * if (map.get("lev2").equals("All")) { alist2 =
				 * rsd2.allRoom(map.get("first"),map.get("last")); System.out.println(alist2);
				 * 
				 * } else { alist2 =
				 * rsd2.findRoom(map.get("first"),map.get("last"),map.get("lev"));
				 * System.out.println(alist2); }
				 */

				result.put("room_lev", map.get("lev"));
				result.put("status", 2);
				System.out.println(map + "maaaaaaaaaaaaaaap");
				System.out.println(map.get("first"));
				System.out.println(map.get("lev"));
				System.out.println(map.get("last"));
				System.out.println(result);

				// JSONObject jso = convertMapToJson(result);
				// ---------------수정할부분--------------------------//

				request.setAttribute("status", 2);
				request.setAttribute("date1", map.get("first"));
				request.setAttribute("date2", map.get("last"));
				request.setAttribute("room_lev", map.get("lev"));
				request.setAttribute("alist1", alist2);
//				request.setAttribute("option", alist2.get("option"));
//				

				// request.setAttribute("result", jso);
				// request.setAttribute("alist2", alist2);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			/* request.setAttribute("rn", request.getParameter("roomClass")); */

			str = "/index.jsp";
			break;

		case "/reservation/selectOption.do":

			ReservDAO rsd3;

			try {
				rsd3 = new ReservDAO();
				ReservVO rvo = new ReservVO();
				System.out.println("dddd");
				ArrayList<ReservVO> alist3 = new ArrayList<ReservVO>();
				Map<String, Object> map = getParameterMap2(request);
				System.out.println(map);

				/*
				 * pstmt.setString(1, rev_no); pstmt.setString(2, user_id);
				 * pstmt.setInt(3,user_status); pstmt.setString(4, room_no); pstmt.setString(5,
				 * in_date); pstmt.setString(6, out_date); pstmt.setDate(7, rev_date);
				 */

				String room_no = rsd3.selectRoomNo(map.get("first"), map.get("last"), (String) map.get("lev"));
				System.out.println(room_no);
				
				String insert_rev = rsd3.InsertRev(map.get("id"), room_no, map.get("first"), map.get("last"));
				System.out.println(rsd3.selectRevNo());
				
				
				
				
				
				if (map.get("option1") != null) {
					rsd3.insertOption((String)map.get("option1"));
					
				}
				if (map.get("option2") != null) {
					rsd3.insertOption((String)map.get("option2"));
					

				}
				if (map.get("option3") != null) {
					rsd3.insertOption((String)map.get("option3"));
					
				}
				if (map.get("option4") != null) {
					rsd3.insertOption((String)map.get("option4"));
					
				}
				if (map.get("option5") != null) {
					rsd3.insertOption((String)map.get("option5"));
					
				}
				String room_price = rsd3.roomPrice(((String) map.get("lev")));
				String fday = (String)map.get("first");
				String lday = (String)map.get("last");
				  SimpleDateFormat format = new SimpleDateFormat("yyyy-mm-dd");
			        // date1, date2 두 날짜를 parse()를 통해 Date형으로 변환.
			        Date FirstDate = format.parse(fday);
			        Date SecondDate = format.parse(lday);
			        System.out.println(FirstDate);
			        System.out.println(SecondDate);
			        
			        // Date로 변환된 두 날짜를 계산한 뒤 그 리턴값으로 long type 변수를 초기화 하고 있다.
			        // 연산결과 -950400000. long type 으로 return 된다.
			        long calDate = FirstDate.getTime() - SecondDate.getTime(); 
			        
			        // Date.getTime() 은 해당날짜를 기준으로1970년 00:00:00 부터 몇 초가 흘렀는지를 반환해준다. 
			        // 이제 24*60*60*1000(각 시간값에 따른 차이점) 을 나눠주면 일수가 나온다.
			        long calDateDays = calDate / ( 24*60*60*1000); 
			 
			        calDateDays = Math.abs(calDateDays);
			        
			        System.out.println("두 날짜의 날짜 차이: "+calDateDays);
				
				
			
				int real_price = (int) (Integer.parseInt(room_price)*calDateDays);
				System.out.println(real_price+"real");
				int opPrice = rsd3.opPrice(rsd3.selectRevNo());
				
				int totalPrice = real_price+ opPrice; 
				System.out.println(room_price);
				
				rvo.setRoom_price(room_price);
				System.out.println(totalPrice);
			
				alist3.add(rvo);
				request.setAttribute("id", map.get("id"));
				request.setAttribute("total", totalPrice);
				request.setAttribute("date1", map.get("first"));
				request.setAttribute("date2", map.get("last"));
				request.setAttribute("room_lev", map.get("lev"));
				request.setAttribute("alist1", alist3);

				request.setAttribute("op1", map.get("option1"));
				request.setAttribute("op2", map.get("option2"));
				request.setAttribute("op3", map.get("option3"));
				request.setAttribute("op4", map.get("option4"));
				request.setAttribute("op5", map.get("option5"));
				

				
			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			str = "/Reservation/PayRoom.jsp";
			break;

		// -------------------------------------------------------------------------------------------

		}
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);

	}

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
