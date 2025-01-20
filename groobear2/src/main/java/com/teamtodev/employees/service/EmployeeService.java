package com.teamtodev.employees.service;

import java.util.List;
import java.util.Optional;

import com.teamtodev.employees.exception.AuthenticateException;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.enumpkg.ServiceResult;

public interface EmployeeService {
	
	/**
	 * 임직원 계정 생성
	 * @param emplVO
	 * @return
	 */
	public ServiceResult insertEmployee(EmployeeVO emplVO);
	
	/**
	 * 임직원 계정 수정
	 * @param emplVO
	 * @return
	 */
	public ServiceResult updateEmployee(EmployeeVO emplVO);
	
	/**
	 * 임직원 전체 조회
	 * @return
	 */
	public List<EmployeeVO> selectEmployeeList();
	
	/**
	 * 임직원 조회(아이디)
	 * @param emplId
	 * @return
	 */
	public EmployeeVO selectEmployeeById(String emplId);
	
	/**
	 * 임직원 조회(사번)
	 * @param emplId
	 * @return
	 */
	public EmployeeVO selectEmployeeByNo(int emplNo);
	
	/**
	 * 임직원 도장 URL 변경
	 * @param emplVO
	 * @return
	 */
	public ServiceResult UpdateEmployeeSignURL(EmployeeVO emplVO);
		
	
	/**
	 * 임직원 계정 삭제
	 * @param emplNo
	 * @return
	 */
	public ServiceResult deleteEmployee(int emplNo);
	
	/**
	 * 패스워드 인증
	 * @param emplVO
	 * @return
	 */
	public int selectEmplPasswordAccess(EmployeeVO emplVO);
	
	public EmployeeVO authenticate(EmployeeVO inputData) throws AuthenticateException;
}
