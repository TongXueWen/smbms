package com.yc.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.yc.po.Role;
import com.yc.po.User;
import com.yc.util.ResultData;

public interface UserService {
	
	public ResultData goLogin(String userCode,String password);
	
	public ResultData isPwd(String pwd,Long id);
	
	public PageInfo getUserListPage(String username,String rolename,Integer n,Integer pageSize);
	
	public List<String> getRoleNames();
	
	public List<Role> getRoleNameAndIds();
	
	public User getUserById(Long id);
	
	public int userUpdate(User user);
	
	public int userDelect(Long id);
	
	/**
	 * 用户增加
	 * @param user
	 * @return
	 */
	public int userAdd(User user);
	
	/**
	 * 用户密码修改
	 * @param userpassword
	 * @param id
	 * @return
	 */
	public int pwdupdate(String userpassword,Long id);
}
