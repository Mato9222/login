package com.teamtodev.department.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import java.util.ArrayList;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.department.vo.DepartmentVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class DepartmentMapperTest extends AbstractRootContextTest {

	@Autowired
	DepartmentMapper departmentmapper;
	
	@Test
	void testInsertDepartment() {
		DepartmentVO deptVo = new DepartmentVO();
		deptVo.setDeptNm("인ㅅ");
//		deptVo.setDprlrEmplNo(3);
		deptVo.setUpperDeptNo(9);
		int cnt = departmentmapper.insertDepartment(deptVo);
		System.out.println("cnt"+cnt);
//		assertDoesNotThrow(() -> departmentmapper.insertDepartment(deptVo));
		assertEquals(1, cnt);
	}

	@Test
	void testUpdateDepartment() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectDepartmentList() {
		List<DepartmentVO> list = null;
		list = departmentmapper.selectDepartmentEmplList();
		log.info("list => {}", list);
		
	}

	@Test
	void testSelectDepartment() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteDepartment() {
		fail("Not yet implemented");
	}

}
