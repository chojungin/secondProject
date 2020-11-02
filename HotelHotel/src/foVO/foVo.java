package foVO;

import java.util.Date;

public class foVo {

	
	private int num;
	private String writer;
	private String subject;
	private String wriDate;
	private int readcnt;
	private String content;
	private int remove;
	private int cat;
	public foVo(int num, String writer, String subject, String content, int readcnt, String wriDate) {
		// TODO Auto-generated constructor stub
		
		this.num = num;
		this.writer=writer;
		this.subject=subject;
		this.content=content;
		this.readcnt=readcnt;
		this.wriDate=wriDate;
		
		
	}
	
	
	public foVo(int num, int cat, String writer, String subject, String content, int readcnt, String wriDate) {
		// TODO Auto-generated constructor stub
		
		this.num = num;
		this.cat = cat;
		this.writer=writer;
		this.subject=subject;
		this.content=content;
		this.readcnt=readcnt;
		this.wriDate=wriDate;
		
		
	}
	
	private int num2;
	private String writer2;
	private String content2;
	private String wriDate2;
	
	public foVo(int num2, String writer2, String content2, String wriDate2) {
		// TODO Auto-generated constructor stub
		this.num2=num2;
		this.writer2 = writer2;
		this.content2 = content2;
		this.wriDate2 = wriDate2;
		
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getWriDate() {
		return wriDate;
	}
	public void setWriDate(String wriDate) {
		this.wriDate = wriDate;
	}
	public int getReadcnt() {
		return readcnt;
	}
	public void setReadcnt(int readcnt) {
		this.readcnt = readcnt;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getRemove() {
		return remove;
	}
	public void setRemove(int remove) {
		this.remove = remove;
	}
	public int getCat() {
		return cat;
	}


	public void setCat(int cat) {
		this.cat = cat;
	}


	public int getNum2() {
		return num2;
	}
	public void setNum2(int num2) {
		this.num2 = num2;
	}
	public String getWriter2() {
		return writer2;
	}
	public void setWriter2(String writer2) {
		this.writer2 = writer2;
	}
	public String getContent2() {
		return content2;
	}
	public void setContent2(String content2) {
		this.content2 = content2;
	}
	public String getWriDate2() {
		return wriDate2;
	}
	public void setWriDate2(String wriDate2) {
		this.wriDate2 = wriDate2;
	}
	
	
}
