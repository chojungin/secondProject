package reserv.reservVO;

public class ReservVO {
	public ReservVO() {
		// TODO Auto-generated constructor stub
	}

	String id;
	String name;
	String tel;
	String room_lev;
	String room_No;
	String room_pic;
	String room_addprice;
	String room_addname;
	String room_addno;
	String room_price;
	
	
	public String getRoom_pic() {
		return room_pic;
	}

	public void setRoom_pic(String room_pic) {
		this.room_pic = room_pic;
	}

	public String getRoom_addprice() {
		return room_addprice;
	}

	public void setRoom_addprice(String room_addprice) {
		this.room_addprice = room_addprice;
	}

	public String getRoom_addname() {
		return room_addname;
	}

	public void setRoom_addname(String room_addname) {
		this.room_addname = room_addname;
	}
	
	
	public ReservVO(String room_lev) {
		this.room_lev=room_lev;
		
	}
	public ReservVO(String room_pic,String room_lev, String room_No) {
		this.room_lev = room_lev;
		this.room_No = room_No;
		this.room_pic =room_pic;
	}
	
	public ReservVO(String room_lev, String room_No) {
		this.room_lev = room_lev;
		this.room_No = room_No;
	}
	
	public ReservVO(String id, String name, String tel, String room_lev, String room_No, String room_addname , String room_addprice, String room_addno,String room_price) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.room_lev = room_lev;
		this.room_No = room_No;
		this.room_addname= room_addname;
		this.room_addprice = room_addprice;
		this.room_addno = room_addno;
		this.room_price = room_price;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public String getRoom_lev() {
		return room_lev;
	}
	public void setRoom_lev(String room_lev) {
		this.room_lev = room_lev;
	}
	public String getRoom_No() {
		return room_No;
	}
	public void setRoom_No(String room_No) {
		this.room_No = room_No;
	}
	public String getRoom_addno() {
		return room_addno;
	}

	public void setRoom_addno(String room_addno) {
		this.room_addno = room_addno;
	}

	public String getRoom_price() {
		return room_price;
	}

	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}
	@Override
	public String toString() {
		return "ReservVO [id=" + id + ", name=" + name + ", tel=" + tel + ", room_lev=" + room_lev + ", room_No="
				+ room_No + ", room_pic=" + room_pic + ", room_addprice=" + room_addprice + ", room_addname="
				+ room_addname + ", room_addno=" + room_addno + ", room_price=" + room_price + "]";
	}
	
	

}
