package com.teamtodev.board.vo;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.department.vo.DepartmentVO;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "sntncNo")
public class PostVO implements Serializable{
	
	// 게시글 관련
	// POST Table Columns
	private Integer sntncNo; 	// 글번호
	private Integer bbsNo; 		// 게시판번호
	private Integer emplNo; 	// 사원번호
	private String ctgryCode; 	// 카테고리코드
	private String sntncSj; 	// 글제목
	private String sntncCn; 	// 글내용
	private Integer rdcnt; 		// 조회수
	private String atchFileNo; 	// 첨부파일넘버
	private String mngrAt; 		// 관리자여부
	private String othbcAt; 	// 공개여부
	private String registDt; 	// 등록일시
	private String upddeDt; 	// 수정일시
	private String deleteDt; 	// 삭제일시
	private String deleteAt; 	// 삭제여부
	private String atchFileAt; 	// 파일첨부여부
	private Integer deptNo;		// 부서번호
	
	private int rnum; // 게시글 행번호
	
	// 게시판관련
	// BOARD Table Columns
	private String bbsNm; 		// 게시판명
	
	// 직원 관련
	// EMPOLOYEES Table Columns
	private EmployeeVO employeeVO; // 사원정보
	
	// 부서 관련
	// DEPARTMENT Table Columns
	private DepartmentVO departmentVO; // 부서정보
	
	// 공통코드 관련
	// COMMON_CODE Table Columns
	private CommonVO commonVO; // 공통코드 정보
	
	// 첨부파일관련
	// TB_ATTACH_FILE Table
	private MultipartFile[] tbAttachFile; // 첨부파일 리스트 : 화면단에서 받은 첨부파일리스트
	private List<AttachVO> attchFileList; // 첨부파일 리스트 : array to List 첨부파일리스트
	
	
	
	
	
	/**
	 * MultipartFile[] tbAttachFile -> List<AttachVO> attchFileList 로 변경
	 * 
	 * @param tbAttachFile : 멀티파트파일 리스트
	 */
	public void setTbAttachFile(MultipartFile[] tbAttachFile) {
		if(tbAttachFile != null) { // 널체크
			List<AttachVO> fileList = new ArrayList<AttachVO>(); // 리스트 객체 생성
			for( MultipartFile mf : tbAttachFile) {
				if( !mf.isEmpty() ) { // 비었는지 체크
					fileList.add( new AttachVO(mf) ); // 리스트에 추가
				}
			}
			this.attchFileList = fileList; // 파일 있을때
		} else {
			this.attchFileList = Collections.emptyList(); // 파일 없을때 > 빈리스트
		}
	}
}
