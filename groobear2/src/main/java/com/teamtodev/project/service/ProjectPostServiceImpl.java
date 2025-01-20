package com.teamtodev.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.project.mapper.ProjectPostMapper;
import com.teamtodev.project.vo.ProjectPostVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectPostServiceImpl implements ProjectPostService{
	
	private final ProjectPostMapper mapper;
	
	@Override
	public int createProjectPost(ProjectPostVO pjPostVO) {
		return mapper.insertProjectPost(pjPostVO);
	}

	@Override
	public int modifyProjectPost(ProjectPostVO pjPostVO) {
		return mapper.updateProjectPost(pjPostVO);
	}

	@Override
	public List<ProjectPostVO> retrieveProjectPostList(String prjctCode) {
		return mapper.selectProjectPostList(prjctCode);
	}

	@Override
	public ProjectPostVO retrieveProjectPost(ProjectPostVO pjPostVO) {
		return mapper.selectProjectPost(pjPostVO);
	}

	@Override
	public int deleteProjectPost(int sntncNo) {
		return mapper.deleteProjectPost(sntncNo);
	}

	@Override
	public List<ProjectPostVO> retrieveIndexPostList(int emplNo) {
		return mapper.selectIndexPostList(emplNo);
	}

}
