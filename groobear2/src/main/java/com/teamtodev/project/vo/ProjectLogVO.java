package com.teamtodev.project.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of="logNo")
public class ProjectLogVO {
	private int logNo;
	private String logClass;
	private String logStatus;
	private String logConPk;
	private String logDate;
	private String worksTitle;
	private String sntncSj;
	private String wmName;
	private String pmName;
}
