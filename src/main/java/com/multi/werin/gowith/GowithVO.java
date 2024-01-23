package com.multi.werin.gowith;

public class GowithVO {
	private int num_id;
	private int gowith_id;
	private String gowith_title;
	private String gowith_content;
	private String gowith_writer;
	private String gowith_created_at;
	private int gowith_like;
	private int gowith_view;
	private int gowith_total_like;
	private int gowith_total_dislike;
	private String gowith_img;

	public int getNum_id() {
		return num_id;
	}

	public void setNum_id(int num_id) {
		this.num_id = num_id;
	}

	public int getGowith_id() {
		return gowith_id;
	}

	public void setGowith_id(int gowith_id) {
		this.gowith_id = gowith_id;
	}

	public String getGowith_title() {
		return gowith_title;
	}

	public void setGowith_title(String gowith_title) {
		this.gowith_title = gowith_title;
	}

	public String getGowith_content() {
		return gowith_content;
	}

	public void setGowith_content(String gowith_content) {
		this.gowith_content = gowith_content;
	}

	public String getGowith_writer() {
		return gowith_writer;
	}

	public void setGowith_writer(String gowith_writer) {
		this.gowith_writer = gowith_writer;
	}

	public String getGowith_created_at() {
		return gowith_created_at;
	}

	public void setGowith_created_at(String gowith_created_at) {
		this.gowith_created_at = gowith_created_at;
	}

	public int getGowith_like() {
		return gowith_like;
	}

	public void setGowith_like(int gowith_like) {
		this.gowith_like = gowith_like;
	}

	public int getGowith_view() {
		return gowith_view;
	}

	public void setGowith_view(int gowith_view) {
		this.gowith_view = gowith_view;
	}

	public int getGowith_total_like() {
		return gowith_total_like;
	}

	public void setGowith_total_like(int gowith_total_like) {
		this.gowith_total_like = gowith_total_like;
	}

	public int getGowith_total_dislike() {
		return gowith_total_dislike;
	}

	public void setGowith_total_dislike(int gowith_total_dislike) {
		this.gowith_total_dislike = gowith_total_dislike;
	}

	public String getGowith_img() {
		return gowith_img;
	}

	public void setGowith_img(String gowith_img) {
		this.gowith_img = gowith_img;
	}

	@Override
	public String toString() {
		return "GowithVO [num_id=" + num_id + ", gowith_id=" + gowith_id + ", gowith_title=" + gowith_title
				+ ", gowith_content=" + gowith_content + ", gowith_writer=" + gowith_writer + ", gowith_created_at="
				+ gowith_created_at + ", gowith_like=" + gowith_like + ", gowith_view=" + gowith_view
				+ ", gowith_total_like=" + gowith_total_like + ", gowith_total_dislike=" + gowith_total_dislike
				+ ", gowith_img=" + gowith_img + "]";
	}

}
