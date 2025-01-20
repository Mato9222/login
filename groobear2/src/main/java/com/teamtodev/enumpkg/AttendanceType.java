package com.teamtodev.enumpkg;

import lombok.AllArgsConstructor;

@AllArgsConstructor
public enum AttendanceType {
	ATTEND("출근"), LVFFC("퇴근");
	
	private final String desc;
}
