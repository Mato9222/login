package com.teamtodev.documents.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamtodev.documents.mapper.DocumentFormMapper;
import com.teamtodev.documents.vo.DocumentFormVO;
import com.teamtodev.employees.exception.PkNotFoundException;
import com.teamtodev.enumpkg.ServiceResult;

@Service
public class DocumentFormServiceImpl implements DocumentFormService{

	@Autowired
	private DocumentFormMapper dcformMapper;
	
	@Override
	public ServiceResult insertDocumentForm(DocumentFormVO dcformVO) {
		return dcformMapper.insertDocumentForm(dcformVO) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<DocumentFormVO> documentFormList() {
		List<DocumentFormVO> dcFormList;
		dcFormList = dcformMapper.documentFormList();
		return dcFormList;
	}

	@Override
	public DocumentFormVO selectDocumentForm(String dcformNo) {
		DocumentFormVO dcFormVO = new DocumentFormVO();
		dcFormVO = dcformMapper.selectDocumentForm(dcformNo);
		if(dcFormVO == null) throw new PkNotFoundException(500);
		return dcFormVO;
	}

	@Override
	public ServiceResult deleteDocumentForm(String dcformNo) {
		return dcformMapper.deleteDocumentForm(dcformNo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
