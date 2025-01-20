package com.teamtodev.reservation.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.reservation.mapper.ResourceMapper;
import com.teamtodev.reservation.vo.ResourcesVO;
import com.teamtodev.reservation.vo.TimeTypeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ResourceServiceImpl implements ResourceService {
	private final ResourceMapper mapper;
	
	@Override
	public List<ResourcesVO> retrieveRoomList() {
		return mapper.selectRoomList();
	}

	@Override
	public List<ResourcesVO> retrieveCarList() {
		return mapper.selectCarList();
	}

	@Override
	public List<ResourcesVO> retrieveUsingList() {
		return mapper.selectUsingList();
	}

	@Override
	public ResourcesVO retrieveResourceDetail(int resrceNo) {
		return mapper.selectResourceDetail(resrceNo);
	}

	@Override
	public List<ResourcesVO> retrieveResourceList() {
		return mapper.selectResourceList();
	}

	@Override
	public List<TimeTypeVO> retrieveTimeTypeList() {
		return mapper.selectTimeTypeList();
	}

}
