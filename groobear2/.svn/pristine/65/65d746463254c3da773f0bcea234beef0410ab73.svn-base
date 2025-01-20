package com.teamtodev.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.project.vo.ProjectMemberVO;
import com.teamtodev.project.vo.ProjectVO;

@Mapper
public interface ProjectMapper {
	
	public Integer insertProject(ProjectVO pjVO);
	
	public int updateProject(ProjectVO pjVO);
	
	public List<ProjectVO> selectProjectList();
	
	public ProjectVO selectProject(String prjctCode);
	
	public List<ProjectVO> selectMyProject(int emplNo);
	
	public List<ProjectVO> selectDetailProject(String prjctCode);
	
	public int deleteProject(ProjectVO pjVO);
	
	public int countProjectCodeZ01();
	
	public int countProjectCodeZ02();
	
	public int countProjectCodeZ03();
	
	public int countProjectCodeZ04();
}
