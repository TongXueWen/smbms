package com.yc.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yc.dao.ProviderMapper;
import com.yc.po.Provider;
import com.yc.po.UserRole;

@Service
@Transactional
public class ProviderServiceImpl implements ProviderService {
	
	//数据库操作对象
	@Autowired
	private ProviderMapper providerMapper;

	@Override
	public PageInfo getProviderListPage(String proname, String procontact, Integer n, Integer pageSize) {
		PageHelper.startPage(n,pageSize);
		List<Provider> pros = providerMapper.selectByPageAll(proname, procontact);
		PageInfo<Provider> pageInfo = new PageInfo<Provider>(pros);
		return pageInfo;
	}

	@Override
	public Provider getProById(Long id) {
		return providerMapper.selectByPrimaryKey(id);
	}

	@Override
	public int proUpdate(Provider provider) {
		return providerMapper.updateByPrimaryKeySelective(provider);
	}

	@Override
	public int proDelect(Long id) {
		return providerMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int proAdd(Provider provider) {
		
		return providerMapper.insertSelective(provider);
	}

}
