package com.yc.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
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

import com.github.pagehelper.PageInfo;
import com.yc.po.Bill;
import com.yc.po.Provider;
import com.yc.po.Role;
import com.yc.po.User;
import com.yc.service.BillService;

@RequestMapping("bill")
@Controller
public class BillController {

	@Autowired
	private BillService billService;
	
	//session域对象
	@Autowired
	private HttpSession session;
	
	/**
	 * 跳转到订单管理页面
	 * @return
	 */
	@GetMapping("billlist")
	public String getBillProList(
			@RequestParam(value="productname",defaultValue="")String productname,
			@RequestParam(value="proname",defaultValue="")String proname,
			@RequestParam(value="ispayment",defaultValue="")String ispayment,
			@RequestParam(value="n",defaultValue="1")Integer n,
			@RequestParam(value="pageSize",defaultValue="5")Integer pageSize,
			Map<String,Object> map){
		//获取订单列表信息
		PageInfo pageInfo = billService.getBillProListPage(productname, proname, ispayment, n, pageSize);
		//获取供应商列表信息
		List<String> proNames = billService.getProNames();
		map.put("pageInfo", pageInfo);
		map.put("proNames",proNames);
		map.put("productname",productname);
		map.put("proname",proname);
		map.put("ispayment",ispayment);
		return "billlist";
	}
	
	
	@ModelAttribute
	public void modelAttributeMethod(Long id,String flag,Map<String,Object> map){
		if("update".equals(flag)){
			Bill bill = new Bill();
			bill = billService.getBillById(id);
			
			List<Provider> proids = billService.getProNameAndIdByAll();
			map.put("bill",bill);
			map.put("proids",proids);
		}
	}
	
	/**
	 * 跳转到订单修改页面
	 * @return
	 */
	@GetMapping("billmodify")
	public String billmodify(){
		return "billmodify";
	}
	
	/**
	 * 跳转到订单查看页面
	 * @return
	 */
	@GetMapping("billview")
	public String billview(){
		return "billview";
	}
	
	
	/**
	 * 更新订单信息
	 * @return
	 */
	@PostMapping("update")
	public String userupdate(Bill bill,Map<String,Object> map){
		//修改时间
		bill.setModifydate(new Date());
		//修改人
		User onlineUser = (User)session.getAttribute("user");
		if(onlineUser != null){
			bill.setModifyby(onlineUser.getId());
		}
		billService.billUpdate(bill);
		
		List<Provider> proids = billService.getProNameAndIdByAll();
		map.put("proids",proids);
		return "billmodify";
	}
	
	/**
	 * 订单删除操作
	 * @return
	 */
	@RequestMapping("billdel")
	public String billdel(@RequestParam("id") Long id){
		billService.billDelect(id);
		return "redirect:billlist";
	}
	
	
}
