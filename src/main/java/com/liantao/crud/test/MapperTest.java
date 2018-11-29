package com.liantao.crud.test;

import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.liantao.crud.bean.Department;
import com.liantao.crud.bean.Employee;
import com.liantao.crud.dao.DepartmentMapper;
import com.liantao.crud.dao.EmployeeMapper;

/**
 * ����dao��Ĺ���
 * @author liantao.me
 * �Ƽ�Spring����Ŀ�Ϳ���ʹ��Spring�ĵ�Ԫ���ԣ������Զ�ע��������Ҫ�����
 * 1.����SpringTestģ�飬��pom.xml���pendency
 * 2.@ContextConfigurationָ��Spring�����ļ���λ��
 * 3.ֱ��autowiredҪʹ�õ��������
 * 
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;
	
	/**
	 * ����DepartmentMapper
	 */
	@Test
	public void testCRUD(){
	/*
	 * ԭ�����Է���
		//1������Spring IOC����
		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		//2���������л�ȡmapper
		ioc.getBean(DepartmentMapper.class);
	*/
		System.out.println(departmentMapper);
		
		
		//1.���뼸������
//		departmentMapper.insertSelective(new Department(null,"������"));
//		departmentMapper.insertSelective(new Department(null,"���Բ�"));
		
		//2.����Ա�����ݣ�����Ա������
//		employeeMapper.insertSelective(new Employee(null,"tom","M","tom@qq.com",1));
		
		//3.����������Ա��
		EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
		for(int i=0;i<1000;i++){
			String uid = UUID.randomUUID().toString().substring(0,5)+i;
			mapper.insertSelective(new Employee(null,uid,"M",uid+"@gmail.com",1));
		}
		System.out.println("��������Ա��������ɣ�");
		
		
		
	}
	
}
