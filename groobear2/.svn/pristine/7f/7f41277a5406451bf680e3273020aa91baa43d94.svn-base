package com.teamtodev.reservation.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.reservation.vo.ResourcesVO;
import com.teamtodev.reservation.vo.TimeTypeVO;

@Mapper
public interface ResourceMapper {
	// 회의실 전체 조회
	public List<ResourcesVO> selectRoomList();

	// 회사 차량 전체 조회
	public List<ResourcesVO> selectCarList();
	// 비품 전체 조회
	public List<ResourcesVO> selectUsingList();
	// 한개의 내역 상세 조회
	public ResourcesVO selectResourceDetail(int resrceNo);
	// 전체 조회
	public List<ResourcesVO> selectResourceList();
	// 시간 타임 조회
	public List<TimeTypeVO> selectTimeTypeList();
}
