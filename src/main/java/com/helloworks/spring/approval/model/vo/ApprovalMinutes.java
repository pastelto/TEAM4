package com.helloworks.spring.approval.model.vo;

public class ApprovalMinutes extends Approval{

	private String title; 		// 회의 이름
	private String Attendees;	// 회의 참석자 
	
	public ApprovalMinutes() {
		// TODO Auto-generated constructor stub
	}

	public ApprovalMinutes(int apNo, String title, String attendees) {
		super(apNo);
		this.title = title;
		Attendees = attendees;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAttendees() {
		return Attendees;
	}

	public void setAttendees(String attendees) {
		Attendees = attendees;
	}
	
	
}
