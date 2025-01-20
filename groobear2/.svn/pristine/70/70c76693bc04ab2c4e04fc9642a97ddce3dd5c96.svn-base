package com.teamtodev.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.project.mapper.ProjectWorkMapper;
import com.teamtodev.project.vo.ProjectWorkVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectWorkServiceImpl implements ProjectWorkService {
	
	
	private final ProjectWorkMapper mapper;
	
	@Override
	public int createProjectWork(ProjectWorkVO pjWorkVO) {
		return mapper.insertProjectWork(pjWorkVO);
	}

	@Override
	public int modifyProjectWork(ProjectWorkVO pjWorkVO) {
		return mapper.updateProjectWork(pjWorkVO);
	}

	@Override
	public List<ProjectWorkVO> retrieveProjectWorkList(String prjctCode) {
		return mapper.selectProjectWorkList(prjctCode);
	}

	@Override
	public ProjectWorkVO retrieveProjectWork(int worksNo) {
		return mapper.selectProjectWork(worksNo);
	}

	@Override
	public int deleteProjectWork(int worksNo) {
		return mapper.deleteProjectWork(worksNo);
	}

	@Override
	public int retrieveProjectWorkStatusCount(ProjectWorkVO pjWorkVO) {
		return mapper.selectProjectWorkStatusCount(pjWorkVO);
	}

	@Override
	public List<ProjectWorkVO> retrieveIndexWorkList(int emplNo) {
		return mapper.selectIndexWorkList(emplNo);
	}

	@Override
	public int retrieveIndexDetailWorkAllCount(ProjectWorkVO pjWorkVO) {
		return mapper.selectIndexDetailWorkAllCount(pjWorkVO);
	}

	@Override
	public int retrieveIndexDetailWorkCountG02(ProjectWorkVO pjWorkVO) {
		return mapper.selectIndexDetailWorkCountG02(pjWorkVO);
	}
	
}
