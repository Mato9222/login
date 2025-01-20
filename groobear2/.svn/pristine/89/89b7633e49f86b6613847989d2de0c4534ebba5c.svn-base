package com.teamtodev.attachfile.service;

import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Optional;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;

import com.teamtodev.attachfile.mapper.AttachMapper;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.board.vo.PostVO;
import com.teamtodev.common.service.CommonService;
import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.project.vo.ProjectPostVO;
import com.teamtodev.project.vo.ProjectWorkVO;
import com.teamtodev.sanction.vo.SanctionDocVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class AttachServiceImpl implements AttachService {
	
	@Autowired
	private CommonService commonService; // 공통코드 서비스
	
	@Autowired
	private AttachMapper attachMapper; // 첨부파일 맵퍼
	
	
	@Value("#{appInfo.attachFolder}")
	private Resource saveFolder; // 저장할 디렉토리 경로
	
	
	@PostConstruct
	public void init() throws IOException {
		if(!saveFolder.exists()) saveFolder.getFile().mkdirs(); // 저장할 디렉토리가 없다면 생성
	}
	
	/**
	 * 게시판 - 첨부파일정보 DB 등록 메서드
	 * @param postVO - 게시글VO
	 */
	@Override
	public int insertAttachFiles(PostVO postVO){
		return attachMapper.insertAttach(postVO); // db 밀어넣기
	}
	
	/**
	 * 메일 - 첨부파일정보 DB 등록 메서드
	 * @param postVO - 게시글VO
	 */
	@Override
	public int insertMailAttachFiles(MailVO mail){
		return attachMapper.insertMailAttach(mail); // db 밀어넣기
	}
	
	/**
	 * 전자결재 - 첨부파일정보 DB 등록 메서드
	 * @param postVO - 게시글VO
	 */
	@Override
	public ServiceResult insertSancDocAttachFiles(SanctionDocVO sancDocVO){
		return attachMapper.insertSantnAttach(sancDocVO) > 0 ? ServiceResult.OK : ServiceResult.FAIL; // db 밀어넣기
	}

	
	/**
	 * 단일 첨부파일 조회
	 * @param attachVO 
	 * @return 
	 */
	@Override
	public AttachVO selectAttach(AttachVO attachVO) {
		return attachMapper.selectAttach(attachVO);
	}

	
	/**
	 * 다운로드 카운트 증가
	 * @param attachVO 통합첨부파일번호, 첨부파일순번 값 세팅해줄것
	 * @return 성공 : 1, 실패 0
	 */
	public int incrementCount(AttachVO attachVO) {
		return attachMapper.incrementCount(attachVO);
	}
	
	/**
	 * 첨부파일 조회 및 첨부파일 binary 획득
	 * @throws IOException 
	 */
	@Override
	public AttachVO downloadAttach(AttachVO attachVO) throws IOException {
		AttachVO atch = validateAttatch(attachVO); // 1. 첨부파일 유효확인 및 바이너리 획득
		attachMapper.incrementCount(attachVO);     // 2. 첨부파일 다운로드수 증가
		return atch;
	}

	
	/**
	 * 첨부파일 유효확인 및 바이너리 획득
	 * @param attachVO
	 * @return
	 * @throws IOException
	 */
	private AttachVO validateAttatch(AttachVO attachVO) throws IOException {
		AttachVO atch = null;
		atch = attachMapper.selectAttach(attachVO); // 1. 첨부파일 DB 조회
		
		if(atch != null) { // 2. 첨부파일 존재 확인 - DB
			File atchFile = new File(saveFolder.getFile(), atch.getSaveFileNm()+"."+atch.getFileContType()); // 3. 파일 객체 생성
			
			if(atchFile.exists()) { // 4. 첨부파일 존재 확인 - file system
				atch.setBinary(new FileSystemResource(atchFile));// 5. 파일 binary 데이터 셋팅
			}
			// TODO : 예외처리 꼭 필요 나중에 할것..
		}
		return atch; 
	}

	@Override
	public int insertProjectWorkAttach(ProjectWorkVO pwVO) {
		return attachMapper.insertProjectWorkAttach(pwVO);
	}

	@Override
	public int insertProjectPostAttach(ProjectPostVO ppVO) {
		return attachMapper.insertProjectPostAttach(ppVO);
	}

	@Override
	public int insertProjectAttach(AttachVO attachVO) {
		return attachMapper.insertProjectAttach(attachVO);
	}

	@Override
	public List<AttachVO> selectProjectAllAttachList(String prjctCode) {
		return attachMapper.selectProjectAllAttachList(prjctCode);
	}

	@Override
	public int selectProjectAttachCount(String prjctCode) {
		return attachMapper.selectProjectAttachCount(prjctCode);
	}
}
