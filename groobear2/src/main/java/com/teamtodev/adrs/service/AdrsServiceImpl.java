package com.teamtodev.adrs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamtodev.adrs.mapper.AdrsMapper;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AdrsServiceImpl implements AdrsService{

	@Autowired
	private AdrsMapper mapper;
	
	@Override
	public List<EmployeeVO> selectList() {
		log.info("여기왔어");
		List<EmployeeVO> emplList = mapper.selectEmplList();
		
		log.info("여기는 ?");
		return emplList;
	}

}
