package com.teamtodev.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.project.vo.ProjectPostVO;
import com.teamtodev.project.vo.ProjectWorkVO;
@Mapper
public interface ProjectPostMapper {
	
	public int insertProjectPost(ProjectPostVO pjPostVO);
	
	public int updateProjectPost(ProjectPostVO pjPostVO);
	
	public List<ProjectPostVO> selectProjectPostList(String prjctCode);
	
	public ProjectPostVO selectProjectPost(ProjectPostVO pjPostVO);
	
	public int deleteProjectPost(int sntncNo);
	
	public List<ProjectPostVO> selectIndexPostList(int emplNo);
}
