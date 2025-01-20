package com.teamtodev.project.mapper;

import static org.junit.jupiter.api.Assertions.*;

import java.util.List;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.project.vo.ProjectWorkVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class ProjectWorkMapperTest extends AbstractRootContextTest{
	
	@Autowired
	ProjectWorkMapper mapper;
	@Test
	void test() {
		fail("Not yet implemented");
	}
	@Test
	void listtest() {
		/* List<ProjectWorkVO> list = mapper.selectProjectWorkList(); */
		/* log.info("list:{}",list); */
	}
}
