package com.teamtodev.reservation.service;

import java.util.List;

import com.teamtodev.reservation.vo.ReservationVO;

public interface ReservationService {
	
	public List<ReservationVO> retrieveReservationList(int emplNo);
	
	public ReservationVO retrieveReservation(String resveCode);
	
	public int createReservation(ReservationVO rvVo);
	
	public int modifyReservation(ReservationVO rvVo);
	
	public int deleteReservation(String resveCode);
	
	public int returnReservation(String resveCode);
	
	public List<ReservationVO> retrieveReserStartTimeList(ReservationVO rvVO);
	
	public List<ReservationVO> retrieveReserEndTimeList(ReservationVO rvVO);
}
