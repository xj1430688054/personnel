package com.rain.dao.provider;

import static com.rain.util.common.Constants.LEAVETABLE;

import org.apache.ibatis.jdbc.SQL;

import com.rain.domain.Leave;

public class LeaveDynaSqlProvider {
			// 动态插入
			public String insert_Leave(Leave leave){
				
				return new SQL(){
					{
						INSERT_INTO(LEAVETABLE);
						if(leave.getDuration()!=null){
							VALUES("duration","#{duration}");
						}
						if(leave.getStart_time()!=null){
							VALUES("start_time","#{start_time}");
						}
						if(leave.getStop_time()!=null){
							VALUES("stop_time","#{stop_time}");
						}
						if(leave.getLeaveid()!=null){
							VALUES("leaveid","#{leaveid}");
						}
						if(leave.getCarname()!=null){
							VALUES("carname","#{carname}");
						}
						if(leave.getEid()!=null){
							VALUES("eid","#{eid}");
						}
						if(leave.getStatus()!=null){
							VALUES("status","#{status}");
						}
						if(leave.getPid()!=null){
							VALUES("pid","#{pid}");
						}
						if(leave.getRemark()!=null){
							VALUES("remark","#{remark}");
						}
						if(leave.getCreate_time()!=null){
							VALUES("create_time","#{create_time}");
						}
						if(leave.getUpdate_time()!=null){
							VALUES("update_time)","#{update_time}");
						}
						if(leave.getReqmessage()!=null){
							VALUES("reqmessage","#{reqmessage}");
						}
					
					}
				}.toString();
			}	
			// 动态更新
			public String update_Leave(Leave leave){
				
				return new SQL(){
					{
						UPDATE(LEAVETABLE);
						if(leave.getDuration()!=null){
							SET(" duration = #{duration} ");
						}
						if(leave.getStart_time()!=null){
							SET("start_time = #{start_time}");
						}
						if(leave.getStop_time()!=null){
							SET("stop_time = #{stop_time}");
						}
						if(leave.getLeaveid()!=null){
							SET("leaveid = #{leaveid}");
						}
						if(leave.getCarname()!=null){
							SET("carname = #{carname}");
						}
						if(leave.getEid()!=null){
							SET("eid = #{eid}");
						}
						if(leave.getStatus()!=null){
							SET("status = #{status}");
						}
						if(leave.getPid()!=null){
							SET("pid = #{pid}");
						}
						if(leave.getRemark()!=null){
							SET("remark = #{remark}");
						}
						if(leave.getCreate_time()!=null){
							SET("create_time = #{create_time}");
						}
						if(leave.getUpdate_time()!=null){
							SET("update_time = #{update_time}");
						}
						if(leave.getReqmessage()!=null){
							SET("reqmessage = #{reqmessage}");
						}
						
						WHERE(" id = #{id} ");
					}
				}.toString();
			}
}
