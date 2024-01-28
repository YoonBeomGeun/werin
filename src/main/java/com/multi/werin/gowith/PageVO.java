package com.multi.werin.gowith;

public class PageVO {
	
	private int start;
	private int end;
	private int page;
	
	public void setStartEnd() {
		start = 1 + (page -1) * 9;
		end = page * 9;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "PageVO [start=" + start + ", end=" + end + ", page=" + page + "]";
	}

	
}
