package com.teamtodev.project.vo;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.attachfile.vo.AttachVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "worksNo")
public class ProjectWorkVO {
	private int worksNo;
	private Integer upWorksNo;
	private String worksTitle;
	private String worksCon;
	private int prjctMbrNo;
	private int prjctMbrNo2;
	private String workSttusCode;
	private String bgnde;
	private String closOn;
	private int worksOrd;
	private String atchFileNo;
	private int progrsRt;
	private String modide;
	private String writede;
	
	private String emplNm1;
	private String emplNm2;
	private String prjctCode;
	
	private String prjctNm;
	
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
