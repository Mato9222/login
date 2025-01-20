package com.teamtodev.sanction.mapper;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.sanction.vo.SanctionVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class SanctionMapperTest extends AbstractRootContextTest {

	@Autowired
	SanctionMapper mapper;
	
	@Test
	void testInsertSanction() {
		SanctionVO scVO = new SanctionVO();
		scVO.setSanctnLineNo("SFL00007");
		scVO.setSanctnDocNo("GB-SAN_2405270062");
		scVO.setSanctnEmplNo(2405172);
		scVO.setSanctnOrdr(1);
		mapper.insertSanction(scVO);
		log.info("인서트한 list ==> {}", scVO);
	}

	@Test
	void testEmplSanctionList() {
		fail("Not yet implemented");
	}

	@Test
	void testScDocSanctionList() {
		String scDocNo = "GB-SAN_2405250051";
		List<SanctionVO> scVO = mapper.scDocSanctionList(scDocNo);
		log.info("조회한 list ==> {}", scVO);
	}

	@Test
	void testDeleteSanctionInt() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteSanctionString() {
		fail("Not yet implemented");
	}

}
