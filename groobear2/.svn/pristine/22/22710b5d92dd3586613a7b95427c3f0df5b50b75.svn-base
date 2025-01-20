package com.teamtodev.attendance.service;

import java.util.List;

import com.teamtodev.attendance.vo.AttendanceVO;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.enumpkg.AttendanceType;

public interface AttendanceService {
	/**
	 * 사원 목록 선택
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeList();
	
	/**
	 * 사원 목록 선택
	 * @param emplNo
	 * @return
	 */
	public EmployeeVO selectEmployee(int emplNo);
	
	/**
	 * 근태일자 등록
	 * @return
	 */
	public int insertAttendance();
	
	/**
	 * 출근 시간 등록
	 * @param dclzNo
	 * @param actionType
	 * @return
	 */
	public int updateAttendance(long dclzNo, AttendanceType attendanceType);

	/**
	 * 전체 사원 출/퇴근 전체 조회
	 * @return
	 */
	public List<AttendanceVO> selectAttendanceList();
	
	/**
	 * 한 명의 출/퇴근 전체 조회
	 * @param emplNo
	 * @return
	 */
	public List<AttendanceVO> selectAttendance(int emplNo);
	
	/**
	 * 한 명의 하루 출/퇴근 조회
	 * @param emplNo, String dclzDe
	 * @return
	 */
	public AttendanceVO selectAttendanceByDay(int emplNo, String dclzDe);
}
