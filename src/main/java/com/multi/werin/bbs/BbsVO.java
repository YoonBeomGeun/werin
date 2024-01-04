package com.multi.werin.bbs;

public class BbsVO {
	private int num_id;
	private int bbs_id;
	private String cate;
	private String title;
	private String content;
	private String writer;
	private String created_at;
	private int bbs_like;
	private int bbs_view;
	private String bbs_img;
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getCate() {
		return cate;
	}
	public void setCate(String cate) {
		this.cate = cate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public int getBbs_like() {
		return bbs_like;
	}
	public void setBbs_like(int bbs_like) {
		this.bbs_like = bbs_like;
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
	
	public int getNum_id() {
		return num_id;
	}
	public void setNum_id(int num_id) {
		this.num_id = num_id;
	}
	@Override
	public String toString() {
		return "BbsVO [num_id=" + num_id + ", bbs_id=" + bbs_id + ", cate=" + cate + ", title=" + title + ", content="
				+ content + ", writer=" + writer + ", created_at=" + created_at + ", bbs_like=" + bbs_like
				+ ", bbs_view=" + bbs_view + ", bbs_img=" + bbs_img + "]";
	}
	
	
	
	
}
