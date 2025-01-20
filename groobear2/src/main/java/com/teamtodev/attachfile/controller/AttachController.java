package com.teamtodev.attachfile.controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.ContentDisposition;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.attachfile.service.AttachService;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/attach")
public class AttachController {

	@Value("#{appInfo.attachFolderTemp}")
	private Resource saveFolder;
	
	@Autowired
	private AttachService AttachService; // 첨부파일
	
	@PostMapping
	public AttachVO Attach(MultipartFile file) throws IOException {
		AttachVO attachVO = new AttachVO(file);
		String fileName = attachVO.getFileNm();
		String SavefileName = attachVO.getSaveFileNm();
		Resource saveRes = saveFolder.createRelative(fileName);
		FileUtils.copyInputStreamToFile(attachVO.getUploadFile().getInputStream(), saveRes.getFile());
		
		// 1. 임시폴더 결정
		// 2. 임시폴더에 파일 단건에 대한 저장
		// 3. 임시폴더에 저장된 파일의 경로, 파일명을 내보내기
		AttachVO saveAttachVO = new AttachVO();
		saveAttachVO.setFileNm(fileName);
		saveAttachVO.setFilePath(saveFolder.getFile().getPath());
		saveAttachVO.setSaveFileNm(SavefileName);
		saveAttachVO.setFileContType(attachVO.getFileContType());
		saveAttachVO.setFileSize(attachVO.getFileSize());
		saveAttachVO.setFileSizeContraction(attachVO.getFileSizeContraction());
//		log.info("저장된데이터 : {}", saveAttachVO);
		return saveAttachVO;
	}
	
	
	@GetMapping("/{atchFileNo}/{atchFileSeq}")
	private ResponseEntity<Resource> getAttach(@PathVariable String atchFileNo, @PathVariable int atchFileSeq, Model model ){
		// 0. 첨부파일 조회조건 셋팅
		AttachVO atch = new AttachVO();
		atch.setAtchFileNo(atchFileNo);
		atch.setAtchFileSeq(atchFileSeq);
		
		// 1. 첨부파일 조회
		try {
			atch = AttachService.downloadAttach(atch);
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 2. 헤더 설정
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_OCTET_STREAM); // APPLICATION_OCTET_STREAM : 바이너리로 클라이언트에게 보내기 위해 사용
		headers.setContentLength(atch.getFileSize());
		ContentDisposition contentDisposition = ContentDisposition.attachment()
																.filename(atch.getFileNm(), Charset.defaultCharset())
																.build();
		headers.setContentDisposition(contentDisposition);
		
		// 3. 전송
		return ResponseEntity.ok()
						.headers(headers)
						.body(atch.getBinary());
	}
	
	@PostMapping("/createDirectory")
	@ResponseBody
	public String createFolder(@RequestBody String folder) throws IOException {
		 	String path = "\\\\192.168.142.4\\groobear/"+folder;
	        FileUtils.forceMkdir(new File(path));
	        
	        return "ok";
	}
	
    @GetMapping(value="/listSubDirectories",produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<String> listSubDirectories(@RequestParam String path) {
        List<String> subDirectories = new ArrayList<>();
        log.info("path123:{}",path);
        File directory = new File(path);
        log.info("directory:{}",directory);
        if (directory.isDirectory()) {
            File[] files = directory.listFiles();
            if (files != null) {
                for (File file : files) {
                    if (file.isDirectory()) {
                        subDirectories.add(file.getName());
                    }
                }
            }
        }
        return subDirectories;
    }
}
