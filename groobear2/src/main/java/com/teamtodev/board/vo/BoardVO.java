package com.teamtodev.board.vo;

import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "bbsNo")
public class BoardVO implements Serializable {
	private Integer bbsNo; // 게시판번호
	private Integer upperBbsNo; // 상위게시판번호
	private String bbsNm; // 게시판이름
	private String bbsDc; // 게시판설명
	private String bbsUseAt; // 게시판사용여부
	
}
