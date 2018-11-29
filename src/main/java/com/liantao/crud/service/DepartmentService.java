package com.liantao.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.liantao.crud.bean.Department;
import com.liantao.crud.dao.DepartmentMapper;

/**
 * ssm-crud
 * author:https://github.com/famine-life
 * Date:2018-11-29
 */

@Service
public class DepartmentService {
	
	@Autowired
	private DepartmentMapper departmentMapper;
	
	public List<Department> getDepts() {
		// TODO Auto-generated method stub
		List<Department> list = departmentMapper.selectByExample(null);
		return list;
	}

}
