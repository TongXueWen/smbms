package com.yc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yc.dao.RoleMapper;
import com.yc.dao.UserMapper;
import com.yc.po.Role;
import com.yc.po.User;
import com.yc.po.UserRole;
import com.yc.util.ResultData;

@Service
@Transactional
public class UserServiceImpl implements UserService{
	
	//数据库操作对象
		@Autowired
		private UserMapper userMapper;
		@Autowired
		private RoleMapper roleMapper;
		
		/**
		 * 登录业务处理
		 */
		@Override
		public ResultData goLogin(String userCode,String password) {
			User user = userMapper.SelectByUserCode(userCode);
			ResultData rd = new ResultData();
			if(user == null){//判断用户编码是否错误
				rd.setMsg("用户编码错误!");
				rd.setFlag(1);
				return rd;
			}
			if(!password.equals(user.getUserpassword())){ //判断密码是否正确
				rd.setMsg("用户密码错误!");
				rd.setFlag(2);
				return rd;
			}
			rd.setMsg("登录成功");
			rd.setFlag(0);
			rd.setData(user);
			return rd;
		}
		
		/**
		 * 验证旧密码是否正确
		 */
		@Override
		public ResultData isPwd(String pwd, Long id) {
			User user = userMapper.selectByPrimaryKey(id);
			ResultData rd = new ResultData();
			if(user != null){
				if(pwd.equals(user.getUserpassword())){
					rd.setFlag(0);
					rd.setMsg("密码正确!");
				}else{
					rd.setFlag(1);
					rd.setMsg("密码错误!");
				}
			}else{
				rd.setFlag(2);
				rd.setMsg("未知错误!");
			}
			return rd;
		}
		
		/**
		 * 分页查询用户信息
		 */
		@Override
		public PageInfo getUserListPage(String username,String rolename,Integer n, Integer pageSize) {
			//PageHelper page = new PageHelper();
			//设置页码和每页记录数的语句，后面必须跟上查询语句，中间不能加任何代码
			PageHelper.startPage(n,pageSize);
			List<UserRole> userRoles = userMapper.selectByPageAll(username,rolename);
			PageInfo<UserRole> pageInfo = new PageInfo<UserRole>(userRoles,3);
			return pageInfo;
		}
		
		/**
		 * 查询角色名称列表
		 */
		@Override
		public List<String> getRoleNames() {
			return roleMapper.selectRoleNameByAll();
		}
		
		/**
		 * 根据ID查找用户
		 */
		@Override
		public User getUserById(Long id) {
			return userMapper.selectByPrimaryKey(id);
		}

		@Override
		public List<Role> getRoleNameAndIds() {
			return roleMapper.selectRoleNameAndIdByAll();
		}

		@Override
		public int userUpdate(User user) {
			return userMapper.updateByPrimaryKeySelective(user);
		}

		@Override
		public int userDelect(Long id) {
			return userMapper.deleteByPrimaryKey(id);
		}

		/**
		 * 用户增加
		 */
		@Override
		public int userAdd(User user) {		
			return userMapper.insertSelective(user);
		}

		@Override
		public int pwdupdate(String userpassword, Long id) { 
			return userMapper.updatepwd(userpassword, id);
		}


}
