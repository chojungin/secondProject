package reserv.reservDAO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.swing.Renderer;

import DBConn.DBConn;
import reserv.reservVO.ReservVO;

public class ReservDAO {
	private Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public ReservDAO() throws ClassNotFoundException, SQLException {
		con = new DBConn().getConnection();

	}

	public void memInfo(String id) throws ClassNotFoundException, SQLException {

		String sql = "select user_id,user_tel from users where user_id = ?";
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();

	}

	public void reservInfo(String id) throws ClassNotFoundException, SQLException {

		String sql = "select reserv_no,user_id,room_no,in_date,out_date,reserv_date from reserv where \r\n"
				+ "user_id =? ";
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();

	}

	public void payInfo(String id) throws ClassNotFoundException, SQLException {

		String sql = "select reserv_no,user_id,payment_date,reserv_date from payment" + "where user_id = ?";
		pstmt.setString(1, id);
		ResultSet rs = pstmt.executeQuery();
	}

	// 방찾기/////////////////////////////////////////////////////////////////////////////////////
	public ArrayList<ReservVO> findRoom(String first_day, String last_day, String room_lev)
			throws ClassNotFoundException, SQLException {

		ArrayList<ReservVO> resList = new ArrayList<ReservVO>();

		String sql = "select room_lev from room\r\n" + "where room_no not in (SELECT room_no\r\n" + "  FROM reserv\r\n"
				+ " WHERE in_date < ?\r\n" + "   AND out_date > ?\r\n" + ") and room_lev = ? GROUP by room_lev ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, first_day);
		pstmt.setString(2, last_day);
		pstmt.setString(3, room_lev);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			String room_lev2 = rs.getString("room_lev");

			ReservVO rev = new ReservVO(room_lev2);

			resList.add(rev);
		}
		return resList;
	}

	public ArrayList<ReservVO> allRoom(String first_day, String last_day) throws ClassNotFoundException, SQLException {
		ArrayList<ReservVO> tiarray = new ArrayList<ReservVO>();
		String sql = "select room_lev from room\r\n" + "where room_no not in (SELECT room_no\r\n" + "  FROM reserv\r\n"
				+ " WHERE in_date < ?\r\n" + "   AND out_date > ?\r\n" + ") GROUP by room_lev ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, first_day);
		pstmt.setString(2, last_day);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			String room_lev2 = rs.getString("room_lev");
			ReservVO rev = new ReservVO(room_lev2);
			tiarray.add(rev);
		}
		System.out.println(tiarray);
		return tiarray;
	}

	public ArrayList<ReservVO> findRoom(Object first_day, Object last_day, Object room_lev) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<ReservVO> resList = new ArrayList<ReservVO>();

		String sql = "select room_lev from room\r\n" + "where room_no not in (SELECT room_no\r\n" + "  FROM reserv\r\n"
				+ " WHERE in_date < ?\r\n" + "   AND out_date > ?\r\n" + ") and room_lev = ? GROUP by room_lev ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String) first_day);
		pstmt.setString(2, (String) last_day);
		pstmt.setString(3, (String) room_lev);

		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			String room_lev2 = rs.getString("room_lev");

			ReservVO rev = new ReservVO(room_lev2);

			resList.add(rev);
		}
		return resList;
	}

	public ArrayList<ReservVO> allRoom(Object first_day, Object last_day) throws SQLException {
		// TODO Auto-generated method stub
		ArrayList<ReservVO> tiarray = new ArrayList<ReservVO>();
		String sql = "select room_lev from room\r\n" + "where room_no not in (SELECT room_no\r\n" + "  FROM reserv\r\n"
				+ " WHERE in_date < ?\r\n" + "   AND out_date > ?\r\n" + ") GROUP by room_lev ";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String) first_day);
		pstmt.setString(2, (String) last_day);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			String room_lev2 = rs.getString("room_lev");
			ReservVO rev = new ReservVO(room_lev2);
			tiarray.add(rev);
		}
		System.out.println(tiarray);
		return tiarray;

	}

	public ArrayList<ReservVO> selectRoom() throws SQLException {
		ArrayList<ReservVO> roomList = new ArrayList<ReservVO>();
		String sql = "select room_pic,room_lev,room_no from room ";
		pstmt = con.prepareStatement(sql);

		rs = pstmt.executeQuery();

		while (rs.next()) {
			String room_pic = rs.getString("room_pic");
			String room_lev = rs.getString("room_lev");
			String room_no = rs.getString("room_no");
			ReservVO rev = new ReservVO(room_pic, room_lev, room_no);
			roomList.add(rev);
		}
		return roomList;
	}

	public ArrayList<ReservVO> roomAddition(String room_addNo, String room_addLev) throws SQLException {
		ArrayList<ReservVO> info = new ArrayList<ReservVO>();
		String sql = "select room_addname , room_addprice from room_addition where reserv_no = ?";
		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, room_addNo);
		rs = pstmt.executeQuery();
		while (rs.next()) {
			String room_addname = rs.getString("room_addname");
			String room_addprice = rs.getString("room_addprice");
			ReservVO rev = new ReservVO(room_addname, room_addprice);
			info.add(rev);
		}
		return info;
	}
	// 방찾기/////////////////////////////////////////////////////////////////////////////////////

	public String roomPrice(String room_price) throws SQLException {
		String price = null;
		String sql = "select room_price from room_info where room_lev = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, room_price);
		rs = pstmt.executeQuery();

		while (rs.next()) {
			price = rs.getString("room_price");

		}
		return price;

	}

	// db에 option 저장.... count 어떻게만들지 고민중,,
	public void insertOption(String room_opname) throws SQLException {

		String sql = "insert into room_addition values((select max(to_number(reserv_no,'99999')) from reserv),(select room_addno from room_addd where room_addname = ?))";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, room_opname);

		rs = pstmt.executeQuery();

	}

	public String insertImg(String room_lev) throws SQLException {
		String Img = null;

		String sql = "select room_pic from room_grade where room_lev=?";
		pstmt = con.prepareStatement(sql);

		pstmt.setString(1, room_lev);
		rs = pstmt.executeQuery();
		while (rs.next()) {

			Img = rs.getString("room_pic");

		}
		return Img;
	}

	public String InsertRev(Object user_id, String room_no, Object in_date, Object out_date) throws SQLException {
		String insert = null;

		String sql = "insert into reserv values((select  TO_CHAR(max(to_number(reserv_no,'99999'))+1) from reserv),?,?,?,?,sysdate)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String) user_id);
		pstmt.setString(2, room_no);
		pstmt.setString(3, (String) in_date);
		pstmt.setString(4, (String) out_date);

		rs = pstmt.executeQuery();
		return sql;

	}

	public String selectRoomNo(Object first_day, Object last_day, String room_lev) throws SQLException {
		// TODO Auto-generated method stub
		String result = "";
		String sql = "select min(room_no)\r\n" + "    from room\r\n" + "    where room_no not in (SELECT room_no\r\n"
				+ "                            FROM reserv\r\n"
				+ "                            WHERE in_date < ? AND out_date > ?\r\n"
				+ "                         ) \r\n" + "    and room_lev = ? \r\n" + "    GROUP by room_lev";

		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, (String) first_day);
		pstmt.setString(2, (String) last_day);
		pstmt.setString(3, (String) room_lev);
		rs = pstmt.executeQuery();

		while (rs.next()) {

			result = rs.getString(1);
		}
		return result;

	}

	public int opPrice(String option) throws SQLException {
		// TODO Auto-generated method stub
		int result = 0;
		String sql = "select SUM(b.room_addprice) as num \r\n" + "    from room_addition A\r\n"
				+ "    JOIN room_addd B ON(a.room_addno = b.room_addno)\r\n" + "    where A.reserv_no = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, option);
		rs = pstmt.executeQuery();
		while (rs.next()) {

			result = rs.getInt("num");
		}
		return result;
	}

	public String selectRevNo() throws SQLException {
		// TODO Auto-generated method stub
		String result = "";
		String sql = " select max(to_number(reserv_no,'99999')) as result  from reserv";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		while (rs.next()) {

			result = rs.getString(1);
		}
		return result;

	}



}
