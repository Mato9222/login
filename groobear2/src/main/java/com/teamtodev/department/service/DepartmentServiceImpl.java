package com.teamtodev.department.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.teamtodev.department.mapper.DepartmentMapper;
import com.teamtodev.department.vo.DepartmentVO;

@Service
public class DepartmentServiceImpl implements DepartmentService{

	@Autowired
	DepartmentMapper deptMapper;
	
	@Override
	public Integer insertDepartment(DepartmentVO deptVO) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateDepartment(DepartmentVO deptVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DepartmentVO> selectDepartmentList() {
		return deptMapper.selectDepartmentList();
	}

	@Override
	public DepartmentVO selectDepartment(int deptNo) {
		return deptMapper.selectDepartment(deptNo);
	}

	@Override
	public int deleteDepartment(int deptNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<DepartmentVO> selectDepartmentEmplList() {
		return deptMapper.selectDepartmentEmplList();
	}

}
