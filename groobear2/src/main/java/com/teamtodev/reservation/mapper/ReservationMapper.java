package com.teamtodev.reservation.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.reservation.vo.ReservationVO;

@Mapper
public interface ReservationMapper {
	
	public List<ReservationVO> selectReservationList(int emplNo);
	
	public ReservationVO selectReservation(String resveCode);
	
	public int insertReservation(ReservationVO rvVo);
	
	public int updateReservation(ReservationVO rvVo);
	
	public int deleteReservation(String resveCode);
	
	public int returnReservation(String resveCode);
	
	public List<ReservationVO> selectReserStartTimeList(ReservationVO rvVO);
	
	public List<ReservationVO> selectReserEndTimeList(ReservationVO rvVO);
	
}

