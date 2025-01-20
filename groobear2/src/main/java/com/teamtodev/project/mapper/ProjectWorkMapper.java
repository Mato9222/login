package com.teamtodev.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.project.vo.ProjectWorkVO;

@Mapper
public interface ProjectWorkMapper {
	public int insertProjectWork(ProjectWorkVO pjWorkVO);
	
	public int updateProjectWork(ProjectWorkVO pjWorkVO);
	
	public List<ProjectWorkVO> selectProjectWorkList(String prjctCode);
	
	public ProjectWorkVO selectProjectWork(int worksNo);
	
	public int deleteProjectWork(int worksNo);
	
	public int selectProjectWorkStatusCount(ProjectWorkVO pjWorkVO);
	
	public List<ProjectWorkVO> selectIndexWorkList(int emplNo);
	
	public int selectIndexDetailWorkAllCount(ProjectWorkVO pjWorkVO);
	
	public int selectIndexDetailWorkCountG02(ProjectWorkVO pjWorkVO);
}
