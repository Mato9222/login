package com.teamtodev.mail.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.paging.PaginationInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
//Junit5 사용
@ExtendWith(SpringExtension.class)
class MailListMapperTest extends AbstractRootContextTest{

	@Autowired
	MailListMapper mailMapper;
	
	@Test
	void insertTest() {
		MailVO mail = new MailVO();
		
		mail.setEmplNo(41L);
		mail.setRecptnEmailAdres("21");
		log.debug("매퍼 : {}",mailMapper);
		assertEquals(1,mailMapper.insertMail(mail));
	}
	
	@Test
	void ListTest() {
		PaginationInfo page = new PaginationInfo();
//		page.setTotalRecord(mailMapper.selectTotal(page));
		log.info("{}",page);
		
		page.setCurrentPage(2);
		
		String recptnEmailAdres = "21";
		
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("recptnEmailAdres",recptnEmailAdres);
		
		List<MailVO> mailList = mailMapper.selectMailList(info);
		
		log.info("리스트 : {}",mailList);
		
	}
	
	@Test
	void detailTest() {
		int mail = 42;
		MailVO mailDetail = mailMapper.selectMail(mail);
		log.info("메일내용 : {}",mailDetail);
		
	}
	

}
