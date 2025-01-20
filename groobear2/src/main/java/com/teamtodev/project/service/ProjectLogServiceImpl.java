package com.teamtodev.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.project.mapper.ProjectLogMapper;
import com.teamtodev.project.vo.ProjectLogVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectLogServiceImpl implements ProjectLogService{
	
	private final ProjectLogMapper mapper;
	
	@Override
	public int createLog(ProjectLogVO logVO) {
		return mapper.insertLog(logVO);
	}

	@Override
	public List<ProjectLogVO> retrieveLogList(String prjctCode) {
		return mapper.selectLogList(prjctCode);
	}

}
