package com.teamtodev.schedule.vo;

import java.time.LocalDateTime;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "schdulNo")
public class ScheduleVO {
	@NotNull
	private int schdulNo;
	@NotNull
	private int emplNo;
	private LocalDateTime schdulBeginDate;
	private LocalDateTime schdulEndDate;
	private String schdulSj;
	private String schdulCn;
	private String schdulIemCode;
	private String schdulPlace;
	private String allDay;
	private int deptNo;
	
}
