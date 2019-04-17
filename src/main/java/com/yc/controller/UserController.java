package com.yc.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageInfo;
import com.yc.po.Role;
import com.yc.po.User;
import com.yc.service.UserService;
import com.yc.util.ResultData;
@RequestMapping("user")
@Controller
public class UserController {

	//业务对象
	@Autowired
	private UserService userService;
	//session域对象
	@Autowired
	private HttpSession session;
	
	/**
	 * 用户登录
	 * @param userCode
	 * @param password
	 * @return
	 */
	@RequestMapping("gologin")
	@ResponseBody
	public String gologin(String userCode,String password){
		ResultData rd = userService.goLogin(userCode, password);
		if(rd.getData() != null){
			//把用户信息存到session域,保存用户的在线状态
			session.setAttribute("user",rd.getData());
		}
		//返回json数据到客户端
		System.out.println(JSONObject.toJSONString(rd));
		return JSONObject.toJSONString(rd);
	}
	
	/**
	 * 退出系统功能
	 * @return
	 */
	@GetMapping("logout")
	public String logout(HttpServletResponse response){
		//删除session域里面用户信息
		session.removeAttribute("user");
		//删除cookie
		Cookie cookie = new Cookie("usercode","-1");
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
		return "redirect:/login.html";
	}
	
	/**
	 * 旧密码验证
	 * @param pwd
	 * @param id
	 * @return
	 */
	@PostMapping("isPwd")
	@ResponseBody
	public String isPwd(String pwd,Long id){
		ResultData rd = userService.isPwd(pwd, id);
		return JSONObject.toJSONString(rd);
	}
	
	/**
	 * 密码修改
	 * @param userpassword
	 * @param id
	 * @return
	 */
	@PostMapping("pwdupdate")
	@ResponseBody
	public String pwdupdate(String userpassword,Long id){
		int pwdset = userService.pwdupdate(userpassword, id);
		return JSONObject.toJSONString(pwdset);
	}
	
	/**
	 * 分页展示用户信息
	 * @param username
	 * @param rolename
	 * @param n
	 * @param pageSize
	 * @param map
	 * @return
	 */
	@GetMapping("userlist")
	public String getUserList(
			@RequestParam(value="username",defaultValue="")String username,
			@RequestParam(value="rolename",defaultValue="")String rolename,
			@RequestParam(value="n",defaultValue="1")Integer n,
			@RequestParam(value="pageSize",defaultValue="5")Integer pageSize,
			Map<String,Object> map){
		//获取用户列表信息
		PageInfo pageInfo = userService.getUserListPage(username,rolename,n, pageSize);
		//获取角色名称列表信息
		List<String> roleNames = userService.getRoleNames();
		map.put("pageInfo", pageInfo);
		map.put("roleNames",roleNames);
		map.put("username",username);
		map.put("rolename",rolename);
		return "userlist";
	}
	
	@ModelAttribute
	public void modelAttributeMethod(Long id,String flag,Map<String,Object> map){
		if("update".equals(flag)){
			User user = new User();
			user = userService.getUserById(id);
			
			List<Role> rnids = userService.getRoleNameAndIds();
			map.put("user",user);
			map.put("rnids",rnids);
		}
	}
	
	/**
	 * 跳转到用户更新页面
	 * @return
	 */
	@GetMapping("usermodify")
	public String usermodify(){
		return "usermodify";
	}
	
	/**
	 * 跳转到用户查看页面
	 * @return
	 */
	@GetMapping("userview")
	public String userview(){
		return "userview";
	}
	
	/**
	 * 跳转到用户增加页面
	 * @return
	 */
	@GetMapping("useradd")
	public String useradd(
			@RequestParam(value="rolename",defaultValue="")String rolename,
			Map<String,Object> map){
		//获取角色名称列表信息
		List<Role> roles = userService.getRoleNameAndIds();
		map.put("roles",roles);
		return "useradd";
	}
		
	/**
	 * 查看用户信息
	 * @return
	 */
	@RequestMapping("userselect")
	@ResponseBody
	public String userselect(Long id){			
			User user = userService.getUserById(id);			
			return JSON.toJSONString(user);		
	}
	
	/**
	 * 用户删除操作
	 * @return
	 */
	@RequestMapping("userdel")
	public String userdel(@RequestParam("id") Long id){
		userService.userDelect(id);
		return "redirect:userlist";
	}
		
	/**
	 * 更新用户信息
	 * @return
	 */
	@PostMapping("update")
	public String userupdate(User user,Map<String,Object> map){
		//修改时间
		user.setModifydate(new Date());
		//修改人
		User onlineUser = (User)session.getAttribute("user");
		if(onlineUser != null){
			user.setModifyby(onlineUser.getId());
		}
		userService.userUpdate(user);
		
		List<Role> rnids = userService.getRoleNameAndIds();
		map.put("rnids",rnids);
		return "usermodify";
	}
	
	/**
	 * 增加用户信息
	 * @return
	 */
	@PostMapping("add")
	public String useradd(User user,Map<String,Object> map){
	
		user.setCreationdate(new Date());		
		//修改人
		User onlineUser = (User)session.getAttribute("user");
		if(onlineUser != null){
			user.setCreatedby(onlineUser.getId());
		}
		userService.userAdd(user);
		return "redirect:userlist";
	}
	
	
}
