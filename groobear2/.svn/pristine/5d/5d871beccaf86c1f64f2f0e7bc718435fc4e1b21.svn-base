package com.teamtodev.sanction.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamtodev.employees.exception.PkNotFoundException;
import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.sanction.mapper.SanctionLineMapper;
import com.teamtodev.sanction.vo.SanctionLineVO;

@Service
public class SanctionLineServiceImpl implements SanctionLineService{

	@Autowired
	private SanctionLineMapper sclineMapper;
	
	@Override
	public ServiceResult insertSanctionLine(SanctionLineVO sclineVO) {
		return sclineMapper.insertSanctionLine(sclineVO) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<SanctionLineVO> selectSanctionLine(String sclineNo) {
		List<SanctionLineVO> snlineVo = sclineMapper.selectSanctionLine(sclineNo);
		if (snlineVo == null) {
			throw new PkNotFoundException(500);
		}
		return snlineVo;
	}

	@Override
	public ServiceResult deleteSanctionLine(String sclineNo) {
		return sclineMapper.deleteSanctionLine(sclineNo) > 0 ? ServiceResult.OK : ServiceResult.FAIL;
	}

	@Override
	public List<SanctionLineVO> SanctionLineList(int emplNo) {
		List<SanctionLineVO> snlineList = null;
		snlineList = sclineMapper.SanctionLineList(emplNo);
		return snlineList;
	}

	@Override
	public List<SanctionLineVO> selectNonSanctionLine(String sclineNo) {
		List<SanctionLineVO> snlineVo = sclineMapper.selectNonSanctionLine(sclineNo);
		if (snlineVo == null) {
			throw new PkNotFoundException(500);
		}
		return snlineVo;
	}

	@Override
	public List<SanctionLineVO> selectSCSanctionLine(String sclineNo) {
		List<SanctionLineVO> snlineVo = sclineMapper.selectSCSanctionLine(sclineNo);
		if (snlineVo == null) {
			throw new PkNotFoundException(500);
		}
		return snlineVo;
	}

}
