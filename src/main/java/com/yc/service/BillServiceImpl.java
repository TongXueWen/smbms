package com.yc.service;

import java.io.IOException;
import java.io.InputStream;
import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.yc.dao.BillMapper;
import com.yc.po.Bill;
import com.yc.po.BillPro;
import com.yc.po.Provider;

@Service
@Transactional
public class BillServiceImpl implements BillService {

	//数据库操作对象
	@Autowired
	private BillMapper billMapper;
	
	

	@Override
	public Bill getBillById(Long id) {
		return billMapper.selectByPrimaryKey(id);
	}

	@Override
	public PageInfo getBillProListPage(String productname, String proname, String ispayment, Integer n,
			Integer pageSize) {
		//PageHelper page = new PageHelper();
				//设置页码和每页记录数的语句，后面必须跟上查询语句，中间不能加任何代码
		PageHelper.startPage(n,pageSize);
		List<BillPro> billpro = billMapper.selectByPageAll(productname,proname,ispayment);
		PageInfo<BillPro> pageInfo = new PageInfo<BillPro>(billpro,3);
		return pageInfo;
	}

	@Override
	public List<String> getProNames() {
		return billMapper.selectProNameByAll();
	}

	@Override
	public List<Provider> getProNameAndIdByAll() {
		return billMapper.selectProNameAndIdByAll();
	}

	@Override
	public int billUpdate(Bill bill) {
		return billMapper.updateByPrimaryKeySelective(bill);
	}

	@Override
	public int billDelect(Long id) {
		return billMapper.deleteByPrimaryKey(id);
	}

}
