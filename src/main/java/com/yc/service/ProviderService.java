package com.yc.service;

import java.util.List;

import com.github.pagehelper.PageInfo;
import com.yc.po.Provider;
import com.yc.po.User;

public interface ProviderService {
	
	public PageInfo getProviderListPage(String proname, String procontact, Integer n,Integer pageSize);
	
	/**
	 * 通过id查询供应商信息
	 * @param id
	 * @return
	 */
	public Provider getProById(Long id);
	
	/**
	 * 供应商信息修改
	 * @param provider
	 * @return
	 */
	public int proUpdate(Provider provider);
	
	/**
	 * 供应商信息删除
	 * @param id
	 * @return
	 */
	public int proDelect(Long id);
	
	/**
	 * 供应商的增加
	 * @param provider
	 * @return
	 */
	public int proAdd(Provider provider);


}
