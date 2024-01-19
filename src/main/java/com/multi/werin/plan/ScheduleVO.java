package com.multi.werin.plan;

import java.sql.Date;
import java.sql.Timestamp;

public class ScheduleVO {
	public String schedule_id;
	public String schedule_title;
	public String schedule_map_lat;
	public String schedule_map_lon;
	public String schedule_day;
	public int schedule_plan_no;

	public String getSchedule_id() {
		return schedule_id;
	}

	public void setSchedule_id(String schedule_id) {
		this.schedule_id = schedule_id;
	}

	public String getSchedule_title() {
		return schedule_title;
	}

	public String getSchedule_day() {
		return schedule_day;
	}

	public void setSchedule_day(String schedule_day) {
		this.schedule_day = schedule_day;
	}

	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}

	public String getSchedule_map_lat() {
		return schedule_map_lat;
	}

	public void setSchedule_map_lat(String schedule_map_lat) {
		this.schedule_map_lat = schedule_map_lat;
	}

	public String getSchedule_map_lon() {
		return schedule_map_lon;
	}

	public void setSchedule_map_lon(String schedule_map_lon) {
		this.schedule_map_lon = schedule_map_lon;
	}

	
	
	public int getSchedule_plan_no() {
		return schedule_plan_no;
	}

	public void setSchedule_plan_no(int schedule_plan_no) {
		this.schedule_plan_no = schedule_plan_no;
	}

	@Override
	public String toString() {
		return "ScheduleVO [schedule_id=" + schedule_id + ", schedule_title=" + schedule_title + ", schedule_map_lat="
				+ schedule_map_lat + ", schedule_map_lon=" + schedule_map_lon + ", schedule_day=" + schedule_day
				+ ", schedule_plan_no=" + schedule_plan_no + "]";
	}

	

}
