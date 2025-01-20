package com.teamtodev.project.service;

import java.util.List;

import com.teamtodev.project.vo.ProjectVO;

public interface ProjectService {

	public Integer createProject(ProjectVO pjVO);
	
	public int modifyProject(ProjectVO pjVO);
	
	public List<ProjectVO> retrieveProjectList();
	
	public ProjectVO retrieveProject(String prjctCode);
	
	public List<ProjectVO> retrieveMyProject(int emplNo);
	
	public List<ProjectVO> retrieveDetailProject(String prjctCode);
	
	public int deleteProject(ProjectVO pjVO);
	
	public int countProjectCodeZ01();
	
	public int countProjectCodeZ02();
	
	public int countProjectCodeZ03();
	
	public int countProjectCodeZ04();
}
