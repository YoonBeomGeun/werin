package com.multi.werin.main;

public class SearchTripVO {
	private int trip_id;
	private String trip_title;
	
	public int getTrip_id() {
		return trip_id;
	}
	public void setTrip_id(int trip_id) {
		this.trip_id = trip_id;
	}
	public String getTrip_title() {
		return trip_title;
	}
	public void setTrip_title(String trip_title) {
		this.trip_title = trip_title;
	}
	
	@Override
	public String toString() {
		return "SearchTripVO [trip_id=" + trip_id + ", trip_title=" + trip_title + "]";
	}
}
