package com.multi.werin.chat;

public class RoomVO {
	private int room_id;
	private String room_name;
	private int gowith_id;
	private String room_host;
	private String room_member;
	private String room_created_at;
	private String room_flag;

	public int getRoom_id() {
		return room_id;
	}

	public void setRoom_id(int room_id) {
		this.room_id = room_id;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public int getGowith_id() {
		return gowith_id;
	}

	public void setGowith_id(int gowith_id) {
		this.gowith_id = gowith_id;
	}

	public String getRoom_host() {
		return room_host;
	}

	public void setRoom_host(String room_host) {
		this.room_host = room_host;
	}

	public String getRoom_member() {
		return room_member;
	}

	public void setRoom_member(String room_member) {
		this.room_member = room_member;
	}

	public String getRoom_created_at() {
		return room_created_at;
	}

	public void setRoom_created_at(String room_created_at) {
		this.room_created_at = room_created_at;
	}

	public String getRoom_flag() {
		return room_flag;
	}

	public void setRoom_flag(String room_flag) {
		this.room_flag = room_flag;
	}

	@Override
	public String toString() {
		return "RoomVO [room_id=" + room_id + ", room_name=" + room_name + ", gowith_id=" + gowith_id + ", room_host="
				+ room_host + ", room_member=" + room_member + ", room_created_at=" + room_created_at + ", room_flag="
				+ room_flag + "]";
	}

}
