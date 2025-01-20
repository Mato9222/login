package com.teamtodev.mail.service.impl;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import com.teamtodev.attachfile.service.AttachService;
import com.teamtodev.attachfile.vo.AttachVO;
import com.teamtodev.common.service.CommonService;
import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.mail.mapper.MailListMapper;
import com.teamtodev.mail.service.MailService;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.mail.vo.RecipientsVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor // 생성자 인젝션
public class MailServiceImpl implements MailService {
	
	private final MailListMapper mapper;
	
	@Autowired
    private JavaMailSender mailSender; // 메일API
	 
	@Autowired
	private AttachService attachService; // 통합첨부파일
	
	@Autowired
	private CommonService commonService; // 공통코드
	
//	@Autowired
//	private MailSender mailservice; // 공통코드

	@Value("#{appInfo.attachFolder}")
	private Resource saveFolder; // 첨부파일 리소스
	
//	메일 발신
	@Override
	public ServiceResult createMail(MailVO mail) throws IOException {
		int rowcnt = 0;
		
		// 업무구분
		String bizType = commonService.selectBizTypeCode("메일자료실");
		// 파일경로
		String filePath = saveFolder.getFile().getPath();
		// 첨부파일 리스트
		List<AttachVO> fileList = mail.getAttchFileList();
		if( fileList != null  && !fileList.isEmpty() ) { // 널, 비어있는지 확인
			// 첨부파일 세부정보 재세팅
			for (AttachVO attachVO : mail.getAttchFileList()) {
				attachVO.setRegUserId(mail.getEmplId());
				attachVO.setBizType(bizType);
				attachVO.setFilePath(filePath);
				log.info("여기에 뭐가찍힐까{}",attachVO);
			}
			// 첨부파일정보 DB 등록
			if( attachService.insertMailAttachFiles(mail) > 0) {
				// 메일 DB 등록
				rowcnt = mapper.insertMail(mail);
				// 파일 저장
				for(AttachVO attachVO : fileList) {
					String saveFileName = attachVO.getSaveFileNm() + "." + attachVO.getFileContType();
					Resource saveRes = saveFolder.createRelative(saveFileName); // 파일 생성
					FileUtils.copyInputStreamToFile(attachVO.getUploadFile().getInputStream(), saveRes.getFile());
				}
			}
		} else { // 파일이 없다면 메일 DB 등록
			rowcnt = mapper.insertMail(mail);
		}
		
		String realMail = String.valueOf(mail.getRealMail());
		// 이메일 주소일 경우 메일API로 전송
		String[] mailParts = realMail.split(","); // ,로 구분 후
        for (String part : mailParts) {
            if (part.contains("@")) { // 받는사람에 @가 포함된다면 
            	mail.setRealMail(part); // 이메일형식 저장
            	realMailSend(mail);
            }
        }
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}

	//	 수신함 저장
	public ServiceResult reception(MailVO mail) {
//		String ref = mail.getRecptnEmailAdres();
//		String refrn = mail.getRefrn();
//		log.info("얘는 뭐야{}",ref);
//		if (!ref.isEmpty()) {
		int rowcnt = mapper.insertMailR(mail);
		log.info("수신 저장 서비스임플 : {}" ,rowcnt);
		if(rowcnt == 0 ) {
			return ServiceResult.FAIL;
		} 
//		}
		return ServiceResult.OK;
	}
	
