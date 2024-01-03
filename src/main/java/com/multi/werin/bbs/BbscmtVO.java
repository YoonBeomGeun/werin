package com.multi.werin.bbs;

public class BbscmtVO {
	private int comment_id;
	private int post_id;
	private String writer;
	private String content;
	private String created_at;
	private String updated_at;
	private int bbscmt_like;
	
	public int getComment_id() {
		return comment_id;
	}
	public void setComment_id(int comment_id) {
		this.comment_id = comment_id;
	}
	public int getPost_id() {
		return post_id;
	}
	public void setPost_id(int post_id) {
		this.post_id = post_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getCreated_at() {
		return created_at;
	}
	public void setCreated_at(String created_at) {
		this.created_at = created_at;
	}
	public String getUpdated_at() {
		return updated_at;
	}
	public void setUpdated_at(String updated_at) {
		this.updated_at = updated_at;
	}
	public int getBbscmt_like() {
		return bbscmt_like;
	}
	public void setBbscmt_like(int bbscmt_like) {
		this.bbscmt_like = bbscmt_like;
	}
	@Override
	public String toString() {
		return "BbscmtVO [comment_id=" + comment_id + ", post_id=" + post_id + ", writer=" + writer + ", content="
				+ content + ", created_at=" + created_at + ", updated_at=" + updated_at + ", bbscmt_like=" + bbscmt_like
				+ "]";
	}
	
	
}
