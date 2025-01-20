package com.teamtodev.documents.mapper;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.fail;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.teamtodev.AbstractRootContextTest;
import com.teamtodev.documents.vo.DocumentFormVO;

class DocumentFormMapperTest extends AbstractRootContextTest{

	@Autowired
	DocumentFormMapper mapper;
	
	@Test
	void testInsertDocumentForm() {
		DocumentFormVO dcformVO = new DocumentFormVO();
		dcformVO.setDoorSign("일일업무보고서");
		dcformVO.setDocTy("일반");
		dcformVO.setDocTyCode("O01");
		int cnt = mapper.insertDocumentForm(dcformVO);
		System.out.println("결재양식 insert 테스트 : " + dcformVO);
		assertEquals(1, cnt);
	}

	@Test
	void testDocumentFormList() {
		fail("Not yet implemented");
	}

	@Test
	void testSelectDocumentForm() {
		fail("Not yet implemented");
	}

	@Test
	void testDeleteDocumentForm() {
		fail("Not yet implemented");
	}

}
