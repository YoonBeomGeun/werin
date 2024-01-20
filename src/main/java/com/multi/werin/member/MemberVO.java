package com.multi.werin.member;

public class MemberVO {
	private String member_id;
	private String member_pw;
	private String member_name;
	private String member_nickname;
	private String member_tel;
	private String member_email;
	private String member_gender;
	private int member_level;
	/* private String member_grade; */
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public String getMember_pw() {
		return member_pw;
	}
	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}
	public String getMember_name() {
		return member_name;
	}
	public void setMember_name(String member_name) {
		this.member_name = member_name;
	}
	public String getMember_nickname() {
		return member_nickname;
	}
	public void setMember_nickname(String member_nickname) {
		this.member_nickname = member_nickname;
	}
	public String getMember_tel() {
		return member_tel;
	}
	public void setMember_tel(String member_tel) {
		this.member_tel = member_tel;
	}
	public String getMember_email() {
		return member_email;
	}
	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}
	public String getMember_gender() {
		return member_gender;
	}
	public void setMember_gender(String member_gender) {
		this.member_gender = member_gender;
	}
	public int getMember_level() {
		return member_level;
	}
	public void setMember_level(int member_level) {
		this.member_level = member_level;
	}

	/*
	 * public String getMember_grade() { return member_grade; } public void
	 * setMember_grade(String member_grade) { this.member_grade = member_grade; }
	 */
	@Override
	public String toString() {
		return "MemberVO [member_id=" + member_id + ", member_pw=" + member_pw + ", member_name=" + member_name
				+ ", member_nickname=" + member_nickname + ", member_tel=" + member_tel + ", member_email="
				+ member_email + ", member_gender=" + member_gender + ", member_level=" + member_level
				+ ", member_grade=" + /* member_grade + */"]";
	}
}
