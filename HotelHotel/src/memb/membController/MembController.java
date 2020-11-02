package memb.membController;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
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
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import memb.membDAO.MembDAO;
import memb.membVO.MembVO;

/**
 * Servlet implementation class MembServlet
 */
@WebServlet("/member/*")
public class MembController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MembController() {
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
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String c = request.getRequestURI().substring(request.getContextPath().length());
		System.out.println(c);

		String str = null;
		switch (c) {
		case "/member/loginCheck.do":

			String id = request.getParameter("lid");
			String pw = request.getParameter("lpw");
			try {
				MembDAO mdao = new MembDAO();
				int loginCheck = mdao.loginCheck(id, pw);
				int userStatus = mdao.userStatus(id);
				
				
				if (loginCheck == 1 && userStatus != 3) {
					
					
					
					
					HttpSession session = request.getSession();
					session.setAttribute("id", id);
					session.setAttribute("lvl", userStatus);
					str = "/index.jsp";
					// session.setAttribute("id", id);

				} else {
					str = "/Member/loginView.jsp";
				}

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			/*
			 * TelInfoDAO tidao1 = null;
			 * 
			 * 
			 * 
			 * 
			 * 
			 * 
			 * 
			 * try { tidao1 = new TelInfoDAO(); } catch (Exception e) { // TODO:
			 * handle exception } ArrayList<TelInfoVO> alist1 = null;
			 * 
			 * try { alist1 = tidao1.getAllInfo(); } catch (Exception e) { //
			 * TODO: handle exception }
			 */

			/*
			 * request.setAttribute("alist1", alist1); str = "getAllInfo.jsp";
			 * //이것만 실행을 위해 아래 주석을 풀고 실행해 본다
			 * System.out.println(alist1.get(0).getId());
			 */

			break;
		case "/member/myInfo.do":

			try {
				MembDAO mdao = new MembDAO();

				MembVO myInfo = new MembVO();
				myInfo = mdao.myInfo((String) request.getSession().getAttribute("id"));

				System.out.println(myInfo);

				request.setAttribute("id", myInfo.getUserId());
				request.setAttribute("name", myInfo.getUserName());
				request.setAttribute("tel", myInfo.getUserTel());
				request.setAttribute("nic", myInfo.getUserNic());
				/*
				 * if(loginCheck == 1){ HttpSession session =
				 * request.getSession(); str = "/index.jsp";
				 * //session.setAttribute("id", id);
				 * 
				 * }else{ str = "/Member/loginView.jsp"; }
				 */

			} catch (ClassNotFoundException | SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			str = "/Member/myInfoForm.jsp";

			break;
		case "/member/logout.do":
			str = "/index.jsp";
			HttpSession session = request.getSession();
			session.invalidate();

			break;
		case "/member/updateInfo.do":
			str = "/Member/memberNic.jsp";
			HashMap paramMap = getParameterMap(request);
			System.out.println(paramMap);
			// str = paramMap.toString();

			request.setAttribute("paramMap", paramMap);
			try {
				MembDAO mdao = new MembDAO();

				Map<String, Object> result = new HashMap();
				result.put("result", "" + mdao.updateInfo(paramMap));

				JSONObject jsonObj = convertMapToJson(result);
				System.out.println(jsonObj);
				request.setAttribute("paramMap", jsonObj);

			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			break;

		case "/member/nicCheck.do":
			str = "/Member/memberNic.jsp";

			// HashMap nic = getParameterMap(request);
			Map<String, Object> nic1 = getParameterMap(request);
			String nicLvl = (String) getParameterMap(request).get("lvl");
			String nic = (String) getParameterMap(request).get("nic");
			String id1 = (String) getParameterMap(request).get("id");
			System.out.println(nic);

			try {
				MembDAO mdao = new MembDAO();
				// int nicCheck = mdao.nicCheck(nic);
				Map<String, Object> nicCheck = new HashMap();
				nicCheck.put("nic", mdao.nicCheck(id1, nic, nicLvl));

				JSONObject jsonObj = convertMapToJson(nicCheck);
				System.out.println(jsonObj);
				request.setAttribute("paramMap", jsonObj);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// new JSONObject(nic);

			// JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			break;

		case "/member/telCheck.do":
			str = "/Member/memberNic.jsp";

			// HashMap nic = getParameterMap(request);
			// Map<String,Object> tel = getParameterMap(request);
			String telLvl = (String) getParameterMap(request).get("lvl");
			String tel = (String) getParameterMap(request).get("tel");
			String id2 = (String) getParameterMap(request).get("id");

			try {
				MembDAO mdao = new MembDAO();
				// int nicCheck = mdao.nicCheck(nic);
				Map<String, Object> telCheck = new HashMap();
				telCheck.put("tel", mdao.telCheck(id2, tel, telLvl));

				JSONObject jsonObj = convertMapToJson(telCheck);
				System.out.println(jsonObj);
				request.setAttribute("paramMap", jsonObj);

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			// new JSONObject(nic);

			// JSONParse에 json데이터를 넣어 파싱한 다음 JSONObject로 변환한다.
			break;

		case "/member/test.do":
			str = "/Member/memberNic.jsp";

			try {
				MembDAO mdao = new MembDAO();
				// int nicCheck = mdao.nicCheck(nic);
				Map<String, Object> telCheck = new HashMap();
				ArrayList<Map<String, Object>> ar = new ArrayList<Map<String, Object>>();
				ar = mdao.test();

				JSONArray arr = new JSONArray();

				for (int i = 0; i < ar.size(); i++) {
					arr.add(ar.get(i));
				}
				JSONObject univ = new JSONObject();
				univ.put("univ", arr);
				// JSONObject jsonObj = convertMapToJson(telCheck);
				// System.out.println(jsonObj);
				request.setAttribute("paramMap", univ);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			JSONArray arr = new JSONArray();

			break;
		case "/member/checkId.do":
			System.out.println("아이디 체크");
			str = "/Member/memberNic.jsp";
			try {
				MembDAO mdao = new MembDAO();

				String insertId = (String) request.getParameter("id");

				Map<String, Object> idCheck = new HashMap();
				idCheck.put("result", mdao.checkId(insertId));

				JSONObject jsonObj = convertMapToJson(idCheck);
				System.out.println(jsonObj);
				request.setAttribute("paramMap", jsonObj);
			} catch (Exception e) {
				// TODO: handle exception
			}

			break;
		case "/member/insertInfo.do":
			str = "/Member/memberNic.jsp";

			try {
				MembDAO mdao = new MembDAO();
				Map<String, Object> param = getParameterMap2(request);
				System.out.println(param);

				mdao.insertUser(param);
				
				Map<String, Object> idCheck = new HashMap();
				// idCheck.put("result", mdao.checkId(insertId));

				
				
				
				JSONObject jsonObj = convertMapToJson(idCheck);
				System.out.println(jsonObj);
				request.setAttribute("paramMap", jsonObj);
			} catch (Exception e) {
				// TODO: handle exception
			}

			break;
		case "/member/myBoardList.do":
			str = "/Member/memberNic.jsp";

			try {
				MembDAO mdao = new MembDAO();
				// int nicCheck = mdao.nicCheck(nic);

				HashMap<String, String> param = getParameterMap(request);

				Map<String, Object> pageCheck = new HashMap();
				ArrayList<Map<String, Object>> ar = new ArrayList<Map<String, Object>>();
				ar = mdao.myBoardList(param);
				System.out.println(ar.size());
				int totalCNT = mdao.myBoardListCnt(param);
				
				JSONArray arr2 = new JSONArray();
				JSONArray arr3 = new JSONArray();
				
				if (ar != null) {
					pageCheck.put("currPage", param.get("currPage"));
					pageCheck.put("cnt", totalCNT);
					arr3.add(pageCheck);
					for (int i = 0; i < ar.size(); i++) {
						arr2.add(ar.get(i));
					}
					
					JSONObject list = new JSONObject();
					
					list.put("list", arr2);
					list.put("page", arr3);
					// JSONObject jsonObj = convertMapToJson(telCheck);
					// System.out.println(jsonObj);
					request.setAttribute("paramMap", list);
				}else{
					request.setAttribute("paramMap", "");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			break;
			
			
			
		case "/member/myReservList.do" : 
			
			
			str = "/Member/memberNic.jsp";

			try {
				MembDAO mdao = new MembDAO();
				// int nicCheck = mdao.nicCheck(nic);

				HashMap<String, String> param = getParameterMap(request);



				Map<String, Object> pageCheck = new HashMap();
				
				ArrayList<Map<String, Object>> ar = new ArrayList<Map<String, Object>>();
				
				
				
				ar = mdao.myReservList(param);
				
				System.out.println(ar.size());

				int totalCNT = mdao.myReservListCnt(param);
				
				JSONArray arr2 = new JSONArray();
				JSONArray arr3 = new JSONArray();
				
				if (ar != null) {
					pageCheck.put("currPage", param.get("currPage"));
					pageCheck.put("cnt", totalCNT);
					arr3.add(pageCheck);
					for (int i = 0; i < ar.size(); i++) {
						arr2.add(ar.get(i));
					}
					
					JSONObject list = new JSONObject();
					
					list.put("list", arr2);
					list.put("page", arr3);
					// JSONObject jsonObj = convertMapToJson(telCheck);
					// System.out.println(jsonObj);
					request.setAttribute("paramMap", list);
				}else{
					request.setAttribute("paramMap", "");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			break;
		case "/member/memberInfoList.do" :
			
			str = "/Member/memberNic.jsp";

			try {
				MembDAO mdao = new MembDAO();
				// int nicCheck = mdao.nicCheck(nic);

				HashMap<String, String> param = getParameterMap(request);



				Map<String, Object> pageCheck = new HashMap();
				
				ArrayList<Map<String, Object>> ar = new ArrayList<Map<String, Object>>();
				
				
				
				ar = mdao.memberInfoList(param);
				
				

				int totalCNT = mdao.memberInfoListTotal();
				
				JSONArray arr2 = new JSONArray();
				JSONArray arr3 = new JSONArray();
				
				if (ar != null) {
					pageCheck.put("currPage", param.get("currPage"));
					pageCheck.put("cnt", totalCNT);
					arr3.add(pageCheck);
					for (int i = 0; i < ar.size(); i++) {
						arr2.add(ar.get(i));
					}
					
					JSONObject list = new JSONObject();
					
					list.put("list", arr2);
					list.put("page", arr3);
					// JSONObject jsonObj = convertMapToJson(telCheck);
					// System.out.println(jsonObj);
					request.setAttribute("paramMap", list);
				}else{
					request.setAttribute("paramMap", "");
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			break;
			
			
		case "/member/updateStatus.do" :
			str = "/Member/memberNic.jsp";

			
			Map<String,Object> map = getParameterMap2(request);
			
			
			
			
			
			try {
				MembDAO mdao = new MembDAO();
				
				int result = mdao.updateStatus(map);
				HashMap<String, String> param = getParameterMap(request);



				Map<String, Object> pageCheck = new HashMap();
				
				ArrayList<Map<String, Object>> ar = new ArrayList<Map<String, Object>>();
				
				
				
				ar = mdao.memberInfoList(param);
				
				System.out.println(ar.size());

				int totalCNT = mdao.memberInfoListTotal();
				
				JSONArray arr2 = new JSONArray();
				JSONArray arr3 = new JSONArray();
				
				if (ar != null) {
					pageCheck.put("currPage", param.get("currPage"));
					pageCheck.put("cnt", totalCNT);
					arr3.add(pageCheck);
					for (int i = 0; i < ar.size(); i++) {
						arr2.add(ar.get(i));
					}
					
					JSONObject list = new JSONObject();
					
					list.put("list", arr2);
					list.put("page", arr3);
					// JSONObject jsonObj = convertMapToJson(telCheck);
					// System.out.println(jsonObj);
					request.setAttribute("paramMap", list);
				}else{
					request.setAttribute("paramMap", "");
				}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			break;
			
		case "/member/roomLvlList.do" :
			str = "/Member/memberNic.jsp";
			
			try {
				MembDAO mdao = new MembDAO();
				// int nicCheck = mdao.nicCheck(nic);

				HashMap<String, String> param = getParameterMap(request);



				Map<String, Object> pageCheck = new HashMap();
				
				ArrayList<Map<String, Object>> ar = new ArrayList<Map<String, Object>>();
				
				
				
				ar = mdao.roomLvlList(param);
				
				

				int totalCNT = mdao.roomLvlListTotal();
				
				JSONArray arr2 = new JSONArray();
				JSONArray arr3 = new JSONArray();
				
				if (ar != null) {
					pageCheck.put("currPage", param.get("currPage"));
					pageCheck.put("cnt", totalCNT);
					arr3.add(pageCheck);
					for (int i = 0; i < ar.size(); i++) {
						arr2.add(ar.get(i));
					}
					
					JSONObject list = new JSONObject();
					
					list.put("list", arr2);
					list.put("page", arr3);
					request.setAttribute("paramMap", list);
				}else{
					request.setAttribute("paramMap", "");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			
			
			break;
		case "/member/insertRoomLvl.do" :
			str = "/Member/managerPage.jsp";
			
			try {
				MembDAO mdao = new MembDAO();
				
				Map<String,Object> param = getParameterMap2(request);
				
				 int maxSize  = 1024*1024*10;       
				 
				    // 웹서버 컨테이너 경로
				    String root = request.getSession().getServletContext().getRealPath("/");
				 
				    // 파일 저장 경로(ex : /home/tour/web/ROOT/upload)
				    
				    String savePath = "C:/eGovFrameDev-3.7.0-64bit/workspace/HotelHotel/WebContent/src/lib/images/room/";
				 
				    // 업로드 파일명
				    String uploadFile = "";
				 
				    // 실제 저장할 파일명
				    String newFileName = "";


				    int read = 0;
				    byte[] buf = new byte[1024];
				    FileInputStream fin = null;
				    FileOutputStream fout = null;
				 

				    MultipartRequest multi = new MultipartRequest(request, savePath, maxSize, "UTF-8", new DefaultFileRenamePolicy());
			        String roomLvl = multi.getParameter("roomLvl");
			        String roomPrice = multi.getParameter("roomPrice");
			        String fileName = multi.getParameter("fileName");
			        
			        // 파일업로드
			        uploadFile = multi.getFilesystemName("fileName");
			 
			        // 실제 저장할 파일명(ex : 20140819151221.zip)
			        newFileName = roomLvl + "1.jpg";
			        System.out.println("1");
			         
			        // 업로드된 파일 객체 생성
			        File oldFile = new File(savePath + uploadFile);
			        System.out.println("3");
			         
			        // 실제 저장될 파일 객체 생성
			        File newFile = new File(savePath + newFileName);
			         
			        System.out.println("3");
			        // 파일명 rename
			        if(!oldFile.renameTo(newFile)){
			 
			            // rename이 되지 않을경우 강제로 파일을 복사하고 기존파일은 삭제
			 
			            buf = new byte[1024];
			            fin = new FileInputStream(oldFile);
			            fout = new FileOutputStream(newFile);
			            read = 0;
			            System.out.println("4");
			            while((read=fin.read(buf,0,buf.length))!=-1){
			                fout.write(buf, 0, read);
			            }
			            System.out.println("5");
			            fin.close();
			            fout.close();
			            oldFile.delete();
			        }  


	
			        param.put("roomLvl", roomLvl);
			        param.put("roomPrice", roomPrice);
		            param.put("fileName", "/src/lib/images/room/" + newFileName);
		        
		        	int result = mdao.insertRoomLvl(param);
		        	int result2 = mdao.insertRoomPic(param);
		        	
		        	if(result2 == 0){
		        		result = 0;
		        	}
		        	request.setAttribute("paramMap", result);
		        
		        
		        
		        
		        
		        
				
				
				
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("파일넣기 실패");
				System.out.println(e);
			}
			 
			
			
			break;
			
			
		case "/member/RoomDetailFrom.do" :
			
			str = "/Member/memberNic.jsp";
			
			try {
				MembDAO mdao = new MembDAO();
				
				Map<String,Object> param = getParameterMap2(request);
				
				System.out.println(param);
				ArrayList<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
				resultMap = mdao.selectRoom(param);
				
				Map<String, Object> pageCheck = new HashMap();
				int totalCNT = mdao.roomListTotal(param);
				
				JSONArray arr3 = new JSONArray();
				JSONArray arr4 = new JSONArray();
				
				
				pageCheck.put("currPage", param.get("currPage"));
				pageCheck.put("cnt", totalCNT);
				
				System.out.println(pageCheck + "dddddddddddddddddddddd");
				
				arr4.add(pageCheck);
				for (int i = 0; i < resultMap.size(); i++) {
					arr3.add(resultMap.get(i));
				}
				
				JSONObject list = new JSONObject();
				
				list.put("list", arr3);
				list.put("lev", param.get("RoomLvl"));
				list.put("page", arr4);
				
				request.setAttribute("paramMap", list);
				
				
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println(e);
			}
			
			
			
			break;
			
		case "/member/insertRoom.do" :
			str = "/Member/memberNic.jsp";
			
			
			try {
				MembDAO mdao = new MembDAO();
				
				Map<String,Object> param = getParameterMap2(request);
				
				
				int result = mdao.insertRoom(param);
				
				request.setAttribute("paramMap", result);
				
				
				
			} catch (Exception e) {
				// TODO: handle exception
			}
			
			
			break;
		}

		// 처음 실행 시 아래 주석도 풀고 실행

		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);

	}

	protected HashMap getParameterMap(HttpServletRequest req) {
		HashMap map = new HashMap();

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
}
