package com.teamtodev.mail.vo;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Optional;

import org.apache.commons.lang3.function.Failable;
import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.Data;

@Data
public class MailVO {
	private Long emailNo;
	private Long emplNo;
	private String recptnEmailAdres;
	private String refrn;
	private String emailSj;
	private String emailCn;
	private Long ncrd;
	private String trnsmisDt;
	private String tmprStreAt;
	private String deleteAt;
	private String atchFileNo;
	private String rsvdeHour;
	
	private Long snedEmpl;
	private String ofcpsCodeNm;
    private String proflPhotoCours;
    private String realMail;
    private String emplNm;
    private String emplId;
    
	private List<EmployeeVO> emp;
	private List<CommonVO> com;
	private List<RecipientsVO> rec;
//	private List<AttatchVO> atchList;
	
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
