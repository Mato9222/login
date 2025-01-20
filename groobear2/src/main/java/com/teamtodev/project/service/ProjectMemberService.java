package com.teamtodev.project.service;

import java.util.List;

import com.teamtodev.project.vo.ProjectMemberVO;

public interface ProjectMemberService {

	public int createProjectMember(ProjectMemberVO pjMemVO);
	
	public int modifyProjectMember(ProjectMemberVO pjMemVO);
	
	public List<ProjectMemberVO> retrieveProjectMemberList();
	
	public ProjectMemberVO retrieveProjectMember(int pjMemNo);
	
	public int deleteProjectMember(ProjectMemberVO pjMemVO);
	
	public Integer retrieveProjectNumber(ProjectMemberVO pjMemVO);
	
	public String retrieveProjectRoleName(ProjectMemberVO pjMemVO);
}
