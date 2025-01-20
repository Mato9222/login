package com.teamtodev.sanction.vo;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.documents.vo.DocumentFormVO;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "sanctnDocNo")
public class SanctionDocVO implements Serializable{
    private static final long serialVersionUID = 1L;
    
	private String sanctnDocNo;
	private int drafterEmplNo;
	private String docRaisngNo;
	private String sanctnSj;
	private String sanctnCn;
	private LocalDate recomDe;
	private LocalDate lastSanctnDe;
	private String lastSanctnSttusCode;
	private String lastSanctnSttusNm;
	private String tmprStreAt;
	private String dcrbUseAt;
	private Integer lastRcver;
	private String doorSign;
	private String sanctnLineNo;
	private String atchFileNo;
	private int sanctnEmplNo;
	
	private List<DocumentFormVO> docFormList;
	private CommonVO commVo;
	private EmployeeVO emplVo;
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
