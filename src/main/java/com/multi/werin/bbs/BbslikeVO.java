package com.multi.werin.bbs;

public class BbslikeVO {
	private  int like_id;
	private  int bbs_id;
	private String member_id;
	private int like_state;
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(int bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getLike_state() {
		return like_state;
	}
	public void setLike_state(int like_state) {
		this.like_state = like_state;
	}
	@Override
	public String toString() {
		return "BbslikeVO [like_id=" + like_id + ", bbs_id=" + bbs_id + ", member_id=" + member_id + ", like_state="
				+ like_state + "]";
	}
	
	
}
