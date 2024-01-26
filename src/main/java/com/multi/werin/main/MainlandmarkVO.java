package com.multi.werin.main;

public class MainlandmarkVO {

	private String landmarkinfo_pic;
	private int landmarkinfo_id;
	private String landmarkinfo_name;
	
	public String getLandmarkinfo_pic() {
		return landmarkinfo_pic;
	}
	public void setLandmarkinfo_pic(String landmarkinfo_pic) {
		this.landmarkinfo_pic = landmarkinfo_pic;
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
	
	@Override
	public String toString() {
		return "MainlandmarkVO [landmarkinfo_pic=" + landmarkinfo_pic + ", landmarkinfo_id=" + landmarkinfo_id
				+ ", landmarkinfo_name=" + landmarkinfo_name + "]";
	}
}
