package com.teamtodev.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.project.mapper.ProjectMapper;
import com.teamtodev.project.vo.ProjectVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectServiceImpl implements ProjectService {
	
	private final ProjectMapper mapper;

	@Override
	public Integer createProject(ProjectVO pjVO) {
		return mapper.insertProject(pjVO);
	}

	@Override
	public int modifyProject(ProjectVO pjVO) {
		return mapper.updateProject(pjVO);
	}

	@Override
	public List<ProjectVO> retrieveProjectList() {
		return mapper.selectProjectList();
	}

	@Override
	public ProjectVO retrieveProject(String prjctCode) {
		return mapper.selectProject(prjctCode);
	}

	@Override
	public int deleteProject(ProjectVO pjVO) {
		return mapper.deleteProject(pjVO);
	}

	@Override
	public List<ProjectVO> retrieveMyProject(int emplNo) {
		return mapper.selectMyProject(emplNo);
	}

	@Override
	public List<ProjectVO> retrieveDetailProject(String prjctCode) {
		return mapper.selectDetailProject(prjctCode);
	}

	@Override
	public int countProjectCodeZ01() {
		return mapper.countProjectCodeZ01();
	}

	@Override
	public int countProjectCodeZ02() {
		return mapper.countProjectCodeZ02();
	}

	@Override
	public int countProjectCodeZ03() {
		return mapper.countProjectCodeZ03();
	}

	@Override
	public int countProjectCodeZ04() {
		return mapper.countProjectCodeZ04();
	}

}
