package com.multi.werin.bbs;

public class BbsVO {
	private int num_id;
	private int bbs_id;
	private String bbs_cate;
	private String bbs_title;
	private String bbs_content;
	private String bbs_writer;
	private String bbs_created_at;
	private int bbs_total_like;
	private int bbs_view;
	private String bbs_img;
	private String type;
	private String keyword;
	public int getNum_id() {
		return num_id;
	}
	public void setNum_id(int num_id) {
		this.num_id = num_id;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getBbs_cate() {
		return bbs_cate;
	}
	public void setBbs_cate(String bbs_cate) {
		this.bbs_cate = bbs_cate;
	}
	public String getBbs_title() {
		return bbs_title;
	}
	public void setBbs_title(String bbs_title) {
		this.bbs_title = bbs_title;
	}
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public String getBbs_writer() {
		return bbs_writer;
	}
	public void setBbs_writer(String bbs_writer) {
		this.bbs_writer = bbs_writer;
	}
	public String getBbs_created_at() {
		return bbs_created_at;
	}
	public void setBbs_created_at(String bbs_created_at) {
		this.bbs_created_at = bbs_created_at;
	}
	
	public int getBbs_view() {
		return bbs_view;
	}
	public void setBbs_view(int bbs_view) {
		this.bbs_view = bbs_view;
	}
	public String getBbs_img() {
		return bbs_img;
	}
	public void setBbs_img(String bbs_img) {
		this.bbs_img = bbs_img;
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
	public int getBbs_total_like() {
		return bbs_total_like;
	}
	public void setBbs_total_like(int bbs_total_like) {
		this.bbs_total_like = bbs_total_like;
	}
	@Override
	public String toString() {
		return "BbsVO [num_id=" + num_id + ", bbs_id=" + bbs_id + ", bbs_cate=" + bbs_cate + ", bbs_title=" + bbs_title
				+ ", bbs_content=" + bbs_content + ", bbs_writer=" + bbs_writer + ", bbs_created_at=" + bbs_created_at
				+ ", bbs_total_like=" + bbs_total_like + ", bbs_view=" + bbs_view + ", bbs_img=" + bbs_img + ", type="
				+ type + ", keyword=" + keyword + "]";
	}
	
	
	
	
	
	
	
}
