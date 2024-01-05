package com.multi.werin.plan;

import java.sql.Date;
import java.sql.Timestamp;

public class ScheduleVO {
	public String schedule_id;
	public String schedule_title;
	public Timestamp schedule_start_date_time;
	public Timestamp schedule_end_date_time;
	public String schedule_memo;
	public int schedule_map_id;
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
	public void setSchedule_title(String schedule_title) {
		this.schedule_title = schedule_title;
	}
	public Timestamp getSchedule_start_date_time() {
		return schedule_start_date_time;
	}
	public void setSchedule_start_date_time(Timestamp schedule_start_date_time) {
		this.schedule_start_date_time = schedule_start_date_time;
	}
	public Timestamp getSchedule_end_date_time() {
		return schedule_end_date_time;
	}
	public void setSchedule_end_date_time(Timestamp schedule_end_date_time) {
		this.schedule_end_date_time = schedule_end_date_time;
	}
	public String getSchedule_memo() {
		return schedule_memo;
	}
	public void setSchedule_memo(String schedule_memo) {
		this.schedule_memo = schedule_memo;
	}
	public int getSchedule_map_id() {
		return schedule_map_id;
	}
	public void setSchedule_map_id(int schedule_map_id) {
		this.schedule_map_id = schedule_map_id;
	}
	public int getSchedule_plan_no() {
		return schedule_plan_no;
	}
	public void setSchedule_plan_no(int schedule_plan_no) {
		this.schedule_plan_no = schedule_plan_no;
	}
	@Override
	public String toString() {
		return "ScheduleVO [schedule_id=" + schedule_id + ", schedule_title=" + schedule_title
				+ ", schedule_start_date_time=" + schedule_start_date_time + ", schedule_end_date_time="
				+ schedule_end_date_time + ", schedule_memo=" + schedule_memo + ", schedule_map_id=" + schedule_map_id
				+ ", schedule_plan_no=" + schedule_plan_no + "]";
	}
	
	
}
