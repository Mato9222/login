package com.teamtodev.reservation.service;

import java.util.List;

import com.teamtodev.reservation.vo.ResourcesVO;
import com.teamtodev.reservation.vo.TimeTypeVO;

public interface ResourceService {
	// 회의실 전체 조회
	public List<ResourcesVO> retrieveRoomList();
	// 회사 차량 전체 조회
	public List<ResourcesVO> retrieveCarList();
	// 비품 전체 조회
	public List<ResourcesVO> retrieveUsingList();
	// 한개의 내역 상세 조회
	public ResourcesVO retrieveResourceDetail(int resrceNo);
	// 전체조회
	public List<ResourcesVO> retrieveResourceList();
	// 시간 타임 조회
	public List<TimeTypeVO> retrieveTimeTypeList();
}
