package com.teamtodev.reservation.vo;

import java.util.List;

import javax.validation.constraints.NotNull;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="resveTimeNo")
public class TimeTypeVO {
	@NotNull
	private int resveTimeNo;
	private String beginTime;
	private String endTime;
	
	private List<ReservationVO> reservationList;
}
