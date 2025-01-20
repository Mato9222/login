package com.teamtodev.project.service;

import java.util.List;

import com.teamtodev.project.vo.ProjectWorkVO;

public interface ProjectWorkService {
	public int createProjectWork(ProjectWorkVO pjWorkVO);
	
	public int modifyProjectWork(ProjectWorkVO pjWorkVO);
	
	public List<ProjectWorkVO> retrieveProjectWorkList(String prjctCode);
	
	public ProjectWorkVO retrieveProjectWork(int worksNo);
	
	public int deleteProjectWork(int worksNo);
	
	public int retrieveProjectWorkStatusCount(ProjectWorkVO pjWorkVO);
	
	public List<ProjectWorkVO> retrieveIndexWorkList(int emplNo);
	
	public int retrieveIndexDetailWorkAllCount(ProjectWorkVO pjWorkVO);
	
	public int retrieveIndexDetailWorkCountG02(ProjectWorkVO pjWorkVO);
	
}
