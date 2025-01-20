package com.teamtodev.project.mapper;

import static org.junit.jupiter.api.Assertions.fail;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.project.vo.ProjectVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class ProjectMapperTest extends AbstractRootContextTest {
	@Autowired
	ProjectMapper mapper;
	
	@Test
	void test() {
		fail("Not yet implemented");
	}
	
	@Test
	void projectList() {
		List<ProjectVO> proList =  mapper.selectProjectList();
		log.info("proList:{}",proList);
		log.info("proList size:{}",proList.size());
		
	}
	@Test
	void detailproject() {
		List<ProjectVO> detailList = mapper.selectDetailProject("PJ240528026");
		log.info("detail:{}",detailList);
		log.info("detail size:{}",detailList.size());
	}
}
