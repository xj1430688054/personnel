package com.rain.dao.provider;

import static com.rain.util.common.Constants.LEAVETYPETABLE;

import org.apache.ibatis.jdbc.SQL;

import com.rain.domain.LeaveType;

public class LeaveTypeDynaSqlProvider {
			// 动态插入
			public String insert_LeaveType(LeaveType leaveType){
				
				return new SQL(){
					{
						INSERT_INTO(LEAVETYPETABLE);
						if(leaveType.getId() != null ){
							VALUES("id", "#{id}");
						}
						if(leaveType.getName()!=null){
							VALUES("name","#{name}");
						}
						
					
						
					}
				}.toString();
			}	
			// 动态更新
			public String update_LeaveType(LeaveType leaveType){
				
				return new SQL(){
					{
						UPDATE(LEAVETYPETABLE);
						if(leaveType.getName() != null ){
							SET("name = #{name}");
						}
						
						WHERE(" id = #{id} ");
					}
				}.toString();
			}
}
