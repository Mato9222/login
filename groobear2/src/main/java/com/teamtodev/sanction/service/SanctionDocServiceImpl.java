package com.teamtodev.sanction.service;

import java.io.File;
import java.util.List;
import java.util.Optional;

import org.apache.commons.lang3.function.Failable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.teamtodev.attachfile.mapper.AttachMapper;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.sanction.mapper.SanctionDocMapper;
import com.teamtodev.sanction.vo.SanctionDocVO;
import com.teamtodev.sanction.vo.SanctionVO;

@Service
public class SanctionDocServiceImpl implements SanctionDocService{

	@Autowired
	private SanctionDocMapper mapper;
	
	@Value("#{appInfo.attachFolderTemp}")
	private File saveFolder;
	
	@Autowired
	private AttachMapper atchMapper;
	
	public void insertSantnAttach(SanctionDocVO scDocVO) {
		try {
			List<AttachVO> atchList = scDocVO.getAttchFileList();
			Optional.ofNullable(atchList)
			.filter(l->!l.isEmpty())
			.ifPresent(pl->{
				atchMapper.insertSantnAttach(scDocVO);
				pl.forEach(Failable.asConsumer((p)->p.saveToFolder(saveFolder)));
			});
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
	
	@Override
	public ServiceResult insertSanctionDoc(SanctionDocVO scDocVO) {
		if (mapper.insertSanctionDoc(scDocVO)>0) {
			insertSantnAttach(scDocVO);
			return ServiceResult.OK;
		}else {
			return ServiceResult.FAIL;
		}
	}

	@Override
	public List<SanctionDocVO> SanctionDocList(SanctionDocVO scDocVO) {
		List<SanctionDocVO> scDocList;
		scDocList = mapper.SanctionDocList(scDocVO);
		return scDocList;
	}

	@Override
	public SanctionDocVO selectSanctionDoc(String scDocNo) {
		SanctionDocVO scDocVO = mapper.selectSanctionDoc(scDocNo);
		return scDocVO;
	}

	@Override
	public ServiceResult deleteSanctionDoc(String scDocNo) {
		return mapper.deleteSanctionDoc(scDocNo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<SanctionDocVO> WaitSanctionDocList(int emplNo) {
		List<SanctionDocVO> scDocVO;
		scDocVO = mapper.WaitSanctionDocList(emplNo);
		return scDocVO;
	}

	@Override
	public ServiceResult updateSanctionDocSttus(SanctionDocVO scDocVO) {
		return mapper.updateSanctionDocSttus(scDocVO) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public ServiceResult updateSanctionDoc(SanctionDocVO scDocVO) {
		return mapper.updateSanctionDoc(scDocVO) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<SanctionDocVO> SanctionDocFinishList(String sttus) {
		return mapper.SanctionDocFinishList(sttus);
	}

	@Override
	public ServiceResult updateSanctionDocURL(SanctionVO scDocVO) {
		return mapper.updateSanctionDocURL(scDocVO) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<SanctionDocVO> SanctionDocRcverList(SanctionDocVO scDocVO) {
		return mapper.SanctionDocRcverList(scDocVO);
	}

	@Override
	public List<SanctionDocVO> SanctionDocRefList(SanctionDocVO scDocVO) {
		return mapper.SanctionDocRefList(scDocVO);
	}

	@Override
	public List<SanctionDocVO> SanctionDocFinish(SanctionDocVO scDocVO) {
		return mapper.SanctionDocFinish(scDocVO);
	}

}
