package memb.membDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import DBConn.DBConn;
import memb.membVO.MembVO;

public class MembDAO {
	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public MembDAO() throws ClassNotFoundException, SQLException {

		con = new DBConn().getConnection();
	}

	// 로그인 체크
	public int loginCheck(String id, String pw) throws SQLException {
		int result = 0;
		String sql = "SELECT count(user_id) checked FROM users where user_id = ? and user_pw = ?";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, pw);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			result = rs.getInt("checked");
		}
		return result;
	}
	//유저 권한 및 정지 활성화 여부
	public int userStatus(String id) throws SQLException {
		int result = 0;
		
		String sql = "SELECT USER_STATUS FROM users where user_id = ? ";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			result = rs.getInt("USER_STATUS");
		}
		return result;
	}
	
	
	//
	public MembVO myInfo(String id) throws SQLException {
		MembVO result = null;
		String sql = "SELECT * FROM users where user_id = ?";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, id);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			// result = rs.getInt("checked");
			result = new MembVO();
			result.setUserId(rs.getString("user_id"));
			result.setUserName(rs.getString("user_name"));
			result.setUserNic(rs.getString("user_nic"));
			result.setUserTel(rs.getString("user_tel"));
			// result.setUserCardnum(rs.getString("member_id"));
		}

		return result;
	}

	public int nicCheck(String id, String nic, String lvl) throws SQLException {
		int result = 0;
		String sql = "";

		if(lvl.equals("nic")){
			sql = "SELECT count(user_nic) chk FROM users where user_nic = ? and user_id != ?";
		}else if(lvl.equals("insertNic")){
			sql = "SELECT count(user_nic) chk FROM users where user_nic = ?";
		}
		
		
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, nic);
		if(lvl.equals("nic")){
			pstmt.setString(2, id);
		}else if(lvl.equals("insertNic")){
		}
		
		rs = pstmt.executeQuery();
		while (rs.next()) {
			// result = rs.getInt("checked");
			result = rs.getInt("chk");

		}

		return result;
	}

	public int telCheck(String id, String tel,String lvl) throws SQLException {
		int result = 0;
		
		String sql = "";

		
		if(lvl.equals("tel")){
			sql = "SELECT count(user_tel) chk FROM users where user_tel = ? and user_id != ?";
		}else if(lvl.equals("insertTel")){
			sql = "SELECT count(user_tel) chk FROM users where user_tel = ?";
		}
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, tel);
		if(lvl.equals("tel")){
			pstmt.setString(2, id);
		}else if(lvl.equals("insertTel")){
			
		}
		
		rs = pstmt.executeQuery();
		while (rs.next()) {
			// result = rs.getInt("checked");
			result = rs.getInt("chk");

		}

		return result;
	}

	public int updateInfo(HashMap paramMap) {
		// TODO Auto-generated method stub
		int result = 0;
		String sql = "";
		if(paramMap.get("pw1").equals("")){
			sql = "update users set user_nic=?, user_tel=? where user_id=?";
		}else{
			sql = "update users set user_nic=?, user_tel=?,user_pw=? where user_id=?";
		}
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, (String)paramMap.get("nic"));
			pstmt.setString(2, (String)paramMap.get("tel"));
			if(paramMap.get("pw1").equals("")){
				pstmt.setString(3, (String)paramMap.get("id"));
			}else{
				pstmt.setString(3, (String)paramMap.get("pw1"));
				pstmt.setString(4, (String)paramMap.get("id"));
			}
			pstmt.executeUpdate();///////////////
			result = 1;
		} catch (SQLException e) {
			// TODO: handle exception
			
		}
			
		
		return result;
	}

	public ArrayList<Map<String, Object>> test() throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		String sql = "SELECT * FROM users";

		pstmt = con.prepareStatement(sql);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			// result = rs.getInt("checked");
			Map<String, Object> map = new HashMap();
			map.put("id", rs.getString("user_id"));
			map.put("name", rs.getString("user_name"));
			result.add(map);
		}

		
		return result;
	}

	//아이디 중복체크
	public int checkId(String insertId) throws SQLException {
		int result = 0;
		String sql = "SELECT count(user_id) checked FROM users where user_id = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, insertId);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			 result = rs.getInt("checked");
			
		}

		return result;
	}

	
	//내가 쓴 글 보기
	public ArrayList<Map<String, Object>> myBoardList(HashMap<String, String> param) throws NumberFormatException, SQLException {
		ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		String sql = "SELECT RNUM "
				+ " ,BOARD_NO"
				+ " , case when BOARD_CATE = 1  then 'QnA게시판' else '리뷰게시판' end as BOARD_CATE"
				+ " ,BOARD_TITLE"
				+ " ,BOARD_CNT"
				+ " ,BORDER_DATE "
				+ " FROM(select ROWNUM AS RNUM "
				+ " ,B.BOARD_NO "
				+ " ,B.BOARD_CATE "
				+ " ,B.BOARD_TITLE "
				+ " ,B.BOARD_CNT "
				+ " ,TO_CHAR(B.BORDER_DATE,'YYYY.MM.DD')  AS BORDER_DATE"
				+ " from BOARD B "
				+ " where USER_ID = ?) "
				+ " WHERE RNUM BETWEEN ? AND ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String)param.get("id"));
		pstmt.setInt(2, Integer.parseInt(param.get("startIndex")));
		pstmt.setInt(3, Integer.parseInt(param.get("lastIndex")));
		rs = pstmt.executeQuery();
		while (rs.next()) {
			 //result = rs.getInt("checked");
			Map<String, Object> map = new HashMap();
			map.put("RNUM", rs.getInt("RNUM"));
			map.put("BOARD_NO", rs.getInt("BOARD_NO"));
			map.put("BOARD_CATE", rs.getString("BOARD_CATE"));
			map.put("BOARD_TITLE", rs.getString("BOARD_TITLE"));
			map.put("BOARD_CNT", rs.getInt("BOARD_CNT"));
			map.put("BORDER_DATE", rs.getString("BORDER_DATE"));
			
			result.add(map);
			
		}

		return result;
	}
	//내가쓴글 총 갯수
	public int myBoardListCnt(HashMap<String, String> param) throws SQLException {
		// TODO Auto-generated method stub
		
		int result = 0;
		
		String sql = "select count(board_no) cnt from board where user_id = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String)param.get("id"));
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			result = rs.getInt("cnt");
			
		}
		
		
		return result;
	}


	//내 예약 정보 리스트
	public ArrayList<Map<String, Object>> myReservList(HashMap<String, String> param) throws SQLException {
		ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		String sql = "SELECT RNUM"
				   + " ,RESERV_NO"
				   + " ,ROOM_NO"
				   + " ,TO_CHAR(IN_DATE,'YYYY.MM.DD') AS IN_DATE"
				   + " ,DAT"
				   + " ,TO_CHAR(RESERV_DATE,'YYYY.MM.DD') AS RESERV_DATE"
				   + " ,CASE WHEN DEPOSIT= 1 THEN '결제완료' ELSE '미결제' END AS DEPOSIT "
				   + " ,ROOM_LEV "
				   + " FROM (SELECT ROWNUM AS RNUM ,"
				   + " A.RESERV_NO"
				   + " ,A.ROOM_NO"
				   + " ,A.IN_DATE"
				   + " ,A.OUT_DATE - A.IN_DATE AS DAT"
				   + " ,A.RESERV_DATE"
				   + " ,B.DEPOSIT"
				   + " ,C.ROOM_LEV "
				   + " FROM RESERV A "
				   + " JOIN PAYMENT B ON(A.RESERV_NO = B.RESERV_NO) "
				   + " JOIN ROOM C ON(A.ROOM_NO = C.ROOM_NO)"
				   + " WHERE A.USER_ID=? "
				   + "  )"
				   + " WHERE RNUM BETWEEN ? AND ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String)param.get("id"));
		pstmt.setInt(2, Integer.parseInt(param.get("startIndex")));
		pstmt.setInt(3, Integer.parseInt(param.get("lastIndex")));
		rs = pstmt.executeQuery();
		while (rs.next()) {
			 //result = rs.getInt("checked");
			Map<String, Object> map = new HashMap();
			map.put("RNUM", rs.getInt("RNUM"));
			map.put("RESERV_NO", rs.getInt("RESERV_NO"));
			map.put("ROOM_NO", rs.getInt("ROOM_NO"));
			map.put("IN_DATE", rs.getString("IN_DATE"));
			map.put("DAT", rs.getString("DAT"));
			map.put("RESERV_DATE", rs.getString("RESERV_DATE"));
			map.put("ROOM_LEV", rs.getString("ROOM_LEV"));
			map.put("DEPOSIT", rs.getString("DEPOSIT"));
			
			result.add(map);
			
		}

		return result;
	}

	//내 예약 총 갯수
	public int myReservListCnt(HashMap<String, String> param) throws SQLException {
		// TODO Auto-generated method stub
		
				int result = 0;
				
				String sql = "select count(reserv_no) cnt from reserv where user_id = ?";
				
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, (String)param.get("id"));
				rs = pstmt.executeQuery();
				
				while (rs.next()) {
					result = rs.getInt("cnt");
					
				}
				
				
				return result;
	}

	//회원 정보 리스트
	public ArrayList<Map<String, Object>> memberInfoList(HashMap<String, String> param) throws SQLException {
		ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		String sql = "SELECT RNUM" 
       + ",USER_ID"
       + ",case when USER_LVL = 1 then '활성화' when USER_LVL = 2 then '관리자' when  USER_LVL = 3 then '정지' end as USER_LVL "
       + ",USER_JOIN"
       + ",BOARD_CNT"
       + ",CMM_CNT"
       + ",RESERV_CNT"
       + ",TO_CHAR(TOTAL_PRICE,'L99,999,999') AS TOTAL_PRICE "
       + " FROM(SELECT ROWNUM AS RNUM" 
       + ",USER_ID"
       + ",USER_LVL"
       +",USER_JOIN"
       + ",BOARD_CNT"
       + ",CMM_CNT"
       + ",RESERV_CNT"
       + ",TOTAL_PRICE     "
       + " FROM(SELECT A.USER_ID"
       + ",(SELECT USER_STATUS FROM USERS WHERE USER_ID = A.USER_ID)AS USER_LVL"
       +" ,MAX(TO_CHAR(A.USER_JOIN,'YYYY.MM.DD')) AS USER_JOIN"
       + ",(SELECT COUNT(BOARD_NO) FROM BOARD WHERE USER_ID = A.USER_ID )AS BOARD_CNT"
       + ",(SELECT COUNT(COMM_NO) FROM COMM WHERE USER_ID = A.USER_ID) AS CMM_CNT"
       + ",COUNT(D.RESERV_NO) AS RESERV_CNT"
       + ",NVL(SUM(F.ROOM_PRICE),0) + NVL(SUM(I.ROOM_ADDPRICE),0) AS TOTAL_PRICE"      
       + " FROM USERS A"
       + " LEFT JOIN (SELECT DA.* FROM RESERV DA JOIN PAYMENT DB ON(DA.RESERV_NO = DB.RESERV_NO) WHERE DB.DEPOSIT =1) D ON(A.USER_ID = D.USER_ID)"
       + " LEFT JOIN ROOM E ON(D.ROOM_NO = E.ROOM_NO)"
       + " LEFT JOIN ROOM_INFO F ON(E.ROOM_LEV = F.ROOM_LEV)"
       + " LEFT JOIN ROOM_ADDITION G ON(D.RESERV_NO = G.RESERV_NO)"
       + " LEFT JOIN ROOM_ADDD I ON(G.ROOM_ADDNO = I.ROOM_ADDNO)"
       + " LEFT JOIN PAYMENT H ON(D.RESERV_NO = H.RESERV_NO AND H.DEPOSIT = 1)"
       + " GROUP BY A.USER_ID)"
       + " WHERE 1=1"
       + ")"
       + "WHERE RNUM BETWEEN ? AND ?";
		pstmt = con.prepareStatement(sql);
		//pstmt.setString(1, (String)param.get("id"));
		pstmt.setInt(1, Integer.parseInt(param.get("startIndex")));
		pstmt.setInt(2, Integer.parseInt(param.get("lastIndex")));
		rs = pstmt.executeQuery();
		while (rs.next()) {
			 //result = rs.getInt("checked");
			Map<String, Object> map = new HashMap();
			map.put("RNUM", rs.getInt("RNUM"));
			map.put("USER_ID", rs.getString("USER_ID"));
			map.put("USER_LVL", rs.getString("USER_LVL"));
			map.put("USER_JOIN", rs.getString("USER_JOIN"));
			map.put("BOARD_CNT", rs.getInt("BOARD_CNT"));
			map.put("CMM_CNT", rs.getInt("CMM_CNT"));
			map.put("RESERV_CNT", rs.getInt("RESERV_CNT"));
			map.put("TOTAL_PRICE", rs.getString("TOTAL_PRICE"));
			
			result.add(map);
			
		}

		return result;
	}

	
	//회원가입
	public void insertUser(Map<String, Object> param) throws SQLException {


		
		String sql = "insert into users values(?,?,?,?,?,1)";
		
		pstmt = con.prepareStatement(sql);
		//pstmt.setString(1, (String)param.get("id"));
		pstmt.setString(1, (String)param.get("id"));
		pstmt.setString(2, (String)param.get("pw1"));
		pstmt.setString(3, (String)param.get("name"));
		pstmt.setString(4, (String)param.get("nic"));
		pstmt.setString(5, (String)param.get("tel"));
		rs = pstmt.executeQuery();
		
		
		
		
		
		
	}

	//유저 상태 변경
	public int updateStatus(Map<String, Object> map) {
		
		int result = 0;
		
		int updateStatus;
		
		if(map.get("status").equals("활성화")){
			updateStatus = 3;
		}else{
			updateStatus = 1;
		}
		
		String sql = "UPDATE USERS SET USER_STATUS = ? WHERE USER_ID = ?";
		
		try {
			pstmt = con.prepareStatement(sql);
			//pstmt.setString(1, (String)param.get("id"));
			pstmt.setInt(1, updateStatus);
			pstmt.setString(2, (String)map.get("id"));
			
			rs = pstmt.executeQuery();
			
			result = 1;
		} catch (Exception e) {
			// TODO: handle exception
			result = 0;
		}
		
		
		return result;
	}

	
	//회원 정보 리스트 토탈갯수
	public int memberInfoListTotal() throws SQLException {
		int result = 0;
		
		String sql = "select count(user_id) cnt from users";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			result = rs.getInt("cnt");
			
		}
		
		
		return result;
	}
	
	//객실 클래스 리스트
	public ArrayList<Map<String, Object>> roomLvlList(HashMap<String, String> param) throws SQLException {
		ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		String sql = "SELECT RNUM "
				+ " ,ROOM_LEV"
				+ " ,TO_CHAR(ROOM_PRICE,'L999,999,999') AS ROOM_PRICE"
				+ " FROM (select ROWNUM AS RNUM"
				+ " ,ROOM_LEV"
				+ " ,ROOM_PRICE"
				+ " from ROOM_INFO)"
				+ " WHERE RNUM BETWEEN ? AND ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, Integer.parseInt(param.get("startIndex")));
		pstmt.setInt(2, Integer.parseInt(param.get("lastIndex")));
		rs = pstmt.executeQuery();
		while (rs.next()) {
			 //result = rs.getInt("checked");
			Map<String, Object> map = new HashMap();
			map.put("RNUM", rs.getInt("RNUM"));
			map.put("ROOM_LEV", rs.getString("ROOM_LEV"));
			map.put("ROOM_PRICE", rs.getString("ROOM_PRICE"));

			
			result.add(map);
			
		}

		return result;
	}

	//클래스 총 갯수
	public int roomLvlListTotal() throws SQLException {
		int result = 0;
		
		String sql = "select count(ROOM_LEV) cnt from ROOM_INFO";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			result = rs.getInt("cnt");
			
		}
		
		
		return result;
	}

	//방 클래스 추가
	public int insertRoomLvl(Map<String, Object> param) {
		
		int result = 0;
		
		String sql = "INSERT INTO ROOM_INFO VALUES(?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, (String)param.get("roomLvl"));
			pstmt.setInt(2, Integer.parseInt((String)param.get("roomPrice")));
			rs = pstmt.executeQuery();
			
			
			
			
			result = 1;
		} catch (Exception e) {
			System.out.println(e);
			result = 0;
		}
		
		
		
		
		return result;
	}
	
	
