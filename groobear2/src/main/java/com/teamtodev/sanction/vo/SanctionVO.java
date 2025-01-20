package com.teamtodev.sanction.vo;

import java.time.LocalDate;
import java.util.List;

import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "sanctnNo")
public class SanctionVO {
	private LocalDate sanctnDe;
	private int sanctnNo;
	private String sanctnDocNo;
	private String sanctnLineNo;
	private int sanctnEmplNo;
	private Integer realSanctnEmplNo;
	private String realSanctnCtpntUrl;
	private int sanctnOrdr;
	private String sanctnOpinion;
	private String sanctnSttusCode;
	private String sanctnCn;
	
	private EmployeeVO emplList;
	private CommonVO commList;
}
