package com.multi.werin.main;

public class SearchTripVO {
	private int trip_id;
	private String trip_title;
	private String trip_content;
	private int row_no;
	
	public String getTrip_content() {
		return trip_content;
	}
	public void setTrip_content(String trip_content) {
		this.trip_content = trip_content;
	}
	
	public int getRow_no() {
		return row_no;
	}
	public void setRow_no(int row_no) {
		this.row_no = row_no;
	}
	private String searching;
	
	
	public String getSearching() {
		return searching;
	}
	public void setSearching(String searching) {
		this.searching = searching;
	}
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
		return "SearchTripVO [trip_id=" + trip_id + ", trip_title=" + trip_title + ", trip_content=" + trip_content
				+ ", row_no=" + row_no + ", searching=" + searching + "]";
	}	
}
