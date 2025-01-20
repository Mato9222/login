package com.teamtodev.reservation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.reservation.mapper.ReservationMapper;
import com.teamtodev.reservation.vo.ReservationVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReservationServiceImpl implements ReservationService{

	private final ReservationMapper mapper;
	
	@Override
	public List<ReservationVO> retrieveReservationList(int emplNo) {
		return mapper.selectReservationList(emplNo);
	}

	@Override
	public ReservationVO retrieveReservation(String resveCode) {
		return mapper.selectReservation(resveCode);
	}

	@Override
	public int createReservation(ReservationVO rvVo) {
		return mapper.insertReservation(rvVo);
	}

	@Override
	public int modifyReservation(ReservationVO rvVo) {
		return mapper.updateReservation(rvVo);
	}

	@Override
	public int deleteReservation(String resveCode) {
		return mapper.deleteReservation(resveCode);
	}

	@Override
	public int returnReservation(String resveCode) {
		return mapper.returnReservation(resveCode);
	}

	@Override
	public List<ReservationVO> retrieveReserStartTimeList(ReservationVO rvVO) {
		return mapper.selectReserStartTimeList(rvVO);
	}

	@Override
	public List<ReservationVO> retrieveReserEndTimeList(ReservationVO rvVO) {
		return mapper.selectReserEndTimeList(rvVO);
	}

}
