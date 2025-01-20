package com.teamtodev.utils;


import java.io.File;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class CKEditorImageUploadController{
	
	@Value("#{appInfo.saveFolder}")
	private File saveFolder;
	
	@Value("#{appInfo.saveFolder}")
	private String loadUrl;
	
	@ResponseBody
	@PostMapping("/upload/image")
	public ModelAndView uploadImage(@RequestParam Map<String, Object> map, MultipartHttpServletRequest request) throws Exception {
		ModelAndView mv = new ModelAndView("jsonView");

		List<MultipartFile> fileList = request.getFiles("upload");

		String imgPath = null;

		for (MultipartFile mf : fileList) {
			if (fileList.get(0).getSize() > 0) {
				String originFileName = mf.getOriginalFilename(); // 원본 파일 명
				log.info("originFileName==" + originFileName);
				String ext = FilenameUtils.getExtension(originFileName);
				String newInfImgFileName = "img_" + UUID.randomUUID() + "." + ext;

				imgPath = loadUrl + newInfImgFileName;

				File file = new File(saveFolder, newInfImgFileName);

				mf.transferTo(file);


			}

		}
	    mv.addObject("uploaded", true);
	    mv.addObject("url", imgPath);
	    return mv;
	}
}
