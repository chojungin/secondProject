package foDAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;

import DBConn.DBConn;
import foVO.foVo;

//����

public class foDao {

	private Connection con;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public foDao() throws ClassNotFoundException, SQLException {
		con = new DBConn().getConnection();
	}

	
	
	
	
//////////////////////Q&A �Խ��� ��Ʈ	
	
	
	
	// �Խñ� DB �� �Է�

	public boolean insert_data(int num, String uid, String subject, String content) {

		String sql = "insert into hotel.BOARD values(?,1,?,?,?,0,sysdate)";
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.setString(2, uid);
			pstmt.setString(3, subject);
			pstmt.setString(4, content);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("�޼ҵ� ����1");
			System.out.println(num + uid + subject + content+"////"+e);

			return false;
		}
		return true;

	}

	// �Խñ� ��ȣ ���ϱ�

	public int getnumber() throws SQLException {

		int getnum = 0;

		try {

			String sql = " SELECT CASE WHEN COUNT(BOARD_NO) is null then 0 else COUNT(BOARD_NO) end FROM hotel.BOARD WHERE BOARD_CATE=1";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				getnum = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("��������");
		}

		return getnum;

	}

	public int countNum() throws SQLException {

		int cntnum = 0;

		try {

			String sql = " SELECT CASE WHEN COUNT(BOARD_NO) is null then 0 else max(BOARD_NO) end FROM hotel.BOARD";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cntnum = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("��������");
		}

		return cntnum;

	}

//�Խ��� �� �������� ����ϴ� �κ�

	public ArrayList<foVo> getAll(int starte, int ende) throws SQLException {
		ArrayList<foVo> farray = new ArrayList<foVo>();
		String sql = "select* from (SELECT ROWNUM, A.* FROM (select*from BOARD where board_cate=1 order by board_no desc) A) where rownum between ? and ?";
/*		String sql = "SELECT * FROM hotel.BOARD  WHERE BOARD_CATE=1 AND BOARD_NO BETWEEN ? AND ? ORDER BY BOARD_NO DESC";
*/
		pstmt = con.prepareStatement(sql);
		System.out.println("starte : "  + starte + " ende : " + ende );
		pstmt.setInt(1, starte);
		pstmt.setInt(2, ende);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			int num = rs.getInt("BOARD_NO");
			String writer = rs.getString("USER_ID");
			String subject = rs.getString("BOARD_TITLE");
			String content = rs.getString("BOARD_CONTENT");
			int readcnt = rs.getInt("BOARD_CNT");
			Date wriDate = rs.getDate("BORDER_DATE");
			String wriD = wriDate.toString();
			foVo fv = new foVo(num, writer, subject, content, readcnt, wriD);

			farray.add(fv);
		}
		return farray;
	}

//�� Ŭ���� ���� ��ºκ� 

	public ArrayList<foVo> getAll2(int num1) throws SQLException {
		ArrayList<foVo> farray2 = new ArrayList<foVo>();
		String sql = "SELECT * FROM hotel.BOARD  WHERE BOARD_NO = ? and BOARD_CATE=1";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num1);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			int num = rs.getInt("BOARD_NO");
			int cat = rs.getInt("BOARD_CATE");
			String writer = rs.getString("USER_ID");
			String subject = rs.getString("BOARD_TITLE");
			String content = rs.getString("BOARD_CONTENT");
			int readcnt = rs.getInt("BOARD_CNT");
			Date wriDate = rs.getDate("BORDER_DATE");
			String wriD = wriDate.toString();

			foVo fv = new foVo(num, cat, writer, subject, content, readcnt, wriD);

			farray2.add(fv);
		}
		return farray2;
	}

//��ȸ��

	public boolean update_cnt(int num) {
		String sql = "update hotel.BOARD set BOARD_CNT=BOARD_CNT+1 where BOARD_NO=?";
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			System.out.println("��ȸ�� ����");
			return false;
		}
		return true;

	}

//��� �Խ��� �Է�

// ��� db �Էº�

	public boolean insert_com(int num1, String uid, String content) {

		String sql = "insert into hotel.COMM values(1,?,1,?,?,sysdate)";
		try {

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num1);
			pstmt.setString(2, uid);

			pstmt.setString(3, content);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			System.out.println("�޼ҵ� ����");
			System.out.println(num1 + uid + content);

			return false;
		}
		return true;

	}

//��� ��º� 

	public ArrayList<foVo> getCom(int num1) throws SQLException {
		ArrayList<foVo> carray = new ArrayList<foVo>();
		String sql = "SELECT * FROM hotel.COMM  WHERE BOARD_CATE=1 AND BOARD_NO =?";

		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, num1);

		rs = pstmt.executeQuery();
		while (rs.next()) {
			int num = rs.getInt("BOARD_NO");
			String writer = rs.getString("USER_ID");
			String content = rs.getString("COMM_CONTENT");
			Date wriDate = rs.getDate("COMM_DATE");
			String wriD = wriDate.toString();

			foVo cv = new foVo(num, writer, content, wriD);

			carray.add(cv);

		}
		return carray;
	}

