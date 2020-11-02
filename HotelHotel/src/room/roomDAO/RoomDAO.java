package room.roomDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;

import org.apache.catalina.connector.Response;

import DBConn.DBConn;
import room.roomVO.RoomVO;

public class RoomDAO {
	
	private Connection con;	
	
	PreparedStatement pstmt=null;
	
	ResultSet rs=null;
	
	public RoomDAO() throws ClassNotFoundException, SQLException {
		con = new DBConn().getConnection(); 							  	 
	}
		
	//전체 객실 리스트를 가져오는 메소드
	public ArrayList<RoomVO> getAllRoomList() throws SQLException, ClassNotFoundException {
		
		ArrayList<RoomVO> datalist = new ArrayList<RoomVO>(); //리턴값
		
		String sql = "SELECT A.ROOM_LEV,A.ROOM_NO,B.ROOM_PIC FROM ROOM A\r\n" + 
				"JOIN ROOM_GRADE B ON(A.ROOM_LEV = B.ROOM_LEV)\r\n" + 
				"ORDER BY A.ROOM_NO";
		
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while (rs.next()) {
			RoomVO rvo = new RoomVO(rs.getString("room_lev"),rs.getString("room_no"),rs.getString("room_pic"));
			datalist.add(rvo);
			
		} //while-end
		
		return datalist;
		
	} //getAllRoomList-end
	
	//선택한 객실의 정보를 가져오는 메소드
	public Map<String, Object> getOneRoomInfo(String room_no) throws SQLException, ClassNotFoundException {
				
		Map<String, Object> roominfo = new HashMap<>(); 
		
		String sql = "SELECT A.ROOM_LEV, A.ROOM_NO, B.ROOM_PIC, C.ROOM_PRICE\r\n" + 
				"FROM ROOM A, ROOM_GRADE B, ROOM_INFO C\r\n" + 
				"WHERE A.ROOM_LEV = B.ROOM_LEV AND A.ROOM_LEV = C.ROOM_LEV\r\n" + 
				"AND A.ROOM_NO = ?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, room_no);
		rs = pstmt.executeQuery();
		
		while(rs.next()) {
			
			roominfo.put("lev", rs.getString("ROOM_LEV"));
			roominfo.put("no", rs.getString("ROOM_NO"));
			roominfo.put("pic", rs.getString ("ROOM_PIC"));
			roominfo.put("price", rs.getString ("ROOM_PRICE"));
			
		}
		return roominfo;
	}
	
	//조건검색을 통해 페이지의 객실 리스트를 정렬하는 메소드 ㅠㅠ
	public ArrayList<RoomVO> RoomRequireSort(Map<String, Object> param) throws SQLException {
		
		ArrayList<RoomVO> result = new ArrayList<RoomVO>();
		
		String sql = "SELECT A.ROOM_LEV,A.ROOM_NO,B.ROOM_PIC FROM ROOM A\r\n" + 
				"JOIN ROOM_GRADE B ON(A.ROOM_LEV = B.ROOM_LEV)\r\n" + 
				"WHERE A.ROOM_NO LIKE ? AND A.ROOM_LEV = ?\r\n" + 
				"ORDER BY A.ROOM_NO";
		

		System.out.println(param.get("option1"));
		System.out.println(param.get("option2"));
		
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String)param.get("option1") + "%"); //객실층
		pstmt.setString(2, (String)param.get("option2")); //객실레벨
		
		rs = pstmt.executeQuery();
		while(rs.next()){
			RoomVO rvo = new RoomVO(rs.getString("room_lev"),rs.getString("room_no"),rs.getString("room_pic"));
			result.add(rvo);
			
			
			
		}
		
		
		return result;
		
	}
	
}