	public void realMailSend(MailVO mail) {
		try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

	        String to = mail.getRealMail(); // 받는사람
	        String title = mail.getEmailSj(); // 제목
	        String text = mail.getEmailCn(); //내용
	        String content = text.replaceAll("(\r\n|\r|\n)", "<br>"); // 줄바꿈을 <br>로 변환
	        boolean multiFile = Boolean.parseBoolean(mail.getAtchFileNo());  // 첨부파일 확인
	        
	        helper.setFrom("zzxxcc385@naver.com");
	        helper.setTo(to);
	        helper.setSubject(title);
	        helper.setText(content,true);
	        
	        if ( !multiFile ) {
	        	for (AttachVO multi : mail.getAttchFileList()) {
	        		String fileName = MimeUtility.encodeText(multi.getFileNm(), "UTF-8", "B"); //파일명 인코딩
    				helper.addAttachment(fileName, multi.getUploadFile()); // 첨부파일 추가
				}
	        }
	        mailSender.send(message);
            
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	
//	메일 읽기
	@Override
	public MailVO readMail(int mailNo) {
		MailVO mail = mapper.selectMail(mailNo);
		// 최초 읽은시간 입력 
		return mail;
	}

	@Override
	public void readTime(int mailNo) {
		mapper.readTime(mailNo);
	}
	
	
//  임시메일 보기
	@Override
	public MailVO tempReadMail(int mailNo) {
		MailVO mail = mapper.tempReadMail(mailNo);
		
		return mail;
	}

//	보낸메일 읽기
	@Override
	public MailVO sendReadMail(int mailNo) {
		MailVO mail = mapper.selectMail(mailNo);
		
		return mail;
	}

//	받은메일 리스트 
	@Override
	public List<MailVO> readMailList(Map<String, Object> info ) {
		
		List<MailVO> mailList = mapper.selectMailList(info);
		
		return mailList;
	}
	
//	휴지통 리스트
	@Override
	public List<MailVO> trashMailList(Map<String, Object> info ) {
		
		List<MailVO> mailList = mapper.trashMailList(info);
		
		return mailList;
	}
	
//	임시보관함 리스트
	public List<MailVO> tmepMailList(Map<String, Object> info ) {
		
		List<MailVO> mailList = mapper.tempMailList(info);
		
		return mailList;
	}

//	메일함에서 휴지통으로 
	@Override
	public ServiceResult trashMail(int emailNo) {
		int rowcnt = mapper.trashMail(emailNo);
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}
	
//	메일함에서 휴지통으로 
	@Override
	public ServiceResult trashSendMail(int emailNo) {
		int rowcnt = mapper.outBoxDel(emailNo);
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}
	
//	휴지통에서 완전삭제
	@Override
	public ServiceResult deleteMail(String emailNo) {
		int rowcnt = mapper.deleteRece(emailNo);
		log.info("rece 삭제 {} ",rowcnt);
		
		if(rowcnt > 0 ) {
			int rowcnt2 = mapper.deleteMail(emailNo);
			log.info("mail 삭제 {} ",rowcnt2);
			if(rowcnt2 == 0 ) { 
				return ServiceResult.FAIL;
			}
		}
		return ServiceResult.OK;
	}

//	작성중 메일 임시저장
	@Override
	public ServiceResult tempMail(MailVO mail) {
		int rowcnt = mapper.tempMail(mail);
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}
	
//	임시 목록에서 완전삭제
	@Override
	public ServiceResult tempDeleteMail(String emailNo) {
		log.info("여기는 들어오는데 삭제하기{}", emailNo);
		int rowcnt = mapper.deleteMail(emailNo);
		log.info("삭제하기{}", rowcnt);
		if(rowcnt == 0 ) { 
			return ServiceResult.FAIL;
		}
		return ServiceResult.OK;
	}
	
//	안읽은 메일
	@Override
	public List<RecipientsVO> unReadMail(String emplNo) {
		List<RecipientsVO> unMail = mapper.unReadMail(emplNo);
		return unMail;
	}

//	안읽은 메일리스트
	@Override
	public List<MailVO> unReadMailList(String info) {
		List<MailVO> mailList = mapper.unReadMailList(info);
		
		return mailList;
	}

//	보낸 메일함 리스트
	@Override
	public List<MailVO> sendMailList(String info) {
		List<MailVO> mailList = mapper.sendMailList(info);

		for (MailVO mailVO : mailList) {
			for (RecipientsVO rece : mailVO.getRec()) {
				// 누구 외 몇명 의 몇명 담당
				int count = mapper.sendMailCount(rece);
				rece.setCount(count);
				// 받은 사람중 몇명이 읽었는지 담당
				int readCount = mapper.sendReadMailCount(rece);
				rece.setReadCount(readCount);
			}
		}
		
		return mailList;
	}

//	임시메일에서 보내기 
	@Override
	public ServiceResult updateMail(MailVO mail) {
		int rowcnt = mapper.updateMail(mail);

		if (rowcnt > 0) {
			return ServiceResult.OK;
		}
		return ServiceResult.FAIL;
	}

//	메일 임시저장
	@Override
	public ServiceResult tempSaveMail(MailVO mail) {
		int rowcnt = mapper.tempSaveMail(mail);
		
		if (rowcnt > 0) {
			return ServiceResult.OK;
		}
		return ServiceResult.FAIL;
	}

	@Override
	public List<MailVO> dashMail(int emplNo) {
		
		List<MailVO> res = mapper.dashMail(emplNo);
		
		return res;
	}

//	휴지통에서 받은메일함으로 살리기
	@Override
	public ServiceResult trashCancel(int emailNo) {
	int rowcnt = mapper.trashCancel(emailNo);
		
		if(rowcnt > 0 ) {
			return ServiceResult.OK;
		} else { 
			return ServiceResult.FAIL;
		}
	}
	
}
