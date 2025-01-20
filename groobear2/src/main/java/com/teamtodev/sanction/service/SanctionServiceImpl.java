package com.teamtodev.sanction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.sanction.mapper.SanctionDocMapper;
import com.teamtodev.sanction.mapper.SanctionMapper;
import com.teamtodev.sanction.vo.SanctionVO;

@Service
public class SanctionServiceImpl implements SanctionService{

	@Autowired
	private SanctionMapper mapper;
	
	@Override
	public ServiceResult insertSanction(SanctionVO scVO) {
		return mapper.insertSanction(scVO)>0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<SanctionVO> emplSanctionList(int emplNo) {
		List<SanctionVO> scVO;
		scVO = mapper.emplSanctionList(emplNo);
		return scVO;
	}

	@Override
	public ServiceResult deleteSanction(String scNo) {
		return mapper.deleteSanction(scNo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<SanctionVO> scDocSanctionList(String scDocNo) {
		List<SanctionVO> scList;
		scList = mapper.scDocSanctionList(scDocNo);
		return scList;
	}

	@Override
	public ServiceResult updateSanction(SanctionVO scVO) {
		return mapper.updateSanction(scVO) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public SanctionVO scDocLastOrdrSanction(String scDocNo) {
		SanctionVO scVO = mapper.scDocLastOrdrSanction(scDocNo);
		return scVO;
	}

	@Override
	public ServiceResult updateReSanction(SanctionVO scVO) {
		return mapper.updateReSanction(scVO) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

}
