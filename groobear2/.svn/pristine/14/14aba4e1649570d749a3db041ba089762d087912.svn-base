package com.teamtodev.mail.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.mail.vo.RecipientsVO;
import com.teamtodev.paging.PaginationInfo;

public interface MailService {
	
	/**
	 * 메일 작성 
	 * @param mail
	 * @return 
	 * @throws IOException 
	 */
	public ServiceResult createMail(MailVO mail) throws IOException;
	
	/**
	 * 작성메일 수신함 저장
	 * @param mail
	 * @return
	 */
	public ServiceResult reception(MailVO mail);
	
	/**
	 * 선택 메일 상세보기
	 * @param 메일 번호
	 * @return
	 */
	public MailVO readMail(int mailNo);
	
	/**
	 * 읽은 시간 표기
	 * @param mailNo
	 */
	public void readTime(int mailNo);
	/**
	 * 임시 저장 메일 상세보기
	 * @param 메일 번호
	 * @return
	 */
	public MailVO tempReadMail(int mailNo);
	
	/**
	 * 보낸메일 상세보기
	 * @param mailNo
	 * @return
	 */
	public MailVO sendReadMail(int mailNo);

	public List<RecipientsVO> unReadMail(String emplNo);
	
	/**
	 * 받은 메일 리스트 출력
	 * @return
	 */
	public List<MailVO> readMailList(Map<String, Object> info);
	
	/**
	 * 휴지통 리스트 출력
	 * @param info
	 * @return
	 */
	public List<MailVO> trashMailList(Map<String, Object> info );
	
	/**
	 * 휴지통 리스트 출력
	 * @param info
	 * @return
	 */
	public List<MailVO> tmepMailList(Map<String, Object> info );

	/**
	 * 안읽은 메일 리스트 
	 * @param info
	 * @return
	 */
	public List<MailVO> unReadMailList(String info);
	
	/**
	 * 휴지통으로 이동
	 * @param mail
	 */
	public ServiceResult trashMail(int emailNo);
	
	/**
	 * 휴지통에서 받은메일함으로 
	 * @param mail
	 */
	public ServiceResult trashCancel(int emailNo);
	
	/**
	 * 휴지통에서 삭제
	 * @param emailNo
	 */
	public ServiceResult deleteMail(String emailNo);

	/**
	 * 임시메일함에서 삭제
	 * @param emailNo
	 * @return
	 */
	public ServiceResult tempDeleteMail(String emailNo);
	
	/**
	 * 임시메일함 저장
	 * @param emailNo
	 * @return
	 */
	public ServiceResult tempMail(MailVO mail);
	
	/**
	 * 임시메일함 저장
	 * @param emailNo
	 * @return
	 */
	public ServiceResult tempSaveMail(MailVO mail);
	
	/**
	 * 보낸 메일 리스트 
	 * @param info
	 * @return
	 */
	public List<MailVO> sendMailList(String info);
	
	/**
	 * 임시메일에서 메일 발송
	 * @param mail
	 * @return
	 */
	public ServiceResult updateMail(MailVO mail);
	
	public ServiceResult trashSendMail(int emailNo);

	public List<MailVO> dashMail(int emplNo);
}
