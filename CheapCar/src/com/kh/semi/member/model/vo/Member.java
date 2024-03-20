package com.kh.semi.member.model.vo;
import java.sql.Date;
public class Member {
	
	private int memberNo;
	private String memberId;
	private String memberName;
	private String memberPwd;
	private String birthday;
	private String phone;
	private String email;
	private Date enrollDate;
	private String memberStatus;
	public Member() {
		super();
	}
	public Member(int memberNo, String memberId, String memberName, String memberPwd, String birthday, String phone,
			String email, Date enrollDate, String memberStatus) {
		super();
		this.memberNo = memberNo;
		this.memberId = memberId;
		this.memberName = memberName;
		this.memberPwd = memberPwd;
		this.birthday = birthday;
		this.phone = phone;
		this.email = email;
		this.enrollDate = enrollDate;
		this.memberStatus = memberStatus;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getBirthday() {
		return birthday;
	}
	public void setBirthday(String birthday) {
		this.birthday = birthday;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public String getMemberStatus() {
		return memberStatus;
	}
	public void setMemberStatus(String memberStatus) {
		this.memberStatus = memberStatus;
	}
	@Override
	public String toString() {
		return "Member [memberNo=" + memberNo + ", memberId=" + memberId + ", memberName=" + memberName + ", memberPwd="
				+ memberPwd + ", birthday=" + birthday + ", phone=" + phone + ", email=" + email + ", enrollDate="
				+ enrollDate + ", memberStatus=" + memberStatus + "]";
	}
	
	
	
}