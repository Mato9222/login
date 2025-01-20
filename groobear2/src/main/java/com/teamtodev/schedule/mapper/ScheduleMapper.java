package com.teamtodev.schedule.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.schedule.vo.ScheduleVO;

@Mapper
public interface ScheduleMapper {
	// 일정 상세 조회
	public ScheduleVO selectSchedule(int schdulNo);
	// 전체 일정 조회
	public List<ScheduleVO> selectScheduleList(ScheduleVO scheVo);
	// 일정 추가
	public int insertSchedule(ScheduleVO sdVO);
	// 일정 수정
	public int updateSchedule(ScheduleVO sdVO);
	// 일정 삭제
	public int deleteSchedule(int schdulNo);
	// 개인 일정 조회
	public List<ScheduleVO> selectOwnSchedule(int emplNo);
	// 부서 일정 조회
	public List<ScheduleVO> selectDeptSchedule(int deptNo);
	// 회사 일정 조회
	public List<ScheduleVO> selectCompanySchedule();
}
