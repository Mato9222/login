package com.teamtodev.mail.vo;

import lombok.Data;

@Data
public class RecipientsVO {
	private Long receNo;
	private Long emplNo;
	private Long emailNo;
	private Long adbkNo;
	private String readTime;
	private String delCode;
	
	private int count;
	private int readCount;
//	마지막 사람이 읽어야 표시되서 해결 변수
//	private int asd;
	
}
