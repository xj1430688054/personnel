package com.rain.controller;

import java.applet.Applet;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.tools.ant.types.resources.selectors.Date;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.jdbc.Util;
import com.rain.domain.Dept;
import com.rain.domain.Employee;
import com.rain.domain.Leave;
import com.rain.domain.LeaveType;
import com.rain.domain.User;
import com.rain.service.RainService;
import com.rain.util.common.Constants;
import com.rain.util.common.UtilSS;

@Controller
public class LeaveControl {
	
	@Autowired
	@Qualifier("RainService")
	private RainService rainService;
	
	
	
	@RequestMapping(value="/leave/list",method=RequestMethod.GET)
	 public String index(Model model,String content){
		  List<Leave> list = rainService.get_LeaveList();
		  List<LeaveType> leaveType = rainService.get_LeaveType();
		  List<User> userlist = rainService.get_UserList();
		  List<Employee> employ = rainService.get_EmployeeList();
		  //假类型集合
		  Map<Integer, String> map1 = new HashMap<>();
		  //审批人集合
		  Map<Integer, String> map2 = new HashMap<>();
		  //请假人集合
		  Map<Integer, String> map3 = new HashMap<>();
		  for (User user : userlist) {
			  map2.put(user.getId(), user.getLoginname());
		  }
		  for (LeaveType leaveType2 : leaveType) {
			  	map1.put(leaveType2.getId(), leaveType2.getName());
		  }
		  for (Employee employee : employ) {
			  map3.put(employee.getId(), employee.getName());
		  }
		  if(content != null){
			  list.clear();
			  list.add(rainService.get_LeaveInfo(Integer.parseInt(content)));
		  }
		  for (Leave leave : list) {
			  if (null != leave.getEid()) {
				leave.setLeaveName(map1.get(leave.getLeaveid()));
				if (leave.getPid() != null) {
					leave.setpName(map2.get(Integer.parseInt(leave.getEid())));
				}
				leave.seteName(map3.get(Integer.parseInt(leave.getEid())));
			}
		  	  }
		
		model.addAttribute("list",list);
		return "leave/list";
	}
	@RequestMapping(value="/leave/edit",method=RequestMethod.GET)
	public String edit(Leave leave, Model model){
		leave = rainService.get_LeaveInfo(leave.getId());
		model.addAttribute("leave",leave);
		
		return "leave/edit";
	}
	@RequestMapping("/leave/appl")
	public String appl(Model model){
		List<LeaveType> list = rainService.get_LeaveType();
		Map<String, String> map = new HashMap<>();
		for (LeaveType leaveType : list) {
			map.put(String.valueOf(leaveType.getId()), leaveType.getName());
		}
		model.addAttribute("map", map);
		
		return "leave/appl";
	}
	
	@RequestMapping(value="/leave/edit",method=RequestMethod.POST)
	 public ModelAndView add(ModelAndView mv,@ModelAttribute Leave leave , HttpSession session){
		System.out.println(leave.getId());
		User user = (User) session.getAttribute(Constants.USER_SESSION);
//		System.out.println(dept.getId());
			Leave leavee = rainService.get_LeaveInfo(leave.getId());
			leavee.setStatus(leave.getStatus());
			leavee.setRemark(leave.getRemark());
			leave.setPid(String.valueOf(user.getId()));
			leave.setUpdate_time(UtilSS.getNow());
			rainService.update_leaveInfo(leave);
			System.out.println(leave.getId());

//		System.out.println(dept.getName());
		mv.setViewName("redirect:/leave/list");
		return mv;
	}
	
	
	@RequestMapping(value="/leave/editor",method=RequestMethod.GET)
	public String editOR(Leave leave, Model model){
		leave = rainService.get_LeaveInfo(leave.getId());
		model.addAttribute("leave",leave);
		
		return "leave/editor";
	}
	
	//用户租车
	@RequestMapping(value="/leave/editor",method=RequestMethod.POST)
	 public ModelAndView edit(ModelAndView mv,@ModelAttribute Leave leave , HttpSession session){
		System.out.println(leave.getId());
		Employee user = (Employee) session.getAttribute(Constants.USER_SESSION);
//		System.out.println(dept.getId());
			Leave leavee = rainService.get_LeaveInfo(leave.getId());
			leavee.setStatus("0");
			leavee.setReqmessage(leave.getReqmessage());
			leavee.setEid(String.valueOf(user.getId()));
			leavee.setUpdate_time(UtilSS.getNow());
			leavee.setStart_time(leave.getStart_time());
			leavee.setStop_time(leave.getStop_time());
			rainService.update_leaveInfo(leavee);
			System.out.println(leave.getId());

//		System.out.println(dept.getName());
		mv.setViewName("redirect:/leave/listuse");
		return mv;
	}
	
	@RequestMapping(value="/leave/add",method=RequestMethod.POST)
	 public ModelAndView edd(ModelAndView mv,@ModelAttribute Leave leave , HttpSession session){
		System.out.println(leave.getId());
//		Employee user = (Employee) session.getAttribute(Constants.USER_SESSION);
//		System.out.println(dept.getId());
	
			leave.setStatus("-1");
			leave.setCreate_time(UtilSS.getNow());
//			leave.setEid(String.valueOf(user.getId()));
			
			rainService.insert_LeaveInfo(leave);
		
//		System.out.println(dept.getName());
		mv.setViewName("redirect:/leave/listuse");
		return mv;
	}
	
	
	@RequestMapping(value="/leave/listuse",method=RequestMethod.GET)
	 public String indexlist(Model model,String content){
		  List<Leave> list = rainService.getLeaveList();
		  List<LeaveType> leaveType = rainService.get_LeaveType();
		  List<User> userlist = rainService.get_UserList();
		  List<Employee> employ = rainService.get_EmployeeList();
		  //假类型集合
		  Map<Integer, String> map1 = new HashMap<>();
		  //审批人集合
		  Map<Integer, String> map2 = new HashMap<>();
		  //请假人集合
		  Map<Integer, String> map3 = new HashMap<>();
		  for (User user : userlist) {
			  map2.put(user.getId(), user.getLoginname());
		  }
		  for (LeaveType leaveType2 : leaveType) {
			  	map1.put(leaveType2.getId(), leaveType2.getName());
		  }
		  for (Employee employee : employ) {
			  map3.put(employee.getId(), employee.getName());
		  }
		  if(content != null){
			  list.clear();
			  list.add(rainService.get_LeaveInfo(Integer.parseInt(content)));
		  }
		  for (Leave leave : list) {
			  leave.setLeaveName(map1.get(leave.getLeaveid()));
			  if(leave.getPid() != null){
				  leave.setpName(map2.get(Integer.parseInt(leave.getEid())));
			  }
		  	  }
		
		  for (Leave leave : list) {
				leave.setLeaveName(map1.get(leave.getLeaveid()));
			
		  	  }
		
		model.addAttribute("list",list);
		return "leave/listuse";
	}

	
	@RequestMapping(value="/leave/del",method=RequestMethod.GET)
	 public void delete(Integer id){
		System.out.println(id);
		if(id!=null){
			rainService.delete_LeaveInfo(id);
		}
	}
	
	

}
