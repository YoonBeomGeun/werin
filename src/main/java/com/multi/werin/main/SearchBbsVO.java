package com.multi.werin.main;

public class SearchBbsVO {	
	
	private int bbs_id;
	private String bbs_title;
	private String searching;
	
	
	public String getSearching() {
		return searching;
	}
	public void setSearching(String searching) {
		this.searching = searching;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	
	@Override
	public String toString() {
		return "SearchBbsVO [bbs_id=" + bbs_id + ", bbs_title=" + bbs_title + ", searching=" + searching + "]";
	}
	
}
