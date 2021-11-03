package com.helloworks.spring.employee.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.helloworks.spring.attendance.model.service.AttendanceService;
import com.helloworks.spring.attendance.model.vo.Attendance;
import com.helloworks.spring.employee.model.service.EmployeeService;
import com.helloworks.spring.employee.model.vo.Employee;
import com.helloworks.spring.notice.model.service.NoticeService;
import com.helloworks.spring.notice.model.vo.Notice;
import com.helloworks.spring.vacation.model.service.VacationService;
import com.helloworks.spring.vacation.model.vo.LoginUserVacation;


@SessionAttributes("loginUser")
@Controller
public class EmployeeController {
	
	
	@Autowired 
	private EmployeeService employeeService;
	
	//조아혜
	@Autowired
	private AttendanceService attendanceService;
	@Autowired
	private VacationService vacationService;
	@Autowired
	private NoticeService noticeService;
	
	//마이페이지 전환
	@RequestMapping("Mypage.mp")
	public String EmployeeMypage() {
		System.out.println("마이페이지 전환");
		return "employee/EmployeeMypage";
	}
	
	//사원등록 페이지 전환
	@RequestMapping("insert.hr")
	public String EmployeeEnrollForm() {
		System.out.println("사원등록 페이지 전환");
		return "employee/EmployeeEnrollFrom";
	}
	
	//로그인
	@RequestMapping(value="login.me", method=RequestMethod.POST)
	public String loginMember(Employee m, Model model) {
				System.out.println("~~~~~~~~~~~~~~M  : "+ m);
				
		try {
			Employee loginUser = employeeService.loginMember(m);
			System.out.println("loginUser :  " + loginUser);
			model.addAttribute("loginUser", loginUser);
			return "redirect:main.mi"; 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			model.addAttribute("msg","사번 및 비번이 틀렸습니다");
			return "employee/LoginFrom";
		}
		
	}
	
	
	
	@RequestMapping("main.mi")
	public ModelAndView main(ModelAndView mv, HttpServletRequest request) {

		  int empNo =  ((Employee)request.getSession().getAttribute("loginUser")).getEmpNo();	
		  
		  //조아혜
	      Attendance attendance = attendanceService.selectAttendance(empNo); //출퇴근시간정보
	      mv.addObject("attendance", attendance);
	      LoginUserVacation annual = vacationService.selectAnnual(empNo); //연차정보
	      mv.addObject("annual", annual);
	      ArrayList<Notice> noticeList = noticeService. selectTopList();
	      mv.addObject("noticeList", noticeList);
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      
	      mv.setViewName("main");
	      return mv;
	}
	
	//로그아웃
		@RequestMapping("logout.me")
		public String logoutMember( SessionStatus status) {
			System.out.println("@@@@@로그아웃" + status);
			status.setComplete(); //현재 컨트롤러에 @SessionAttribute에 의해 저장된 오브젝트를 제거
			return "redirect:index.jsp";
		}	
		
		

}
