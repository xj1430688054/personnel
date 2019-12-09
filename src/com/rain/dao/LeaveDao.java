package com.rain.dao;

import static com.rain.util.common.Constants.EMPLOYEETABLE;
import static com.rain.util.common.Constants.USERTABLE;
import static com.rain.util.common.Constants.LEAVETABLE;
import static com.rain.util.common.Constants.LEAVETYPETABLE;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.SelectProvider;

import com.rain.dao.provider.LeaveDynaSqlProvider;
import com.rain.domain.Leave;
import com.rain.domain.User;

public interface LeaveDao {
	
	@Select("select * from "+LEAVETABLE+" ")
	List<Leave> get_List();
	
	@SelectProvider(type=LeaveDynaSqlProvider.class,method="insert_Leave")
	void insert_Info(Leave leave);
	
	@SelectProvider(type=LeaveDynaSqlProvider.class,method="update_Leave")
	void update_Info(Leave leave);
	
	@Delete(" delete from "+LEAVETABLE+" where id = #{id} ")
	void delete_Info(Integer id);
	
	@Select("select a.name from "+LEAVETYPETABLE+" a where a.id = (select b.pid from  " +  LEAVETABLE + " b  where id = #{id}  )" )
	String findNameById(Integer id);
	
	@Select("select a.loginname from " + USERTABLE + " a where id = #{id} ")
	String findUserNameById(Integer id);
	
	@Select("select * from "+LEAVETABLE+" where id = #{id}")
	Leave get_Info(Integer id);

}
