package com.multi.werin.bbs;

public class BbscmtVO {
	private int bbscmt_id;
	private int bbs_id;
	private String bbscmt_writer;
	private String bbscmt_content;
	private String bbscmt_created_at;
	private String bbscmt_updated_at;
	public int getBbscmt_id() {
		return bbscmt_id;
	}
	public void setBbscmt_id(int bbscmt_id) {
		this.bbscmt_id = bbscmt_id;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getBbscmt_writer() {
		return bbscmt_writer;
	}
	public void setBbscmt_writer(String bbscmt_writer) {
		this.bbscmt_writer = bbscmt_writer;
	}
	public String getBbscmt_content() {
		return bbscmt_content;
	}
	public void setBbscmt_content(String bbscmt_content) {
		this.bbscmt_content = bbscmt_content;
	}
	public String getBbscmt_created_at() {
		return bbscmt_created_at;
	}
	public void setBbscmt_created_at(String bbscmt_created_at) {
		this.bbscmt_created_at = bbscmt_created_at;
	}
	public String getBbscmt_updated_at() {
		return bbscmt_updated_at;
	}
	public void setBbscmt_updated_at(String bbscmt_updated_at) {
		this.bbscmt_updated_at = bbscmt_updated_at;
	}
	@Override
	public String toString() {
		return "BbscmtVO [bbscmt_id=" + bbscmt_id + ", bbs_id=" + bbs_id + ", bbscmt_writer=" + bbscmt_writer
				+ ", bbscmt_content=" + bbscmt_content + ", bbscmt_created_at=" + bbscmt_created_at
				+ ", bbscmt_updated_at=" + bbscmt_updated_at + "]";
	}
	
	
}
