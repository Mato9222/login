package com.teamtodev.main.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.teamtodev.board.vo.PostVO;
import com.teamtodev.mail.mapper.MailListMapper;
import com.teamtodev.main.mapper.MainMapper;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MainServiceImpl implements MainService {

	private final MainMapper mapper;
	
	/**
	 * 사이드바 받은메일 안읽은 수
	 * @param emplNo 사원번호
	 * @return 안읽은 메일 갯수
	 */
	@Override
	public int receEmailCount(int emplNo) {
		
		int rowcnt = mapper.receMailCount(emplNo);
		return rowcnt;
	}

	@Override
	public int tempMailCount(int emplNo) {
		int rowcnt = mapper.tempMailCount(emplNo);
		return rowcnt;
	}

	// 메인페이지 - 공지사항 목록 출력
	@Override
	public List<PostVO> mainPost(int bbsNo) {
		List<PostVO> post = mapper.mainPost(bbsNo);
		return post;
	}

	@Override
	public int snacWait(int emplNo) {
		int res = mapper.snacWait(emplNo);
		
		return res;
	}

	@Override
	public int snacComp(int emplNo) {
		int res = mapper.snacComp(emplNo);
		
		return res;
	}

	@Override
	public int snacReje(int emplNo) {
		int res = mapper.snacReje(emplNo);
		
		return res;
	}

	@Override
	public int snacTemp(int emplNo) {
		int res = mapper.snacTemp(emplNo);
		
		return res;
	}

}
