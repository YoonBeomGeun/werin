package com.multi.werin.plan;

public class MapVO {
	public int map_id;
	public double map_location_x;
	public double map_location_y;
	public String map_address;
	public String map_address_detail;
	public String map_image;
	public int getMap_id() {
		return map_id;
	}
	public void setMap_id(int map_id) {
		this.map_id = map_id;
	}
	public double getMap_location_x() {
		return map_location_x;
	}
	public void setMap_location_x(double map_location_x) {
		this.map_location_x = map_location_x;
	}
	public double getMap_location_y() {
		return map_location_y;
	}
	public void setMap_location_y(double map_location_y) {
		this.map_location_y = map_location_y;
	}
	public String getMap_address() {
		return map_address;
	}
	public void setMap_address(String map_address) {
		this.map_address = map_address;
	}
	public String getMap_address_detail() {
		return map_address_detail;
	}
	public void setMap_address_detail(String map_address_detail) {
		this.map_address_detail = map_address_detail;
	}
	public String getMap_image() {
		return map_image;
	}
	public void setMap_image(String map_image) {
		this.map_image = map_image;
	}
	@Override
	public String toString() {
		return "MapVO [map_id=" + map_id + ", map_location_x=" + map_location_x + ", map_location_y=" + map_location_y
				+ ", map_address=" + map_address + ", map_address_detail=" + map_address_detail + ", map_image="
				+ map_image + "]";
	}
	
	
}
