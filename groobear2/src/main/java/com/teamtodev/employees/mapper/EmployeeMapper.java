package com.teamtodev.employees.mapper;

import java.util.List;
import java.util.Optional;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.teamtodev.employees.vo.EmployeeVO;

@Mapper
public interface EmployeeMapper {
	
	/**
	 * 임직원 계정 생성
	 * @param emplVO
	 * @return
	 */
	public int insertEmployee(EmployeeVO emplVO);
	
	/**
	 * 임직원 계정 수정
	 * @param emplVO
	 * @return
	 */
	public int updateEmployee(EmployeeVO emplVO);
	
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
	public Optional<EmployeeVO> selectEmployeeById(String emplId);
	
	/**
	 * 임직원 조회(사번)
	 * @param emplId
	 * @return
	 */
	public Optional<EmployeeVO> selectEmployeeByNo(int emplNo);
	
	/**
	 * 임직원 계정 삭제
	 * @param emplNo
	 * @return
	 */
	public int deleteEmployee(int emplNo);
	
	/**
	 * 임직원 도장 URL 변경
	 * @param emplVO
	 * @return
	 */
	public int UpdateEmployeeSignURL(EmployeeVO emplVO);
	
	/**
	 * 임직원 인증
	 * @param emplId
	 * @return
	 */
	public EmployeeVO selectEmplForAuth(@Param("emplId") String emplId);
	
	/**
	 * 패스워드 인증
	 * @param emplVO
	 * @return
	 */
	public int selectEmplPasswordAccess(EmployeeVO emplVO);
	
}
