package kr.guri.restaurant.main.dto;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("commentDTO")
public class CommentDTO {

	private int com_num;
	private String id;
	private int gr_num;
	private String com_comment;
	private Date com_date;
	
	public CommentDTO() {
		// TODO Auto-generated constructor stub
	}

	public CommentDTO(int com_num, String id, int gr_num, String com_comment, Date com_date) {
		super();
		this.com_num = com_num;
		this.id = id;
		this.gr_num = gr_num;
		this.com_comment = com_comment;
		this.com_date = com_date;
	}

	public int getCom_num() {
		return com_num;
	}

	public void setCom_num(int com_num) {
		this.com_num = com_num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getGr_num() {
		return gr_num;
	}

	public void setGr_num(int gr_num) {
		this.gr_num = gr_num;
	}

	public String getCom_comment() {
		return com_comment;
	}

	public void setCom_comment(String com_comment) {
		this.com_comment = com_comment;
	}

	public Date getCom_date() {
		return com_date;
	}

	public void setCom_date(Date com_date) {
		this.com_date = com_date;
	}
	
}
