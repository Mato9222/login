package com.teamtodev.project.vo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.attachfile.vo.AttachVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "sntncNo")
public class ProjectPostVO {
	@NotNull
	private int sntncNo;
	private String bbsNo;
	private int prjctMbrNo;
	private String sntncSj;
	private String sntncCn;
	private String writngDate;
	private String atchFileNo;
	
	private String prjctCode;
	private String prjctNm;
	private int emplNo;
	private String emplNm;
	
	private List<ProjectCommentVO> pjCommentVO; // Has Many
	private ProjectMemberVO pjMemberVO;
	
	private int atchSize; // 첨부파일 개수 조회시 사용
	
	private MultipartFile[] tbAttachFile;
	private List<AttachVO> attchFileList;
	
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
