package com.teamtodev.common.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "cmmnCode")
public class CommonVO {
	private String cmmnCode;
	private String cmmnCodeGroupnm;
	private String cmmnCodeNm;
	private String cmmnCodeDcCn;
	private Long outptOrdr;
	private String useAt;
}
