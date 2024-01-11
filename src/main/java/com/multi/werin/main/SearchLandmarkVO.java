package com.multi.werin.main;

public class SearchLandmarkVO {
	
	private int landmarkinfo_id;
	private String landmarkinfo_name;
	private String landmarkinfo_info;
	
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
	public String getLandmarkinfo_info() {
		return landmarkinfo_info;
	}
	public void setLandmarkinfo_info(String landmarkinfo_info) {
		this.landmarkinfo_info = landmarkinfo_info;
	}
	
	@Override
	public String toString() {
		return "SearchBbsVO [landmarkinfo_id=" + landmarkinfo_id + ", landmarkinfo_name=" + landmarkinfo_name
				+ ", landmarkinfo_info=" + landmarkinfo_info + "]";
	}
}
