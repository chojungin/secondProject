package room.roomVO;

/*
CREATE TABLE hotel.ROOM( --객실 테이블
	ROOM_LEV VARCHAR2(30), --객실등급
	ROOM_NO VARCHAR2(30), --객실 호수
	CONSTRAINT ROOM_FK FOREIGN KEY(ROOM_LEV) REFERENCES hotel.ROOM_INFO(ROOM_LEV)
);

COMMENT ON TABLE hotel.ROOM IS '객실 테이블';
COMMENT ON COLUMN hotel.ROOM.ROOM_LEV IS '객실 등급';
COMMENT ON COLUMN hotel.ROOM.ROOM_NO IS '객실 호수';

INSERT INTO hotel.ROOM VALUES('standard-single','201');
INSERT INTO hotel.ROOM VALUES('standard-double','202');
INSERT INTO hotel.ROOM VALUES('standard-twin','203');

*/

public class RoomVO {
	
	private String room_lev;
	private String room_no;
	private String room_pic;
	private String room_price;
	
	public RoomVO() {}
	
	public RoomVO(String room_lev, String room_no, String room_pic) {
		//super();
		this.room_lev = room_lev;
		this.room_no = room_no;
		this.room_pic = room_pic;
	}
	
	public RoomVO(String room_lev, String room_no, String room_pic, String room_price) {
		//super();
		this.room_lev = room_lev;
		this.room_no = room_no;
		this.room_pic = room_pic;
		this.room_price = room_price;
	}
	
	public String getRoom_lev() {
		return room_lev;
	}
	public void setRoom_lev(String room_lev) {
		this.room_lev = room_lev;
	}
	public String getRoom_no() {
		return room_no;
	}
	public void setRoom_no(String room_no) {
		this.room_no = room_no;
	}
	public String getRoom_pic() {
		return room_pic;
	}
	public void setRoom_pic(String room_pic) {
		this.room_pic = room_pic;
	}
	public String getRoom_price() {
		return room_price;
	}
	public void setRoom_price(String room_price) {
		this.room_price = room_price;
	}

		
}
