package com.teamtodev.schedule.service;

import java.util.List;

import com.teamtodev.schedule.vo.ScheduleVO;

public interface ScheduleService {
	
	public ScheduleVO retrieveSchedule(int schdulNo);
	
	public List<ScheduleVO> retrieveScheduleList(ScheduleVO scheVo);
	
	public int createSchedule(ScheduleVO sdVO);
	
	public int modifySchedule(ScheduleVO sdVO);
	
	public int deleteSchedule(int schdulNo);
	
	// 개인 일정 조회
	public List<ScheduleVO> retrieveOwnSchedule(int emplNo);
	// 부서 일정 조회
	public List<ScheduleVO> retrieveDeptSchedule(int deptNo);
	// 회사 일정 조회
	public List<ScheduleVO> retrieveCompanySchedule();

}
