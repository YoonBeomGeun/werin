package com.multi.werin.trip;

public class TripLikeVO {
	private int like_id;
	private int trip_id;
	private String member_id;
	private int like_state;
	private int like_check;
	
	
	public int getLike_check() {
		return like_check;
	}
	public void setLike_check(int like_check) {
		this.like_check = like_check;
	}
	public int getLike_id() {
		return like_id;
	}
	public void setLike_id(int like_id) {
		this.like_id = like_id;
	}
	public int getTrip_id() {
		return trip_id;
	}
	public void setTrip_id(int trip_id) {
		this.trip_id = trip_id;
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
		return "TripLikeVO [like_id=" + like_id + ", trip_id=" + trip_id + ", member_id=" + member_id + ", like_state="
				+ like_state + ", like_check=" + like_check + "]";
	}
	
	
	
}
