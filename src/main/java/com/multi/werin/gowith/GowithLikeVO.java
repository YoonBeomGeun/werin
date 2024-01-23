package com.multi.werin.gowith;

public class GowithLikeVO {

	private int like_id;
	private int gowith_id;
	private String member_id;
	private int like_state;

	public int getLike_id() {
		return like_id;
	}

	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}

	public int getGowith_id() {
		return gowith_id;
	}

	public void setGowith_id(int gowith_id) {
		this.gowith_id = gowith_id;
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
		return "GowithLikeVO [like_id=" + like_id + ", gowith_id=" + gowith_id + ", member_id=" + member_id
				+ ", like_state=" + like_state + "]";
	}

}
