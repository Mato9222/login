package com.teamtodev.project.mapper;

import java.util.List;

import com.teamtodev.project.vo.ProjectBoardVO;

public interface ProjectBoardMapper {
	public Integer insertProjectBoard(ProjectBoardVO pjBoardVO);
	
	public int updateProjectBoard(ProjectBoardVO pjBoardVO);
	
	public List<ProjectBoardVO> selectProjectBoardList();
	
	public ProjectBoardVO selectProjectBoard(int pjBoardNo);
	
	public int deleteProjectBoard(ProjectBoardVO pjBoardVO);
}
