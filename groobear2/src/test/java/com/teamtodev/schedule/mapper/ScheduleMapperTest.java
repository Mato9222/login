package com.teamtodev.schedule.mapper;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.schedule.vo.ScheduleVO;

class ScheduleMapperTest extends AbstractRootContextTest {
	@Autowired
	private ScheduleMapper mapper;
	@Test
	void testSelectSchedule() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectScheduleList() {
		fail("Not yet implemented");
	}

	@Test
	void testInsertSchedule() {
		ScheduleVO sdvo = new ScheduleVO();
		sdvo.setSchdulNo(123);
		sdvo.setSchdulSj("123");
		sdvo.setSchdulCn("123");
		sdvo.setSchdulPlace("123");
		sdvo.setSchdulIemCode("L01");
		assertDoesNotThrow(()-> mapper.insertSchedule(sdvo));
	}

	@Test
	void testUpdateSchedule() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteSchedule() {
		fail("Not yet implemented");
	}

}
