package com.rain.domain;

import java.io.Serializable;


public class Leave  implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;


	private Integer id;
	
	
	/** 申请用户 ，HttpServletRequest 中的request 对象 getSession.getAttribute("users")*/
	private String eid;
	
	/** 请假类型 */
	private Integer leaveid;
	
	/** 请假的类型，如事假期，病假，丧家等等   此字段不在数据库表中*/
	private String leaveName;
	
	private String eName;
	
	private String pName;
	
	/** 请假理由*/
	private String reqmessage;
	
	/** 请假开始时间*/
	private String start_time;
	
	/** 请假结束时间*/
	private String stop_time;
	
	/** 请假时长*/
	private String duration;
	
	/** 申请时间*/
	private String create_time;
	
	/** 状态0表示未审批，1表示审批同意 2表示不同意 */
	private String status;
	
	/** 审批人id*/
	private String pid;
	
	/** 审批备注*/
	private String remark; 
	
	/** 审批时间*/
	private String update_time;

	public synchronized Integer getId() {
		return id;
	}

	public synchronized void setId(Integer id) {
		this.id = id;
	}

	public synchronized String getEid() {
		return eid;
	}

	public synchronized void setEid(String eid) {
		this.eid = eid;
	}

	public synchronized Integer getLeaveid() {
		return leaveid;
	}

	public synchronized void setLeaveid(Integer leaveid) {
		this.leaveid = leaveid;
	}

	public synchronized String getLeaveName() {
		return leaveName;
	}

	public synchronized void setLeaveName(String leaveName) {
		this.leaveName = leaveName;
	}

	public synchronized String geteName() {
		return eName;
	}

	public synchronized void seteName(String eName) {
		this.eName = eName;
	}

	public synchronized String getpName() {
		return pName;
	}

	public synchronized void setpName(String pName) {
		this.pName = pName;
	}

	public synchronized String getReqmessage() {
		return reqmessage;
	}

	public synchronized void setReqmessage(String reqmessage) {
		this.reqmessage = reqmessage;
	}

	public synchronized String getStart_time() {
		return start_time;
	}

	public synchronized void setStart_time(String start_time) {
		this.start_time = start_time;
	}

	public synchronized String getStop_time() {
		return stop_time;
	}

	public synchronized void setStop_time(String stop_time) {
		this.stop_time = stop_time;
	}

	public synchronized String getDuration() {
		return duration;
	}

	public synchronized void setDuration(String duration) {
		this.duration = duration;
	}

	public synchronized String getCreate_time() {
		return create_time;
	}

	public synchronized void setCreate_time(String create_time) {
		this.create_time = create_time;
	}

	public synchronized String getStatus() {
		return status;
	}

	public synchronized void setStatus(String status) {
		this.status = status;
	}

	public synchronized String getPid() {
		return pid;
	}

	public synchronized void setPid(String pid) {
		this.pid = pid;
	}

	public synchronized String getRemark() {
		return remark;
	}

	public synchronized void setRemark(String remark) {
		this.remark = remark;
	}

	public synchronized String getUpdate_time() {
		return update_time;
	}

	public synchronized void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	
	

	
	
	
	
	

}
