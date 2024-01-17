package com.multi.werin.landmark;

public class LandmarkInfoVO {
	
	private String landmarkinfo_name;
	private String landmarkinfo_info;
	private String landmarkinfo_pic;
	private double landmarkinfo_lat;
	private double landmarkinfo_lon;
	private int landmarkinfo_id;
	
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
	public String getLandmarkinfo_pic() {
		return landmarkinfo_pic;
	}
	public void setLandmarkinfo_pic(String landmarkinfo_pic) {
		this.landmarkinfo_pic = landmarkinfo_pic;
	}
	public double getLandmarkinfo_lat() {
		return landmarkinfo_lat;
	}
	public void setLandmarkinfo_lat(double landmarkinfo_lat) {
		this.landmarkinfo_lat = landmarkinfo_lat;
	}
	public double getLandmarkinfo_lon() {
		return landmarkinfo_lon;
	}
	public void setLandmarkinfo_lon(double landmarkinfo_lon) {
		this.landmarkinfo_lon = landmarkinfo_lon;
	}
	public int getLandmarkinfo_id() {
		return landmarkinfo_id;
	}
	public void setLandmarkinfo_id(int landmarkinfo_id) {
		this.landmarkinfo_id = landmarkinfo_id;
	}
	
	@Override
	public String toString() {
		return "LandmarkInfoVO [landmarkinfo_name=" + landmarkinfo_name + ", landmarkinfo_info=" + landmarkinfo_info
				+ ", landmarkinfo_pic=" + landmarkinfo_pic + ", landmarkinfo_lat=" + landmarkinfo_lat
				+ ", landmarkinfo_lon=" + landmarkinfo_lon + ", landmarkinfo_id=" + landmarkinfo_id + "]";
	}
	


	
	
	
	
	
}
