package com.multi.werin.trip;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class TripVO {
	private int trip_id;
	private String trip_title;
	private String trip_content;
	private String trip_country;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date trip_start_date;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date trip_end_date;
	private String trip_writer;
	private Date trip_writedate;
	private int trip_count;
	private int trip_like;
	private String trip_img;
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
	public String getTrip_content() {
		return trip_content;
	}
	public void setTrip_content(String trip_content) {
		this.trip_content = trip_content;
	}
	public String getTrip_country() {
		return trip_country;
	}
	public void setTrip_country(String trip_country) {
		this.trip_country = trip_country;
	}
	public Date getTrip_start_date() {
		return trip_start_date;
	}
	public void setTrip_start_date(Date trip_start_date) {
		this.trip_start_date = trip_start_date;
	}
	public Date getTrip_end_date() {
		return trip_end_date;
	}
	public void setTrip_end_date(Date trip_end_date) {
		this.trip_end_date = trip_end_date;
	}
	public String getTrip_writer() {
		return trip_writer;
	}
	public void setTrip_writer(String trip_writer) {
		this.trip_writer = trip_writer;
	}
	public Date getTrip_writedate() {
		return trip_writedate;
	}
	public void setTrip_writedate(Date trip_writedate) {
		this.trip_writedate = trip_writedate;
	}
	public int getTrip_count() {
		return trip_count;
	}
	public void setTrip_count(int trip_count) {
		this.trip_count = trip_count;
	}
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
	@Override
	public String toString() {
		return "TripVO [trip_id=" + trip_id + ", trip_title=" + trip_title + ", trip_content=" + trip_content
				+ ", trip_country=" + trip_country + ", trip_start_date=" + trip_start_date + ", trip_end_date="
				+ trip_end_date + ", trip_writer=" + trip_writer + ", trip_writedate=" + trip_writedate
				+ ", trip_count=" + trip_count + ", trip_like=" + trip_like + ", trip_img=" + trip_img + "]";
	}
	
	
	
}
