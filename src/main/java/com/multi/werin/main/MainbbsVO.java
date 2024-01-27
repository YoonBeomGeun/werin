package com.multi.werin.main;

public class MainbbsVO {
	
	private int bbs_total_like;
	private String bbs_title;
	private int bbs_id;
	
	public int getBbs_total_like() {
		return bbs_total_like;
	}
	public void setBbs_total_like(int bbs_total_like) {
		this.bbs_total_like = bbs_total_like;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	
	@Override
	public String toString() {
		return "MainbbsVO [bbs_total_like=" + bbs_total_like + ", bbs_title=" + bbs_title + ", bbs_id=" + bbs_id + "]";
	}
	
}
