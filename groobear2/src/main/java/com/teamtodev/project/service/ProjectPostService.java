package com.teamtodev.project.service;

import java.util.List;

import com.teamtodev.project.vo.ProjectPostVO;

public interface ProjectPostService {
	
	public int createProjectPost(ProjectPostVO pjPostVO);
	
	public int modifyProjectPost(ProjectPostVO pjPostVO);
	
	public List<ProjectPostVO> retrieveProjectPostList(String prjctCode);
	
	public ProjectPostVO retrieveProjectPost(ProjectPostVO pjPostVO);
	
	public int deleteProjectPost(int sntncNo);
	
	public List<ProjectPostVO> retrieveIndexPostList(int emplNo);
}
