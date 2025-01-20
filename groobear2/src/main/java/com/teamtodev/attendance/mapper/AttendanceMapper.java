package com.teamtodev.attendance.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.teamtodev.attendance.vo.AttendanceVO;

@Mapper
public interface AttendanceMapper {
	/**
	 * 근태일자 등록
	 * @param emplNo
	 * @return
	 */
	public int insertAttendance(int emplNo);
	
	/**
	 * 출근 시간 등록
	 * @param dclzNo
	 * @param employeeVO
	 * @return
	 */
	public int updateAttendanceAttend(long dclzNo);
	
	/**
	 * 퇴근 시간 갱신
	 * @param attendanceVO
	 * @param employeeVO
	 * @return
	 */
	public int updateAttendanceLvffc(long dclzNo);
	
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
	 * @param emplNo
	 * @return
	 */
	public AttendanceVO selectAttendanceByDay(@Param("emplNo") int emplNo, @Param("dclzDe") String dclzDe);
}
