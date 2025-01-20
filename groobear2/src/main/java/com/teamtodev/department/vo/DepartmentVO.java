package com.teamtodev.department.vo;

import java.util.List;

import com.teamtodev.employees.vo.EmployeeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(of = "deptNo")
public class DepartmentVO {
	private int deptNo;
	private String deptNm;
	private int dprlrEmplNo;
	private Integer upperDeptNo;
	private List<EmployeeVO> emplList; // Has Many
}
