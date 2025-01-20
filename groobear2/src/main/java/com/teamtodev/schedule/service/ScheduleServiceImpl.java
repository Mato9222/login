package com.teamtodev.schedule.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.schedule.mapper.ScheduleMapper;
import com.teamtodev.schedule.vo.ScheduleVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ScheduleServiceImpl implements ScheduleService{
	private final ScheduleMapper mapper;
	
	@Override
	public ScheduleVO retrieveSchedule(int schdulNo) {
		return mapper.selectSchedule(schdulNo);
	}

	@Override
	public List<ScheduleVO> retrieveScheduleList(ScheduleVO scheVo) {
		return mapper.selectScheduleList(scheVo);
	}

	@Override
	public int createSchedule(ScheduleVO sdVO) {
		return mapper.insertSchedule(sdVO);
	}

	@Override
	public int modifySchedule(ScheduleVO sdVO) {
		return mapper.updateSchedule(sdVO);
	}

	@Override
	public int deleteSchedule(int schdulNo) {
		return mapper.deleteSchedule(schdulNo);
	}

	@Override
	public List<ScheduleVO> retrieveOwnSchedule(int emplNo) {
		return mapper.selectOwnSchedule(emplNo);
	}

	@Override
	public List<ScheduleVO> retrieveDeptSchedule(int deptNo) {
		return mapper.selectDeptSchedule(deptNo);
	}

	@Override
	public List<ScheduleVO> retrieveCompanySchedule() {
		return mapper.selectCompanySchedule();
	}

}
