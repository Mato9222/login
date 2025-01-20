package com.teamtodev.attachfile.vo;

import java.io.File;
import java.io.Serializable;
import java.util.Optional;
import java.util.UUID;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang3.function.Failable;
import org.springframework.core.io.Resource;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@NoArgsConstructor
@EqualsAndHashCode(of = "atchFileNo")
public class AttachVO implements Serializable  {
	// 생성자
	public AttachVO(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
		// 파일경로 > 외부에서 세팅
		this.fileNm = uploadFile.getOriginalFilename(); 						// 파일명
		this.saveFileNm = UUID.randomUUID().toString(); 						// 저장파일명
		this.fileContType = FilenameUtils.getExtension(fileNm); 				// 파일유형
		this.fileSize = uploadFile.getSize(); 									// 파일크기
		this.fileSizeContraction = FileUtils.byteCountToDisplaySize(fileSize); 	// 파일크기(축약형) 임시컬럼
	}
	
	@ToString.Exclude
	private String atchFileNo; 			// 통합첨부파일번호
	private int atchFileSeq; 			// 첨부파일순번
	private String bizType; 			// 업무구분
	private String filePath; 			// 파일경로
	private String fileNm; 				// 파일명
	private String saveFileNm; 			// 저장파일명
	private String fileContType; 		// 파일유형
	private Long fileSize; 				// 파일크기
	private Long fileDownCnt; 			// 다운횟수
	private String regDate; 			// 등록일자
	private String regUserId; 			// 등록자ID
	private String updDate; 			// 수정일자
	private String updUserId; 			// 수정자ID
	private String fileSizeContraction; // 파일크기(축약형) 임시컬럼
	
    @JsonIgnore
	private MultipartFile uploadFile; 	// 업로드할 파일
	
	// 파일 저장
	public void saveToFolder(File folder){
		Optional.ofNullable(uploadFile).filter(uf -> !uf.isEmpty())
				.ifPresent(Failable.asConsumer(uf -> uploadFile.transferTo(new File(folder, saveFileNm))));
	}
	
	@JsonIgnore
	public byte[] getBytes() {
		return Optional.ofNullable(uploadFile).filter(uf -> !uf.isEmpty())
				.map(Failable.asFunction(MultipartFile::getBytes)).orElse(new byte[] {});
	}

	@ToString.Exclude
	private Resource binary; // 파일 2진데이터
}
