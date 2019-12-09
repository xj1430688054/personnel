package com.rain.dao;

import static com.rain.util.common.Constants.LEAVETYPETABLE;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import com.rain.domain.LeaveType;

public interface LeaveTypeDao {
	
	@Select("select * from "+LEAVETYPETABLE+" ")
	List<LeaveType> get_List();
	
	
	
}

