package com.teamtodev.board.service;

import java.io.IOException;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.teamtodev.attachfile.service.AttachService;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.board.mapper.PostMapper;
import com.teamtodev.board.vo.PostVO;
import com.teamtodev.common.service.CommonService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.paging.PaginationInfo;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class PostServiceImpl implements PostService{

	@Autowired
	private PostMapper postMapper; // 게시글
	
	@Autowired
	private AttachService attachService; // 통합첨부파일
	
	@Autowired
	private CommonService commonService; // 공통코드
	
	@Value("#{appInfo.attachFolder}")
	private Resource saveFolder; // 첨부파일 리소스
	
	
	
	/**
	 * 새로운 게시글 등록
	 * 
	 * @param employeeVo 로그인한 사용자 정보
	 * @param postVO 등록할 게시글 정보
	 * @return 등록된 게시글 레코드 수 반환 TODO : 해야함
	 * @throws IOException 
	 */
	@Transactional
	@Override
	public void createPost(EmployeeVO employeeVo, PostVO postVO) throws IOException {
		// 로그인한 사용자 ID, 부서번호 셋팅
		String regUserId = employeeVo.getEmplId();
		int emplNo = employeeVo.getEmplNo();
		postVO.setEmplNo(emplNo);
		postVO.setDeptNo(employeeVo.getDeptNo());
		
		// 업무구분
		String bizType = commonService.selectBizTypeCode("게시판");
		
		// 파일경로
		String filePath = saveFolder.getFile().getPath();
		
		// 첨부파일 리스트
		List<AttachVO> fileList = postVO.getAttchFileList();
		if( fileList != null  && !fileList.isEmpty() ) { // 널, 비어있는지 확인
			// 첨부파일 세부정보 재세팅
			for (AttachVO attachVO : postVO.getAttchFileList()) {
				attachVO.setRegUserId(regUserId);
				attachVO.setBizType(bizType);
				attachVO.setFilePath(filePath);
			}
			
			// 첨부파일정보 DB 등록
			if( attachService.insertAttachFiles(postVO) > 0) {
				// 게시글 DB 등록
				postMapper.insertPost(postVO);
				
				// 파일 저장
				for(AttachVO attachVO : fileList) {
					String saveFileName = attachVO.getSaveFileNm() + "." + attachVO.getFileContType();
					Resource saveRes = saveFolder.createRelative(saveFileName); // 파일 생성
					FileUtils.copyInputStreamToFile(attachVO.getUploadFile().getInputStream(), saveRes.getFile());
				}
			}
		} else {
			// 게시글 DB 등록
			postMapper.insertPost(postVO);
		}
	}

	
	/**
	 * 게시글 목록 조회
	 * @param paging 페이징 정보
	 * @return 게시글 목록 반환
	 */
	@Override
	public List<PostVO> selectPostList(int bbsNo, EmployeeVO employeeVO, PaginationInfo paging) {
		// 검색 레코드 총 건수 조회
		int totalCount = postMapper.selectPostCount(bbsNo, employeeVO, paging);
		paging.setTotalRecord(totalCount);
		
		// 맵 선언하여 매개변수로 여러 객체 전달하는 방법 - 사용자가 맵을 만듬: xml에서 코드어시스트 안됨
		// @Param 어노테이션으로 여러 객체 전달하는 방법 - mybatis가 맵을 만듬: xml에서 코드어시스트 됨 
		// 검색 리스트 목록 조회
		List<PostVO> postList = postMapper.selectPostList(bbsNo, employeeVO, paging);
		return postList;
	}


	/**
	 * 단일 게시글 조회
	 * 
	 * @param sntncNo 조회할 게시글 번호
	 * @return 단일 게시글 정보 반환
	 */
	@Override
	public PostVO selectPost(int sntncNo) {
		// 게시글 조회수 증가
		postMapper.incrementHit(sntncNo);
		
		// 단일 게시글 조회
		PostVO postVO = postMapper.selectPost(sntncNo);
		
		// 첨부파일 조회
		AttachVO attachVO = new AttachVO();
		attachVO.setAtchFileNo(postVO.getAtchFileNo());
		attachService.selectAttach(attachVO);
		
		
		
		return postVO;
	}


	/**
	 * 게시글 조회수 증가
	 * 
	 * @param sntncNo 단일 게시글 번호
	 * @return 단일 게시글의 조회수 증가
	 */
	@Override
	public int incrementHit(int sntncNo) {
		return postMapper.incrementHit(sntncNo);
	}


	/**
	 * 게시글 수정
	 * 
	 * @param postVO 단일 게시글 정보
	 * @return 수정된 게시글 레코드 수
	 */
	@Override
	public int updatePost(EmployeeVO employeeVo, PostVO postVO) {
		int emplNo = employeeVo.getEmplNo();
		postVO.setEmplNo(emplNo);
		
		return postMapper.updatePost(postVO);
	}


	/**
	 * 게시글 삭제
	 * 
	 * @param sntncNo 삭제할 게시글 번호
	 * @return 삭제된 게시글 레코드 수
	 */
	@Override
	public int deletePost(int sntncNo) {
		return postMapper.deletePost(sntncNo);
	}
	
}
