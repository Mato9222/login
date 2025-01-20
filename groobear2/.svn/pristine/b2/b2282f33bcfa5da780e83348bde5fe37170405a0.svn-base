package com.teamtodev.employees.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.employees.exception.PkNotFoundException;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.extern.slf4j.Slf4j;
@Slf4j
class EmployeeMapperTest extends AbstractRootContextTest{
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Test
	void testInsertEmployee() {
		EmployeeVO emplVo = new EmployeeVO();
		emplVo.setEmplId("test3");
		emplVo.setEmplPw("java");
		emplVo.setDeptNo(11);
		assertDoesNotThrow(() -> employeeMapper.insertEmployee(emplVo));
	}

	@Test
	void testUpdateEmployee() {
		EmployeeVO emplVO = new EmployeeVO();
		emplVO.setMoblphonNo("010-5882-7785");
	}

	@Test
	void testSelectEmployeeList() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectEmployee() {
		String emplId = "java";
		EmployeeVO emplVo = employeeMapper.selectEmployeeById(emplId).orElseThrow(() -> new PkNotFoundException(500));
		log.info("empl정보 {}",emplVo);
	}

	@Test
	void testDeleteEMployee() {
		fail("Not yet implemented");
	}

}
