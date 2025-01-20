package com.teamtodev.attendance.service;

import java.util.List;

import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.teamtodev.attendance.mapper.AttendanceMapper;
import com.teamtodev.attendance.vo.AttendanceVO;
import com.teamtodev.employees.exception.PkNotFoundException;
import com.teamtodev.employees.mapper.EmployeeMapper;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.enumpkg.AttendanceType;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
@EnableScheduling
public class AttendanceServiceImpl implements AttendanceService {
	private final AttendanceMapper attendanceMapper;
	private final EmployeeMapper employeeMapper;

	@Override
	public List<EmployeeVO> selectEmployeeList() {
		List<EmployeeVO> emplList = employeeMapper.selectEmployeeList();
		return emplList;
	}
	
	@Override
	public EmployeeVO selectEmployee(int emplNo) {
		EmployeeVO emplVO = employeeMapper.selectEmployeeByNo(emplNo).orElseThrow(() -> new PkNotFoundException(500));
		return emplVO;
	}
	
	@Override
	@Scheduled(cron = "0 0 0 * * 1-5")
	public int insertAttendance() {
		int cnt = 0;
		
		List<EmployeeVO> emplList = selectEmployeeList();
		for(EmployeeVO emplVO : emplList) {
			emplVO.getEmplNo();
			if(attendanceMapper.insertAttendance(emplVO.getEmplNo()) > 0) {
				cnt++;
			}
		}
		return cnt;
	}

	@Override
	public int updateAttendance(long dclzNo, AttendanceType attendanceType) {
		switch (attendanceType) {
		case ATTEND:
			return attendanceMapper.updateAttendanceAttend(dclzNo);
			
		case LVFFC:
			return attendanceMapper.updateAttendanceLvffc(dclzNo);
		}
		
		throw new IllegalArgumentException();
	}

	@Override
	public List<AttendanceVO> selectAttendanceList() {
		List<AttendanceVO> attendanceList = attendanceMapper.selectAttendanceList();
		return attendanceList;
	}

	@Override
	public List<AttendanceVO> selectAttendance(int emplNo) {
		List<AttendanceVO> attendanceList = attendanceMapper.selectAttendance(emplNo);
		return attendanceList;
	}

	@Override
	public AttendanceVO selectAttendanceByDay(int emplNo, String dclzDe) {
		AttendanceVO attendanceVO = attendanceMapper.selectAttendanceByDay(emplNo, dclzDe);
		return attendanceVO;
	}

}
