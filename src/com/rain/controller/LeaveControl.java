package com.rain.controller;

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
		  Map<Integer, String> map1 = new HashMap<>();
		  Map<Integer, String> map2 = new HashMap<>();
		  for (User user : userlist) {
			  map2.put(user.getId(), user.getLoginname());
		  }
		  for (LeaveType leaveType2 : leaveType) {
			  	map1.put(leaveType2.getId(), leaveType2.getName());
		  }
		  for (Leave leave : list) {
			  leave.setLeaveName(map1.get(leave.getLeaveid()));
			  if(leave.getPid() != null){
				  leave.setpName(map2.get(leave.getPid()));
			  }
			  leave.seteName(map2.get(Integer.parseInt(leave.getEid())));
		}
		
		model.addAttribute("list",list);
		return "leave/list";
	}
	@RequestMapping(value="/leave/edit",method=RequestMethod.GET)
	public String edit(Leave leave, Model model){
		model.addAttribute("leave",leave);
		
		return "leave/edit";
	}
	
	@RequestMapping(value="/leave/add",method=RequestMethod.POST)
	 public ModelAndView add(ModelAndView mv,@ModelAttribute Leave leave , HttpSession session){
		System.out.println(leave.getId());
		User user = (User) session.getAttribute(Constants.USER_SESSION);
//		System.out.println(dept.getId());
		if(leave.getId()!=null){
			Leave leavee = rainService.get_LeaveInfo(leave.getId());
			leavee.setStatus(leave.getStatus());
			leavee.setRemark(leave.getRemark());
			leave.setPid(String.valueOf(user.getId()));
			leave.setUpdate_time(UtilSS.getNow());
			rainService.update_leaveInfo(leave);
			System.out.println(leave.getId());
		}else{
			leave.setStatus("0");
			leave.setCreate_time(UtilSS.getNow());
			leave.setEid(String.valueOf(user.getId()));
			
			rainService.insert_LeaveInfo(leave);
		}
//		System.out.println(dept.getName());
		mv.setViewName("redirect:/dept/list");
		return mv;
	}
	
	

}
