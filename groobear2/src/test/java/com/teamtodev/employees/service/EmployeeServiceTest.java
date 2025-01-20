package com.teamtodev.employees.service;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.employees.exception.PkNotFoundException;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.enumpkg.ServiceResult;

class EmployeeServiceTest extends AbstractRootContextTest{

	@Autowired
	EmployeeService service;
	
	@Test
	void testInsertEmployee() {
		EmployeeVO empl = new EmployeeVO();
		empl.setEmplId("no10");
		empl.setEmplNm("차은우");
		empl.setEmplPw("no10");
		empl.setIhidnum("941007-1406854");
		empl.setCmmnCode("D01");
		empl.setOfcpsCode("A02");
		empl.setRspofcCode("B01");
		empl.setLxtnNo(401);
		empl.setEmgncContactNtwkNo("010-5555-2222");
		empl.setMoblphonNo("010-3333-1111");
		empl.setBassAdres("팔레스타인");
		empl.setDetailAdres("하마스");
		empl.setZip(58824);
		empl.setEmailAdres("car@ddit.com");
		empl.setEncpnDe("2024/05/21");
		empl.setCnwkYycnt(1);
		empl.setProflPhotoCours("차은우.jpg");
		empl.setAcntLockAt("N");
		empl.setLoginFailrCo(0);
		empl.setDeptNo(23);
		assertEquals(ServiceResult.OK, service.insertEmployee(empl));
	}

	@Test
	void testUpdateEmployee() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectEmployeeList() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectEmployee() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectEmployeeId() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteEMployee() {
		fail("Not yet implemented");
	}

	@Test
	void testAuthenticate() {
		fail("Not yet implemented");
	}

}