//��� ��ȣ �� ������� ���, null �� ��� 0 ���� 

	public int getComNo(int num2) throws SQLException {

		int getCom = 0;
		try {

			String sql = "SELECT CASE WHEN (SELECT BOARD_NO FROM hotel.COMM WHERE BOARD_NO=?) is null then 0 else (SELECT BOARD_NO FROM hotel.COMM WHERE BOARD_NO=?) end FROM hotel.COMM";
			pstmt = con.prepareStatement(sql);

			pstmt.setInt(1, num2);
			pstmt.setInt(2, num2);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				getCom = rs.getInt(1);

			}
		} catch (SQLException e) {
			System.out.println("�����¿���");

		}

		return getCom;

	}
	
	
	public boolean delete_data(int num, int num2) {
		// TODO Auto-generated method stub
		
		String sql = "delete hotel.BOARD where BOARD_NO = ? AND BOARD_CATE = ?";
		
		try {
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		pstmt.setInt(2, num2);
		pstmt.executeUpdate();
		
		}catch(SQLException e) {
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}
	
	public boolean delete_com(int num) {
		// TODO Auto-generated method stub
		
		String sql = "delete hotel.COMM where BOARD_NO = ? AND BOARD_CATE = 1";
		
		try {
		pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, num);
		pstmt.executeUpdate();
		
		}catch(SQLException e) {
			System.out.println("delete Exception");
			return false;
		}
		return true;
	}
	
	
	
	
	
	//////////////////////////////���� ��Ʈ
	
	
	
	
	
	
	
	
	
	//���� ��ȣ ���ϱ�
	
	
	public int getRevNum() throws SQLException {

		int getnum = 0;

		try {

			String sql = " SELECT CASE WHEN COUNT(BOARD_NO) is null then 0 else COUNT(BOARD_NO) end FROM hotel.BOARD WHERE BOARD_CATE=2";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				getnum = rs.getInt(1);
			}
		} catch (SQLException e) {
			System.out.println("��������");
		}

		return getnum;

	}

	
	
	// ���� DB �� �Է�

		public boolean insert_rev(int num1, String uid1, String revsubject, String revcontent) {

			String sql = "insert into hotel.BOARD values(?,2,?,?,?,0,sysdate)";
			try {

				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, num1);
				pstmt.setString(2, uid1);
				pstmt.setString(3, revsubject);
				pstmt.setString(4, revcontent);

				pstmt.executeUpdate();

			} catch (SQLException e) {
				System.out.println("�޼ҵ� ����2");
				System.out.println(num1 + uid1 + revsubject + revcontent+ "////" +e);

				return false;
			}
			return true;

		}
		
		
		
		////���� ����Ʈ�� ��ºκ� 
		
		
		public ArrayList<foVo> revGetAll(int starte, int ende) throws SQLException {
			ArrayList<foVo> farray2 = new ArrayList<foVo>();
			String sql = "SELECT * FROM hotel.BOARD  WHERE BOARD_CATE=2 AND BOARD_NO BETWEEN ? AND ? ORDER BY BOARD_NO DESC";
			/*String sql = "select* from (SELECT ROWNUM, A.* FROM (select*from BOARD where board_cate=2 order by board_no desc) A) where rownum between ? and ?";*/
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, starte);
			pstmt.setInt(2, ende);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("BOARD_NO");
				String writer = rs.getString("USER_ID");
				String subject = rs.getString("BOARD_TITLE");
				String content = rs.getString("BOARD_CONTENT");
				int readcnt = rs.getInt("BOARD_CNT");
				Date wriDate = rs.getDate("BORDER_DATE");
				String wriD = wriDate.toString();
				
				foVo fv = new foVo(num, writer, subject, content, readcnt, wriD);

				farray2.add(fv);
				
				
				
				
			}
			return farray2;
		}
	
//����� ���� ���ϱ�
		
		// �Խñ� ��ȣ ���ϱ�

		public int getnumber2() throws SQLException {

			int getnum = 0;

			try {

				String sql = " SELECT CASE WHEN COUNT(BOARD_NO) is null then 0 else COUNT(BOARD_NO) end FROM hotel.BOARD WHERE BOARD_CATE=2";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					getnum = rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("��������");
			}

			return getnum;

		}
		
		//count number
		
		public int countNum2() throws SQLException {

			int getnum = 0;

			try {

				String sql = " SELECT CASE WHEN COUNT(BOARD_NO) is null then 0 else max(BOARD_NO) end FROM hotel.BOARD WHERE BOARD_CATE=2";
				pstmt = con.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if (rs.next()) {
					getnum = rs.getInt(1);
				}
			} catch (SQLException e) {
				System.out.println("��������");
			}

			return getnum;

		}
		
		
		
		//delete review
		
		public boolean delete_rev(int num) {
			// TODO Auto-generated method stub
			
			String sql = "delete hotel.BOARD where BOARD_NO = ? AND BOARD_CATE = 2";
			
			try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			System.out.println(num);
			}catch(SQLException e) {
				System.out.println("delete Exception");
				return false;
			}
			return true;
		}
		
		
}
