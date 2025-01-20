package com.teamtodev.sanction.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teamtodev.attachfile.service.AttachService;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.common.service.CommonService;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.sanction.service.SanctionDocService;
import com.teamtodev.sanction.service.SanctionLineService;
import com.teamtodev.sanction.service.SanctionService;
import com.teamtodev.sanction.vo.SanctionDocVO;
import com.teamtodev.sanction.vo.SanctionLineDetailVO;
import com.teamtodev.sanction.vo.SanctionLineVO;
import com.teamtodev.sanction.vo.SanctionVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/sanctionDoc")
public class SanctionDocController {

	@Autowired
	private SanctionLineService sclineService;

	@Autowired
	private SanctionDocService service;

	@Autowired
	private SanctionService scService;

	@Autowired
	private CommonService commService;

	@Autowired
	private AttachService attachService;

	@Value("#{appInfo.attachFolderTemp}")
	private Resource tempFolder; // 임시 첨부파일 리소스

	@Value("#{appInfo.attachFolder}")
	private Resource saveFolder; // 첨부파일 리소스

	@GetMapping()
	public String processForm() {
		return "/sanction/sanctionForm";
	}

	@GetMapping("/list")
	public String sanctionList(Model model, Authentication auth) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		SanctionDocVO scDocVO = new SanctionDocVO();
		scDocVO.setDrafterEmplNo(user.getEmplNo());
		scDocVO.setTmprStreAt("N");
		List<SanctionDocVO> scDocList = service.SanctionDocList(scDocVO);
		model.addAttribute("scDocList", scDocList);
		return "/sanction/sanctionList";
	}

	@GetMapping("/detail/{sanctnDocNo:GB-SAN_[0-9]{10}}")
	public String sanctiondetail(@PathVariable String sanctnDocNo, Model model) {
		SanctionDocVO scDocVO = service.selectSanctionDoc(sanctnDocNo);
		String lineNo = scDocVO.getSanctnLineNo();
		List<SanctionLineVO> sclineVO = sclineService.selectNonSanctionLine(lineNo);
		List<SanctionVO> scList = scService.scDocSanctionList(sanctnDocNo);
		model.addAttribute("scDocVO", scDocVO);
		model.addAttribute("scList", scList);
		model.addAttribute("scline", sclineVO);
		return "/sanction/sanctionDetail";
	}

	@PostMapping()
	public String processForm(@RequestBody List<Map<String, String>> data, Authentication auth, HttpSession session,
			HttpServletRequest request) {
		Map<String, Object> dataMap = new LinkedHashMap<String, Object>();
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일");
		String today = sdf.format(date);
		String source = data.get(0).get("docCn").toString();
		String docRaisngNo = data.get(0).get("docRaisngNo").toString();
		String sanctionLineNo = data.get(0).get("sanctnLineNo");
		List<SanctionLineVO> sclineVO = sclineService.selectSCSanctionLine(sanctionLineNo);
		for (SanctionLineVO slVO : sclineVO) {
			List<SanctionLineDetailVO> sldtVO = slVO.getSclineDetailList();
			int voSize = sldtVO.size();
			int index;
			if (voSize == 1) {
				index = 3;
			} else if (voSize == 2) {
				index = 2;
			} else {
				index = 1;
			}
			for (SanctionLineDetailVO VO : sldtVO) {
				String key = "sanctnEmpl" + index++;
				dataMap.put(key, VO.getSanctnEmplNo());
			}
		}

		dataMap.put("address", user.getBassAdres() + " " + user.getDetailAdres());
		dataMap.put("phone", user.getMoblphonNo());
		dataMap.put("email", user.getEmailAdres());
		dataMap.put("encpnDe", user.getEncpnDe());
		dataMap.put("emplNo", user.getEmplNo());
		dataMap.put("emplDept", user.getDeptNm());
		dataMap.put("emplNm", user.getEmplNm());
		dataMap.put("deptNm", user.getDeptNm());
		dataMap.put("ofcpsCodeNm", user.getOfcpsCodeNm());
		dataMap.put("docRaisngNo", docRaisngNo);
		dataMap.put("scDate", today);
		dataMap.put("writer", user.getSanctnCtpntUrl());
		dataMap.put("contextPath", request.getContextPath());
		String regex = "\\$\\{([\\w]+)\\s*\\}";
		StringBuffer html = new StringBuffer();
		Pattern ptrn = Pattern.compile(regex);
		Matcher matcher = ptrn.matcher(source);
		while (matcher.find()) {
			String identifier = matcher.group(1);
			Object value = dataMap.get(identifier);
			matcher.appendReplacement(html, Objects.toString(value, ""));
		}
		matcher.appendTail(html);
		data.get(0).put("docCn", html.toString());
		session.setAttribute("sanctionData", data);
		return "redirect:/sanctionDoc";
	}

	@PostMapping(value = "/new", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> newSanction(@RequestBody Map<String, Object> requestData, Authentication auth,
			HttpSession session) throws IOException {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		// sanctionDoc 데이터 추출
		// 4. 3건의 임시파일 중 2건이 실제 사용될 첨부파일이면 실제 첨부파일은 DB 및 폴더에 저장
		List<String> realAttachName = (List<String>) requestData.get("attach");
		List<Map<String, Object>> attachTemp = (List<Map<String, Object>>) requestData.get("attachTemp");
		Map<String, String> scDocData = (Map<String, String>) requestData.get("sanctionDoc");
		List<Map<String, String>> scDataList = (List<Map<String, String>>) requestData.get("sanction");
		List<AttachVO> attachList = new ArrayList<>();
		if (!realAttachName.isEmpty() && !attachTemp.isEmpty()) {
			String tempPath = tempFolder.getFile().getPath();
			String savePath = saveFolder.getFile().getPath();
			String bizType = commService.selectBizTypeCode("전자결재");
			for (Map<String, Object> attachTempItem : attachTemp) {
				Map<String, Object> attachVOMap = (Map<String, Object>) attachTempItem.get("attachVO");
				String fileName = (String) attachVOMap.get("fileNm");

				if (realAttachName.contains(fileName)) {
					AttachVO attachVO = new AttachVO();
					attachVO.setFileNm(fileName);
					attachVO.setSaveFileNm((String) attachVOMap.get("saveFileNm"));
					attachVO.setFileContType((String) attachVOMap.get("fileContType"));
					attachVO.setFilePath(savePath);
					attachVO.setFileSize(((Integer) attachVOMap.get("fileSize")).longValue());
					attachVO.setFileSizeContraction((String) attachVOMap.get("fileSizeContraction"));
					attachVO.setBizType(bizType);
					attachVO.setRegUserId(user.getEmplId());
					attachList.add(attachVO);
					File tempFile = new File(tempPath, fileName);
					String saveFileName = attachVO.getSaveFileNm();
					String fileContType = attachVO.getFileContType();

					if (saveFileName == null || saveFileName.isEmpty()) {
						saveFileName = fileName;
					} else {
						saveFileName = saveFileName + (fileContType != null ? "." + fileContType : "");
					}

					File saveFile = new File(savePath, saveFileName);
					FileUtils.moveFile(tempFile, saveFile);
				} else {
					// 5. 나머지 1건에 대한 첨부파일은 임시폴더에서 삭제 처리
					FileUtils.delete(new File(tempPath, fileName));
				}
			}
			SanctionDocVO scDocVO = new SanctionDocVO();
			scDocVO.setAttchFileList(attachList);
			attachService.insertSancDocAttachFiles(scDocVO);
			scDocVO.setDrafterEmplNo(Integer.parseInt(scDocData.get("drafterEmplNo")));
			scDocVO.setDocRaisngNo(scDocData.get("docRaisngNo"));
			scDocVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
			scDocVO.setSanctnSj(scDocData.get("sanctnSj"));
			scDocVO.setSanctnCn(scDocData.get("sanctnCn"));
			scDocVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
			scDocVO.setTmprStreAt("N");
			for (Map<String, String> scData : scDataList) {
				if (scData.get("sanctnSortate").equals("수신")) {
					scDocVO.setLastRcver(Integer.parseInt(scData.get("sanctnEmplNo")));
				}
			}
			service.insertSanctionDoc(scDocVO);

			for (Map<String, String> scData : scDataList) {
				SanctionVO sanctionVO = new SanctionVO();
				if (scData.get("sanctnSortate").equals("결재")) {
					sanctionVO.setSanctnDocNo(scDocVO.getSanctnDocNo());
					sanctionVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
					sanctionVO.setSanctnEmplNo(Integer.parseInt(scData.get("sanctnEmplNo")));
					sanctionVO.setSanctnOrdr(Integer.parseInt(scData.get("sanctnOrdr")));
					scService.insertSanction(sanctionVO);
				}
			}
		} else {
			SanctionDocVO scDocVO = new SanctionDocVO();
			scDocVO.setDrafterEmplNo(Integer.parseInt(scDocData.get("drafterEmplNo")));
			scDocVO.setDocRaisngNo(scDocData.get("docRaisngNo"));
			scDocVO.setSanctnSj(scDocData.get("sanctnSj"));
			scDocVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
			scDocVO.setSanctnCn(scDocData.get("sanctnCn"));
			scDocVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
			scDocVO.setTmprStreAt("N");
			for (Map<String, String> scData : scDataList) {
				if (scData.get("sanctnSortate").equals("수신")) {
					scDocVO.setLastRcver(Integer.parseInt(scData.get("sanctnEmplNo")));
				}
			}
			service.insertSanctionDoc(scDocVO);

			for (Map<String, String> scData : scDataList) {
				SanctionVO sanctionVO = new SanctionVO();
				if (scData.get("sanctnSortate").equals("결재")) {
					sanctionVO.setSanctnDocNo(scDocVO.getSanctnDocNo());
					sanctionVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
					sanctionVO.setSanctnEmplNo(Integer.parseInt(scData.get("sanctnEmplNo")));
					sanctionVO.setSanctnOrdr(Integer.parseInt(scData.get("sanctnOrdr")));
					scService.insertSanction(sanctionVO);
				}
			}
		}

		Map<String, Object> result = new LinkedHashMap<>();
		result.put("success", true);
		result.put("message", "등록 성공");
		return result;
	}

	@GetMapping("/wait")
	public String waitSanction(Authentication auth, Model model) {
		EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
		EmployeeVO user = userWrapper.getRealUser();
		List<SanctionDocVO> scDocList = service.WaitSanctionDocList(user.getEmplNo());
		model.addAttribute("waitSclist", scDocList);
		return "/sanction/waitSanctionList";
	}

	@PostMapping(value = "/update")
	public String updateSanction(@RequestParam String sanctnDocNo, Model model) throws IOException {
		SanctionDocVO scDocVO = service.selectSanctionDoc(sanctnDocNo);
		String lineNo = scDocVO.getSanctnLineNo();
		List<SanctionLineVO> sclineVO = sclineService.selectNonSanctionLine(lineNo);
		List<SanctionVO> scList = scService.scDocSanctionList(sanctnDocNo);
//		List<AttachVO> attachList = scDocVO.getAttchFileList();
//		List<File> fileList = new ArrayList<>();
//		for(AttachVO attVO : attachList) {
//			File atchFile = new File(saveFolder.getFile(), attVO.getSaveFileNm()+"."+attVO.getFileContType());
//			fileList.add(atchFile);
//		}
//		model.addAttribute("fileList", fileList);
//		log.info("scDocVO : {}",scDocVO);
		model.addAttribute("scDocVO", scDocVO);
		model.addAttribute("scList", scList);
		model.addAttribute("scline", sclineVO);
		return "/sanction/sanctionForm";
	}

	@PostMapping(value = "/save", produces = MediaType.APPLICATION_JSON_VALUE)
	public Map<String, Object> insertSaveSanction(@RequestBody Map<String, Object> requestData, Authentication auth,
			HttpSession session) throws IOException {
	    EmployeeVOWrapper userWrapper = (EmployeeVOWrapper) auth.getPrincipal();
	    EmployeeVO user = userWrapper.getRealUser();
		// sanctionDoc 데이터 추출
		Map<String, String> scDocData = (Map<String, String>) requestData.get("sanctionDoc");
	    List<String> realAttachName = (List<String>) requestData.get("attach");
	    List<Map<String, Object>> attachTemp = (List<Map<String, Object>>) requestData.get("attachTemp");
		List<Map<String, String>> scDataList = (List<Map<String, String>>) requestData.get("sanction");
	    List<AttachVO> attachList = new ArrayList<>();
	    if (!realAttachName.isEmpty() && !attachTemp.isEmpty()) {
	        String tempPath = tempFolder.getFile().getPath();
	        String savePath = saveFolder.getFile().getPath();
	        String bizType = commService.selectBizTypeCode("전자결재");
	        for (Map<String, Object> attachTempItem : attachTemp) {
	            Map<String, Object> attachVOMap = (Map<String, Object>) attachTempItem.get("attachVO");
	            String fileName = (String) attachVOMap.get("fileNm");

	            if (realAttachName.contains(fileName)) {
	                AttachVO attachVO = new AttachVO();
	                attachVO.setFileNm(fileName);
	                attachVO.setSaveFileNm((String) attachVOMap.get("saveFileNm"));
	                attachVO.setFileContType((String) attachVOMap.get("fileContType"));
	                attachVO.setFilePath(savePath);
	                attachVO.setFileSize(((Integer) attachVOMap.get("fileSize")).longValue());
	                attachVO.setFileSizeContraction((String) attachVOMap.get("fileSizeContraction"));
	                attachVO.setBizType(bizType);
	                attachVO.setRegUserId(user.getEmplId());
	                attachList.add(attachVO);
	                File tempFile = new File(tempPath, fileName);
	                String saveFileName = attachVO.getSaveFileNm();
	                String fileContType = attachVO.getFileContType();

	                if (saveFileName == null || saveFileName.isEmpty()) {
	                    saveFileName = fileName;
	                } else {
	                    saveFileName = saveFileName + (fileContType != null ? "." + fileContType : "");
	                }

	                File saveFile = new File(savePath, saveFileName);
	                FileUtils.moveFile(tempFile, saveFile);
	            } else {
	                // 5. 나머지 1건에 대한 첨부파일은 임시폴더에서 삭제 처리
	                FileUtils.delete(new File(tempPath, fileName));
	            }
	        }
            SanctionDocVO scDocVO = new SanctionDocVO();
            scDocVO.setAttchFileList(attachList);
            attachService.insertSancDocAttachFiles(scDocVO);
            scDocVO.setDrafterEmplNo(Integer.parseInt(scDocData.get("drafterEmplNo")));
            scDocVO.setDocRaisngNo(scDocData.get("docRaisngNo"));
            scDocVO.setSanctnSj(scDocData.get("sanctnSj"));
            scDocVO.setSanctnCn(scDocData.get("sanctnCn"));
            scDocVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
            scDocVO.setTmprStreAt("Y");
            for (Map<String, String> scData : scDataList) {
                if (scData.get("sanctnSortate").equals("수신")) {
                    scDocVO.setLastRcver(Integer.parseInt(scData.get("sanctnEmplNo")));
                }
            }
            service.insertSanctionDoc(scDocVO);
            
            for (Map<String, String> scData : scDataList) {
                SanctionVO sanctionVO = new SanctionVO();
                if (scData.get("sanctnSortate").equals("결재")) {
                    sanctionVO.setSanctnDocNo(scDocVO.getSanctnDocNo());
                    sanctionVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
                    sanctionVO.setSanctnEmplNo(Integer.parseInt(scData.get("sanctnEmplNo")));
                    sanctionVO.setSanctnOrdr(Integer.parseInt(scData.get("sanctnOrdr")));
                    scService.insertSanction(sanctionVO);
                }
            }
        } else {
            SanctionDocVO scDocVO = new SanctionDocVO();
            scDocVO.setDrafterEmplNo(Integer.parseInt(scDocData.get("drafterEmplNo")));
            scDocVO.setDocRaisngNo(scDocData.get("docRaisngNo"));
            scDocVO.setSanctnSj(scDocData.get("sanctnSj"));
            scDocVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
            scDocVO.setSanctnCn(scDocData.get("sanctnCn"));
            scDocVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
            scDocVO.setTmprStreAt("Y");
            for (Map<String, String> scData : scDataList) {
                if (scData.get("sanctnSortate").equals("수신")) {
                    scDocVO.setLastRcver(Integer.parseInt(scData.get("sanctnEmplNo")));
                }
            }
            service.insertSanctionDoc(scDocVO);

            for (Map<String, String> scData : scDataList) {
                SanctionVO sanctionVO = new SanctionVO();
                if (scData.get("sanctnSortate").equals("결재")) {
                    sanctionVO.setSanctnDocNo(scDocVO.getSanctnDocNo());
                    sanctionVO.setSanctnLineNo(scDocData.get("sanctnLineNo"));
                    sanctionVO.setSanctnEmplNo(Integer.parseInt(scData.get("sanctnEmplNo")));
                    sanctionVO.setSanctnOrdr(Integer.parseInt(scData.get("sanctnOrdr")));
                    scService.insertSanction(sanctionVO);
                }
            }
        }
		Map<String, Object> result = new LinkedHashMap<>();
		result.put("success", true);
		result.put("message", "등록 성공");
		return result;
	}
}
