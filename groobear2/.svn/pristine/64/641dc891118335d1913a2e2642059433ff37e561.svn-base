package com.teamtodev.department.service;

import java.util.List;

import com.teamtodev.department.vo.DepartmentVO;

public interface DepartmentService {
	/**
	 * 부서 계정 생성
	 * @param deptVO
	 * @return
	 */
	public Integer insertDepartment(DepartmentVO deptVO);
	
	/**
	 * 부서 계정 수정
	 * @param deptVO
	 * @return
	 */
	public int updateDepartment(DepartmentVO deptVO);
	
	/**
	 * 부서 전체 조회
	 * @return
	 */
	public List<DepartmentVO> selectDepartmentList();
	
	/**
	 * 부서 전체 소속 인원 조회
	 * @return
	 */
	public List<DepartmentVO> selectDepartmentEmplList();
	
	/**
	 * 부서 조회
	 * @param deptNo
	 * @return
	 */
	public DepartmentVO selectDepartment(int deptNo);
	
	/**
	 * 부서 계정 삭제
	 * @param deptNo
	 * @return
	 */
	public int deleteDepartment(int deptNo);
}
