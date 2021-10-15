package com.helloworks.spring.workshare.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.workshare.model.service.WorkShareService;

@Controller
public class WorkShareController {

	@Autowired
	private WorkShareService workShareService;
	
	// 메뉴바 -> 미확인 업무
	@RequestMapping("nCheckedWS.ws")
	public String unCheckedWorkShare() {
		System.out.println("미확인 업무 메인화면으로 이동");
		return "workShare/unCheckedworkShareList";
	}
	
	// 메뉴바 -> 수신 업무 내역
	@RequestMapping("recvListWS.ws")
	public String checkedWorkShare() {
		System.out.println("수신내역 메인화면으로 이동");
		return "workShare/recvWorkShareList";
	}
	
	// 메뉴바 -> 발신 업무 내역
	@RequestMapping("sendListWS.ws")
	public String workShareMain() {
		System.out.println("발신 업무 메인화면으로 이동");
		return "workShare/sendWorkShareList";
	}
	
}