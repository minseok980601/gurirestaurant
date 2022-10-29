package kr.guri.restaurant.main.dto;

public class Criteria {

	private int page;
	private int perPageNum;
	private int rowStart;
	private int rowEnd;
	private String id;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	
	public Criteria() {
		this.page = 1;
		this.perPageNum = 10;
	}
	

	public void setPage(int page) {
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return perPageNum;
	}

	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	public void setRowStart(int rowStart) {
		this.rowStart = rowStart;
	}
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}
	public void setRowEnd(int rowEnd) {
		this.rowEnd = rowEnd;
	}

	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "" + 
				", rowStart=" + getRowStart() + ", rowEnd=" + getRowEnd() + "]";
	}
	
	
}
