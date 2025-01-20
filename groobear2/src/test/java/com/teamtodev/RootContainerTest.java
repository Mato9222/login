package com.teamtodev;

import javax.sql.DataSource;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import lombok.extern.slf4j.Slf4j;

@Slf4j
class RootContainerTest extends AbstractRootContextTest{
	@Autowired
	DataSource dataSource;
	
	@Test
	void test() {
		log.info("주입된 객체 : {}", dataSource);
	}

}
