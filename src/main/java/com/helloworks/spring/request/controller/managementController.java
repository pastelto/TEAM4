package com.helloworks.spring.request.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.helloworks.spring.request.model.vo.Mtr;


@Controller
public class managementController {
	
	//회의실 관리 페이지로 전환
	@RequestMapping("manage.mtr")
	public String manageMtr(Model m) {
		System.out.println("회의실 관리페이지");
		
		ArrayList<Mtr> list = requestService.manageMtr();
		
		System.out.println("list "+ list);
		
		m.addAttribute("list", list);
		
		return "request/manageMeetingRoom";
	}

	// 회의실 등록 팝업 페이지로 
	@RequestMapping("openAdd.mtr")
	public String openAddMtr() {
		System.out.println("회의실 등록페이지 팝업");
		return "request/addMeetingRoom";
	}
	
	//회의실 등록 페이지
		@RequestMapping("add.mtr")
		public String addMtr(Mtr mtr, HttpServletRequest request, Model model) {
			System.out.println("회의실 등록페이지");
			System.out.println(mtr);
			
			
			
			return "request/addMeetingRoom";
		}
	
	
	//차량 관리 페이지로 전환
	@RequestMapping("manage.car")
	public String manageCar() {
		System.out.println("차량 관리페이지");
		return "request/manageCar";
	}
}
