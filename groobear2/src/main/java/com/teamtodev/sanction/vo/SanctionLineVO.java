package com.teamtodev.sanction.vo;

import java.util.List;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "sanctnLineNo")
public class SanctionLineVO {
	private String sanctnLineNo;
	private int emplNo;
	private String sanctnLnNm;
	
	private List<SanctionLineDetailVO> sclineDetailList;
//	private List<SanctionVO> sanctionList;
}
