package com.yc.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.github.pagehelper.PageInfo;
import com.yc.po.Provider;
import com.yc.po.Role;
import com.yc.po.User;
import com.yc.service.ProviderService;

@RequestMapping("provider")
@Controller
public class ProviderController {
	
	@Autowired
	private ProviderService providerService;
	
	//session域对象
	@Autowired
	private HttpSession session;
	
	@GetMapping("providerlist")
	public String getProviderList(
			@RequestParam(value="proname",defaultValue="")String proname,
			@RequestParam(value="procontact",defaultValue="")String procontact,
			@RequestParam(value="n",defaultValue="1")Integer n,
			@RequestParam(value="pageSize",defaultValue="5")Integer pageSize,
			Map<String,Object> map){
		//获取用户列表信息
		PageInfo pageInfo = providerService.getProviderListPage(proname, procontact, n, pageSize);
		
		map.put("pageInfo", pageInfo);	
		map.put("proname",proname);
		map.put("procode",procontact);
		return "providerlist";
	}
	
	@ModelAttribute
	public void modelAttributeMethod(Long id,String flag,Map<String,Object> map){
		if("update".equals(flag)){
			Provider provider = new Provider();
			provider = providerService.getProById(id);
		
			map.put("provider",provider);
		}
	}
	
	/**
	 * 更新供应商信息
	 * @return
	 */
	@PostMapping("update")
	public String proupdate(Provider provider,Map<String,Object> map){
		//修改时间
		provider.setModifydate(new Date());
		//修改人
		User onlineUser = (User)session.getAttribute("user");
		if(onlineUser != null){
			provider.setModifyby(onlineUser.getId());
		}
		providerService.proUpdate(provider);
		
		return "redirect:providerlist";
	}
	
	/**
	 * 跳转到供应商更新页面
	 * @return
	 */
	@GetMapping("providermodify")
	public String providermodify(){
		return "providermodify";
	}
	
	/**
	 * 跳转到供应商查看页面
	 * @return
	 */
	@GetMapping("providerview")
	public String providerview(){
		return "providerview";
	}
	
	/**
	 * 跳转到供应商增加页面
	 * @return
	 */
	@GetMapping("provideradd")
	public String provideradd(){
		return "provideradd";
	}
	
	/**
	 * 供应商删除操作
	 * @return
	 */
	@RequestMapping("providerdel")
	public String userdel(@RequestParam("id") Long id){
		providerService.proDelect(id);
		return "redirect:providerlist";
	}
	
	/**
	 * 增加供应商信息
	 * @return
	 */
	@PostMapping("add")
	public String useradd(Provider provider,Map<String,Object> map){
	
		provider.setCreationdate(new Date());		
		//修改人
		User onlineUser = (User)session.getAttribute("user");
		if(onlineUser != null){
			provider.setCreatedby(onlineUser.getId());
		}
		providerService.proAdd(provider);
		return "redirect:providerlist";
	}
		
}
