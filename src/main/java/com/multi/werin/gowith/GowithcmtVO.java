package com.multi.werin.gowith;

public class GowithcmtVO {
	private int gowithcmt_id;
	private int gowith_id;
	private String gowithcmt_writer;
	private String gowithcmt_content;
	private String gowithcmt_created_at;
	private String gowithcmt_updated_at;

	public int getGowithcmt_id() {
		return gowithcmt_id;
	}

	public void setGowithcmt_id(int gowithcmt_id) {
		this.gowithcmt_id = gowithcmt_id;
	}

	public int getGowith_id() {
		return gowith_id;
	}

	public void setGowith_id(int gowith_id) {
		this.gowith_id = gowith_id;
	}

	public String getGowithcmt_writer() {
		return gowithcmt_writer;
	}

	public void setGowithcmt_writer(String gowithcmt_writer) {
		this.gowithcmt_writer = gowithcmt_writer;
	}

	public String getGowithcmt_content() {
		return gowithcmt_content;
	}

	public void setGowithcmt_content(String gowithcmt_content) {
		this.gowithcmt_content = gowithcmt_content;
	}

	public String getGowithcmt_created_at() {
		return gowithcmt_created_at;
	}

	public void setGowithcmt_created_at(String gowithcmt_created_at) {
		this.gowithcmt_created_at = gowithcmt_created_at;
	}

	public String getGowithcmt_updated_at() {
		return gowithcmt_updated_at;
	}

	public void setGowithcmt_updated_at(String gowithcmt_updated_at) {
		this.gowithcmt_updated_at = gowithcmt_updated_at;
	}

	@Override
	public String toString() {
		return "GowithcmtVO [gowithcmt_id=" + gowithcmt_id + ", gowith_id=" + gowith_id + ", gowithcmt_writer="
				+ gowithcmt_writer + ", gowithcmt_content=" + gowithcmt_content + ", gowithcmt_created_at="
				+ gowithcmt_created_at + ", gowithcmt_updated_at=" + gowithcmt_updated_at + "]";
	}
}
