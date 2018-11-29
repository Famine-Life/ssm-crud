package com.liantao.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.liantao.crud.bean.Department;
import com.liantao.crud.bean.Msg;
import com.liantao.crud.service.DepartmentService;

/**
 * ssm-crud
 * author:https://github.com/famine-life
 * Date:2018-11-29
 */

/**
 * ����Ͳ����йص�����
 * @author liantao.me
 *
 */
@Controller
public class DepartmentController {
	
	@Autowired
	private DepartmentService departmentService;
	
	/**
	 * �������еĲ�����Ϣ
	 */
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts(){
		//��������в�����Ϣ
		List<Department> list = departmentService.getDepts();
		return Msg.success().add("depts", list);
	}
	
}
