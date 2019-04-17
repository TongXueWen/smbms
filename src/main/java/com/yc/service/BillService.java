package com.yc.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.yc.po.Bill;
import com.yc.po.Provider;
import com.yc.po.User;


public interface BillService {
	
	public Bill getBillById(Long id);
	
	/**
	 * 获取供应商名称
	 * @return
	 */
	public List<String> getProNames();
	
	/**
	 * 获取供应商id和名称
	 * @return
	 */
	public List<Provider> getProNameAndIdByAll();
	
	/**
	 * 订单分页查询
	 * @param productname
	 * @param proname
	 * @param ispayname
	 * @param n
	 * @param pageSize
	 * @return
	 */
	public PageInfo getBillProListPage(String productname,String proname,String ispayment,Integer n,Integer pageSize);

	/**
	 * 订单的修改
	 * @param bill
	 * @return
	 */
	public int billUpdate(Bill bill);
}