public int insertRoomPic(Map<String, Object> param) {
		
		int result = 0;
		
		String sql = "INSERT INTO ROOM_GRADE VALUES(?,?,(SELECT NVL(MAX(PIC_NO),1) FROM ROOM_GRADE WHERE ROOM_LEV = ?))";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, (String)param.get("roomLvl"));
			pstmt.setString(2, (String)param.get("fileName"));
			pstmt.setString(3, (String)param.get("roomLvl"));
			rs = pstmt.executeQuery();
			
			
			
			
			result = 1;
		} catch (Exception e) {
			System.out.println(e);
			result = 0;
		}
		
		
		
		
		return result;
	}
	

	//룸 클래스별 호수 서치
	public ArrayList<Map<String, Object>> selectRoom(Map<String, Object> param) throws SQLException {
		ArrayList<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		String sql = "SELECT RNUM,ROOM_NO"
				+ " FROM(select ROWNUM AS RNUM, ROOM_NO from room where room_lev = ?)"
				+ " WHERE RNUM BETWEEN ? AND ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String)param.get("RoomLvl"));
		pstmt.setInt(2, Integer.parseInt((String)param.get("startIndex")));
		pstmt.setInt(3, Integer.parseInt((String)param.get("lastIndex")));
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			Map<String, Object> map = new HashMap();
			map.put("RNUM",rs.getString("RNUM"));
			map.put("roomNo",rs.getString("ROOM_NO"));
			
			
			
			result.add(map);
		}
		
		
		return result;
	}

	//총 룸 갯수
	public int roomListTotal(Map<String, Object> param) throws SQLException {
		int result = 0;
		
		String sql = "select count(ROOM_NO) cnt from ROOM where ROOM_LEV = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String)param.get("RoomLvl"));
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			result = rs.getInt("cnt");
			
		}
		
		
		return result;
	}

	public int insertRoom(Map<String, Object> param) {
		int result = 0;
		
		String sql = "INSERT INTO ROOM VALUES(?,?)";
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, (String)param.get("roomlvl"));
			pstmt.setString(2, (String)param.get("room"));
			rs = pstmt.executeQuery();
			
			
			
			
			result = 1;
		} catch (Exception e) {
			System.out.println(e);
			result = 0;
		}
		
		
		
		
		return result;
	}

	

}
