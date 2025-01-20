package com.teamtodev.mail.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Mapper;

import com.teamtodev.enumpkg.ServiceResult;
import com.teamtodev.mail.vo.MailVO;
import com.teamtodev.mail.vo.RecipientsVO;
import com.teamtodev.paging.PaginationInfo;

@Mapper
public interface MailListMapper {

	/**
	 * 메일 작성 
	 * @param mail
	 * @return 
	 */
	public int insertMail(MailVO mail);
	
	/**
	 * 수신자테이블에 수신자, 참조자 입력
	 * @param mail
	 * @return
	 */
	public int insertMailR(MailVO mail);
	
	/**
	 * 선택 메일 상세보기
	 * @param 메일 번호
	 * @return
	 */
	public MailVO selectMail(int mailNo);
	
	public List<RecipientsVO> unReadMail(String emplNo);
	
	public int sendMailCount(RecipientsVO rece);

	public int sendReadMailCount(RecipientsVO rece);
	/**
	 * 상세페이지 들어가면 일은 시간 출력
	 * @param mailNo
	 * @return
	 */
	public int readTime(int mailNo);
	
	/**
	 * 받은 메일 리스트 출력
	 * @return
	 */
	public List<MailVO> selectMailList(Map<String, Object> info);
	
	/**
	 * 안읽은 메일 리스트 출력
	 * @return
	 */
	public List<MailVO> unReadMailList(String info);
	
	/**
	 * 휴지통 리스트 출력
	 * @param info
	 * @return
	 */
	public List<MailVO> trashMailList(Map<String, Object> info );
	
	/**
	 * 임시메일 리스트 출력
	 * @param info
	 * @return
	 */
	public List<MailVO> tempMailList(Map<String, Object> info );
	
	/**
	 * 임시메일 상세보기
	 * @param mailNo
	 * @return
	 */
	public MailVO tempReadMail(int mailNo);
	
	public int updateMail(MailVO mail);
	/**
	 * 메일 휴지통으로
	 * @param mail
	 */
	public int trashMail(int emailNo);
	
	/**
	 * 휴지통에서 살리기
	 * @param emailNo
	 * @return
	 */
	public int trashCancel(int emailNo);
	
	/**
	 * 메일 삭제 
	 * @param mail
	 */
	public int deleteRece(String emailNo);
	public int deleteMail(String emailNo);
	
	/**
	 * 임시메일함으로 이동
	 * @param emailNo
	 */
	public int tempMail(MailVO mail);

	/**
	 * 보낸 메일 리스트 출력
	 * @return
	 */
	public List<MailVO> sendMailList(String info);

	public int outBoxDel(int emailNo);
	
	public int tempSaveMail(MailVO mail);
	
	public List<MailVO> dashMail(int emplNo);
}
