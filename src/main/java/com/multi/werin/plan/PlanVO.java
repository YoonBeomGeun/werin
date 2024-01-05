package com.multi.werin.plan;

import java.sql.Date;

public class PlanVO {
	public int plan_no;
	public String plan_title;
	public Date plan_start_date;
	public Date plan_end_date;
	public String plan_writer;
	public String plan_with;
	public int getPlan_no() {
		return plan_no;
	}
	public void setPlan_no(int plan_no) {
		this.plan_no = plan_no;
	}
	public String getPlan_title() {
		return plan_title;
	}
	public void setPlan_title(String plan_title) {
		this.plan_title = plan_title;
	}
	public Date getPlan_start_date() {
		return plan_start_date;
	}
	public void setPlan_start_date(Date plan_start_date) {
		this.plan_start_date = plan_start_date;
	}
	public Date getPlan_end_date() {
		return plan_end_date;
	}
	public void setPlan_end_date(Date plan_end_date) {
		this.plan_end_date = plan_end_date;
	}
	public String getPlan_writer() {
		return plan_writer;
	}
	public void setPlan_writer(String plan_writer) {
		this.plan_writer = plan_writer;
	}
	public String getPlan_with() {
		return plan_with;
	}
	public void setPlan_with(String plan_with) {
		this.plan_with = plan_with;
	}
	@Override
	public String toString() {
		return "PlanVO [plan_no=" + plan_no + ", plan_title=" + plan_title + ", plan_start_date=" + plan_start_date
				+ ", plan_end_date=" + plan_end_date + ", plan_writer=" + plan_writer + ", plan_with=" + plan_with
				+ "]";
	}
}
