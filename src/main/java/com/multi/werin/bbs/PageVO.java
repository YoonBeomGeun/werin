package com.multi.werin.bbs;

public class PageVO {
	
	private int start;
	private int end;
	private int page;
	private String type;
	private String keyword;
	private int pages;
	private String kind;
	public void setStartEnd() {
		start = 1 + (page -1) * 10;
	//			1 + (1 - 1) * 10 = 1
	//			1 + (2 - 1) * 10 = 11
	//			1 + (3 - 1) * 10 = 21
		end = page * 10;
	//        1 * 10 = 10
	//		  2 * 10 = 20
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
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getPages() {
		return pages;
	}
	public void setPages(int pages) {
		this.pages = pages;
	}
	
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	@Override
	public String toString() {
		return "PageVO [start=" + start + ", end=" + end + ", page=" + page + ", type=" + type + ", keyword=" + keyword
				+ ", pages=" + pages + ", kind=" + kind + "]";
	}
	
	
	
	
	
	

	
}
