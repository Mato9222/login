package com.teamtodev.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.project.vo.ProjectLogVO;

@Mapper
public interface ProjectLogMapper {
	
	public int insertLog(ProjectLogVO logVO);
	
	public List<ProjectLogVO> selectLogList(String prjctCode);
}
