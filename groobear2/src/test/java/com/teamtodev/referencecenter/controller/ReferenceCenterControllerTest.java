package com.teamtodev.referencecenter.controller;

import java.io.IOException;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//@ExtendWith(SpringExtension.class)
//@ContextConfiguration("classpath:/com/teamtodev/spring/conf/root-context.xml")
class ReferenceCenterControllerTest {
	
	// AppInfo.properties 파일의 refCenterFolder 경로 리소스로 사용
	@Value("\\192.168.142.4/groobear/refCenter/root")
	private Resource refCenterFolder;
	
	@Test
	void test() throws IOException {
		

		log.info("refCenterFolder : {}", refCenterFolder);
		log.info("refCenterFolder : {}", refCenterFolder.getFile().getPath());
		
		
		
//		File[] listFiles = refCenterFolder.getFile().listFiles();
//		log.info("URL : {}", listFiles.length );
		
	}

}
