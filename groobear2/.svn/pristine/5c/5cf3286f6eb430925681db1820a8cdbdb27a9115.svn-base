package com.teamtodev.project.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.project.mapper.ProjectMemberMapper;
import com.teamtodev.project.vo.ProjectMemberVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ProjectMemberServiceImpl implements ProjectMemberService{
	
	private final ProjectMemberMapper mapper;
	
	@Override
	public int createProjectMember(ProjectMemberVO pjMemVO) {
		return mapper.insertProjectMember(pjMemVO);
	}

	@Override
	public int modifyProjectMember(ProjectMemberVO pjMemVO) {
		return mapper.updateProjectMember(pjMemVO);
	}

	@Override
	public List<ProjectMemberVO> retrieveProjectMemberList() {
		return mapper.selectProjectMemberList();
	}

	@Override
	public ProjectMemberVO retrieveProjectMember(int pjMemNo) {
		return mapper.selectProjectMember(pjMemNo);
	}

	@Override
	public int deleteProjectMember(ProjectMemberVO pjMemVO) {
		return mapper.deleteProjectMember(pjMemVO);
	}

	@Override
	public Integer retrieveProjectNumber(ProjectMemberVO pjMemVO) {
		return mapper.selectProjectNumber(pjMemVO);
	}

	@Override
	public String retrieveProjectRoleName(ProjectMemberVO pjMemVO) {
		return mapper.selectProjectRoleName(pjMemVO);
	}

}
