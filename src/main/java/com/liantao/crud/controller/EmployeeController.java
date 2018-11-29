package com.liantao.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liantao.crud.bean.Employee;
import com.liantao.crud.bean.Msg;
import com.liantao.crud.service.EmployeeService;

/**
 * ssm-crud
 * author:https://github.com/famine-life
 * Date:2018-11-29
 */

/**
 * ����Ա����crud����
 * @author liantao.me
 *
 */
@Controller
public class EmployeeController {
	
	@Autowired
	EmployeeService employeeService;
	
	/**
	 * Ա��ɾ��
	 * ����������ɾ������һ
	 * @param id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{ids}",method=RequestMethod.DELETE)
	public Msg deleteEmpById(@PathVariable("ids")String ids){
		if(ids.contains("-")){
			List<Integer> del_ids = new ArrayList();
			String[] str_ids = ids.split("-");
			for(String str : str_ids){
				del_ids.add(Integer.parseInt(str));
			}
			employeeService.deleteBatch(del_ids);
		}else{
			Integer id = Integer.parseInt(ids);
			employeeService.deleteEmp(id);
		}
		return Msg.success();
	}
	
	
	
	/**
	 * ��web.xml������HttpPutFormContentFilter��
	 * ��֧��put�ύ��ʽ
	 * 
	 * Ա������
	 * @param employee
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/emp/{empId}",method=RequestMethod.PUT)
	public Msg saveEmp(Employee employee){
		
		//System.out.println(employee);
		employeeService.updateEmp(employee);
		return Msg.success();
	}
	
	/**
	 * ����id��ѯԱ��
	 * @param id
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method=RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id")Integer id){
		
		Employee emp = employeeService.getEmp(id);
		return Msg.success().add("emp", emp);
	}
	
	
	/**
	 * ����û����Ƿ����
	 * @param empName
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/checkuser")
	public Msg checkuser(@RequestParam("empName")String empName){
		
		//���ж��û����Ƿ��ǺϷ��ı��ʽ
		String regx = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})";
		if(!empName.matches(regx)){
			return Msg.fail().add("va_msg", "�û���Ϊ2-5λ���Ļ���6-16λӢ�ĺ����ֵ����");
		}
		
		//���ݿ��û����ظ�У��
		boolean b = employeeService.checkUser(empName);
		if(b){
			return Msg.success();	//code 100
		}else
		{
			return Msg.fail().add("va_msg", "�û���������");		//code 200
		}
	}
	
	
	/**
	 * Ա������
	 * 1.֧��JSR303У��
	 * 2.����Hibernate-Validator
	 * 
	 * 
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee, BindingResult result){
		if(result.hasErrors()){
			//У��ʧ�ܣ�Ӧ�÷���ʧ��,��ģ̬������ʾУ��ʧ�ܵ���Ϣ
			Map<String, Object> map = new HashMap<>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				System.out.println("������ֶ���:"+fieldError.getField());
				System.out.println("������Ϣ��"+fieldError.getDefaultMessage());
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errFields", map);
			
		}else{
			employeeService.saveEmp(employee);
			return Msg.success();
		}
		
	}
	
	/**
	 * �赼��jackson��
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value="pn",defaultValue="1")Integer pn){
		//����PageHelper��ҳ���
		//��ѯ֮ǰ��Ҫ����,,����ҳ�룬�Լ�ÿҳ�Ĵ�С
		PageHelper.startPage(pn,5);
		//startPage����������������ѯ����һ����ҳ��ѯ
		List<Employee> emps = employeeService.getAll();
		//ʹ��pageInfo��װ��ѯ��Ľ����ֻ��Ҫ��Pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ���������ǲ����������,����������ʾ������
		PageInfo page = new PageInfo(emps,5);
		
		return Msg.success().add("pageInfo",page);
		
	}
	

	/*
	 * ��ѯԱ�����ݣ���ҳ��ѯ��
	 * @return
	 */
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1")Integer pn,Model model){
		
		//����PageHelper��ҳ���
		//��ѯ֮ǰ��Ҫ����,,����ҳ�룬�Լ�ÿҳ�Ĵ�С
		PageHelper.startPage(pn,5);
		//startPage����������������ѯ����һ����ҳ��ѯ
		List<Employee> emps = employeeService.getAll();
		//ʹ��pageInfo��װ��ѯ��Ľ����ֻ��Ҫ��Pageinfo����ҳ�������
		//��װ����ϸ�ķ�ҳ��Ϣ���������ǲ����������,����������ʾ������
		PageInfo page = new PageInfo(emps,5);
		model.addAttribute("pageInfo",page);
		return "list";
	}
	
	
}
