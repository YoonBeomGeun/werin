package com.multi.werin.main;

public class SearchLandmarkVO {
	
	private int landmarkinfo_id;
	private String landmarkinfo_name;
	private String overview;
	private int row_no;
	
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
	public int getLandmarkinfo_id() {
		return landmarkinfo_id;
	}
	public void setLandmarkinfo_id(int landmarkinfo_id) {
		this.landmarkinfo_id = landmarkinfo_id;
	}
	public String getLandmarkinfo_name() {
		return landmarkinfo_name;
	}
	public void setLandmarkinfo_name(String landmarkinfo_name) {
		this.landmarkinfo_name = landmarkinfo_name;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	@Override
	public String toString() {
		return "SearchLandmarkVO [landmarkinfo_id=" + landmarkinfo_id + ", landmarkinfo_name=" + landmarkinfo_name
				+ ", overview=" + overview + ", row_no=" + row_no + ", searching=" + searching + "]";
	}
}
