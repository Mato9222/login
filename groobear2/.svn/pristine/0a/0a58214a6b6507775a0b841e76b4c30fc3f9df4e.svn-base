package com.teamtodev.project.vo;

import java.util.List;

import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "prjctMbrNo")
public class ProjectMemberVO {
	private int prjctMbrNo;
	private int emplNo;
	private String prjctCode;
	private String prjctMngrAt;
	private String prjctRoleCode;
	private String prjctRoleCodeNm;
	
	private List<ProjectCommentVO> pjCommentVO; // Has Many
	private List<ProjectWorkVO> pjWorkVO; // Has Many
	private List<ProjectPostVO> pjPostVO; // Has Many
	private EmployeeVO empVO;
	private CommonVO comVO;
}
