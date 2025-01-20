package com.teamtodev.attendance;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.attendance.mapper.AttendanceMapper;
import com.teamtodev.employees.mapper.EmployeeMapper;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.extern.slf4j.Slf4j;import oracle.security.o3logon.a;

@Slf4j
@Transactional
class AttendanceMapperTest{
	@Autowired
	AttendanceMapper attendanceMapper;
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Test
	void testSelectEmployeeList() {
		List<EmployeeVO> emplList = employeeMapper.selectEmployeeList();
		log.info("emplList : {}", emplList);
	}
	
	@Test
	void testInsertAttendance() {
		int cnt = 0;
		List<EmployeeVO> emplList = employeeMapper.selectEmployeeList();
		for(EmployeeVO emplVO : emplList) {
			emplVO.getEmplNo();
			log.info("사번 : {}", emplVO.getEmplNo());
			if(attendanceMapper.insertAttendance(emplVO.getEmplNo()) > 0) {
				cnt++;
			}
		}
	}
	@Test
	void testLocaltime() {
		LocalDateTime localDateTime = LocalDateTime.now();
		log.info("0번 > {}", localDateTime);
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		log.info("1번 > {}", dtf);
		String attendDt = dtf.format(localDateTime);
		log.info("2번 > {}", attendDt);
		String now = localDateTime.format(DateTimeFormatter.ofPattern("yyyyMMdd"));
		log.info("3번 > {}", now);
	}
	
	@Test
	void testInsert() {
		
	}

}
