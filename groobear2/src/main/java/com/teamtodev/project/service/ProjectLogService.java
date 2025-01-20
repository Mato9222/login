package com.teamtodev.project.service;

import java.util.List;

import com.teamtodev.project.vo.ProjectLogVO;

public interface ProjectLogService {
	
	public int createLog(ProjectLogVO logVO);
	
	public List<ProjectLogVO> retrieveLogList(String prjctCode);
}
