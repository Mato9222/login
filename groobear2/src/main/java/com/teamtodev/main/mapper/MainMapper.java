package com.teamtodev.main.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.teamtodev.board.vo.PostVO;

@Mapper
public interface MainMapper {
	
	public int receMailCount(int emplNo);
	
	public int tempMailCount(int emplNo);
	
	public List<PostVO> mainPost(@Param(value = "bbsNo") int bbsNo);
	
	public int snacWait(int emplNo);
	
	public int snacComp(int emplNo);
	
	public int snacReje(int emplNo);

	public int snacTemp(int emplNo);
}
