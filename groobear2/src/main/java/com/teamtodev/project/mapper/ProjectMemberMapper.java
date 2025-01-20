package com.teamtodev.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.project.vo.ProjectMemberVO;

@Mapper
public interface ProjectMemberMapper {
	public int insertProjectMember(ProjectMemberVO pjMemVO);
	
	public int updateProjectMember(ProjectMemberVO pjMemVO);
	
	public List<ProjectMemberVO> selectProjectMemberList();
	
	public ProjectMemberVO selectProjectMember(int pjMemNo);
	
	public int deleteProjectMember(ProjectMemberVO pjMemVO);
	
	public Integer selectProjectNumber(ProjectMemberVO pjMemVO);
	
	public String selectProjectRoleName(ProjectMemberVO pjMemVO);
}
