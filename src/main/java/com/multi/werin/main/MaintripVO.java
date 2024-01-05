package com.multi.werin.main;

public class MaintripVO {
	
	private int trip_like;
	private String trip_img;
	private String trip_title;
	private int trip_id;
	
	public int getTrip_like() {
		return trip_like;
	}
	public void setTrip_like(int trip_like) {
		this.trip_like = trip_like;
	}
	public String getTrip_img() {
		return trip_img;
	}
	public void setTrip_img(String trip_img) {
		this.trip_img = trip_img;
	}
	public String getTrip_title() {
		return trip_title;
	}
	public void setTrip_title(String trip_title) {
		this.trip_title = trip_title;
	}
	public int getTrip_id() {
		return trip_id;
	}
	public void setTrip_id(int trip_id) {
		this.trip_id = trip_id;
	}
	
	@Override
	public String toString() {
		return "MaintripVO [trip_like=" + trip_like + ", trip_img=" + trip_img + ", trip_title=" + trip_title
				+ ", trip_id=" + trip_id + "]";
	}
	
}
