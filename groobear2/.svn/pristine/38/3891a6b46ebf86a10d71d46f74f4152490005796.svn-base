package com.teamtodev.board.vo;

import java.util.List;

import com.teamtodev.employees.vo.EmployeeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "answerNo")
public class CommentsVO {
	private Integer answerNo; // 댓글번호
	private Integer upperAnswerNo; // 상위댓글번호
	private Integer sntncNo; // 글번호
	private Integer emplNo; // 사원번호
	private String answerCn; // 댓글내용( 4000byte제한 )
	private String registDt; // 등록일시
	private String deleteDt; // 삭제일시
	private String deleteAt; // 삭제여부
	
	//??
	private List<PostVO> postList; // Has Many
	private List<EmployeeVO> emplList; // Has Many
}
