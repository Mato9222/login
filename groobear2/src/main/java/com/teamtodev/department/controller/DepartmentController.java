package com.teamtodev.department.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.teamtodev.department.service.DepartmentService;
import com.teamtodev.department.vo.DepartmentVO;
import com.teamtodev.employees.vo.EmployeeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequiredArgsConstructor
@RequestMapping("/dept")
public class DepartmentController {

    private final DepartmentService deptService;

    @GetMapping(value = "/tree", produces = "application/json;charset=UTF-8")
    public List<Map<String, Object>> getDepartmentTree() {
        List<DepartmentVO> departments = deptService.selectDepartmentEmplList();

        Map<Integer, List<EmployeeVO>> deptEmployeesMap = new HashMap<>();
        for (DepartmentVO department : departments) {
            List<EmployeeVO> employees = department.getEmplList();
            deptEmployeesMap.put(department.getDeptNo(), employees);
        }

        List<Map<String, Object>> tree = buildTree(departments, deptEmployeesMap);

        return tree;
    }

    private List<Map<String, Object>> buildTree(List<DepartmentVO> departments, Map<Integer, List<EmployeeVO>> deptEmployeesMap) {
        List<Map<String, Object>> tree = new ArrayList<>();
        Map<Integer, Map<String, Object>> deptMap = new HashMap<>(); 

        for (DepartmentVO department : departments) {
            Map<String, Object> deptNode = new HashMap<>();
            deptNode.put("id", department.getDeptNo());
            deptNode.put("text", department.getDeptNm());
            deptNode.put("icon", "ki-solid ki-file  text-primary");
            deptNode.put("class", "department-node");
            deptNode.put("children", new ArrayList<Map<String, Object>>());
            deptNode.put("type", "department"); 

            deptMap.put(department.getDeptNo(), deptNode); 
        }

        for (DepartmentVO department : departments) {
            if (department.getUpperDeptNo() == null) {
                tree.add(deptMap.get(department.getDeptNo()));
            } else {
                Map<String, Object> parent = deptMap.get(department.getUpperDeptNo());
                if (parent != null) {
                    @SuppressWarnings("unchecked")
                    List<Map<String, Object>> children = (List<Map<String, Object>>) parent.get("children");
                    children.add(deptMap.get(department.getDeptNo()));
                }
            }

            List<EmployeeVO> employees = deptEmployeesMap.get(department.getDeptNo());
            if (employees != null) {
                for (EmployeeVO employee : employees) {
                    Map<String, Object> emplNode = new HashMap<>();
                    emplNode.put("id", employee.getEmplNo());
                    emplNode.put("text", employee.getEmplNm() +
                            " (" + employee.getOfcpsCode() + ", " 
                            + employee.getRspofcCode() + ")");
                    emplNode.put("emplNm", employee.getEmplNm());
                    emplNode.put("emplCode", employee.getOfcpsCode() + ", " 
                            + employee.getRspofcCode());
                    emplNode.put("profile", employee.getProflPhotoCours());
                    emplNode.put("icon", "ki-solid ki-user text-waring fs-4");
                    emplNode.put("type", "employee"); 

                    Map<String, Object> deptNode = deptMap.get(department.getDeptNo());
                    @SuppressWarnings("unchecked")
                    List<Map<String, Object>> deptChildren = (List<Map<String, Object>>) deptNode.get("children");
                    deptChildren.add(emplNode);
                }
            }
        }

        return tree;
    }
   
	@GetMapping(value = "/organ", produces = "application/json;charset=UTF-8")
	public List<Map<String, Object>> getOrganizationTree() {
		List<DepartmentVO> departments = deptService.selectDepartmentEmplList();
		
		Map<Integer, List<EmployeeVO>> deptEmployeesMap = new HashMap<>();
		for (DepartmentVO department : departments) {
			List<EmployeeVO> employees = department.getEmplList();
			deptEmployeesMap.put(department.getDeptNo(), employees);
		}
		
		List<Map<String, Object>> organ = buildTree(departments, deptEmployeesMap);
		
		return organ;
	}
    
    @GetMapping(value = "/tri", produces = "application/json;charset=UTF-8")
    public List<Map<String, Object>> getDepartmentTreeForEmployeeInsert() {
        List<DepartmentVO> departments = deptService.selectDepartmentEmplList();
        List<Map<String, Object>> tri = buildTreeForEmployeeInsert(departments);
        return tri;
    }

    private List<Map<String, Object>> buildTreeForEmployeeInsert(List<DepartmentVO> departments) {
        List<Map<String, Object>> tri = new ArrayList<>();
        Map<Integer, Map<String, Object>> deptMap = new HashMap<>(); 

        for (DepartmentVO department : departments) {
            Map<String, Object> deptNode = new HashMap<>();
            deptNode.put("id", department.getDeptNo());
            deptNode.put("text", department.getDeptNm());
            deptNode.put("icon", "/resources/image/home.jpg");
            deptNode.put("class", "department-node");
            deptNode.put("children", new ArrayList<Map<String, Object>>());
            deptNode.put("type", "department"); 

            deptMap.put(department.getDeptNo(), deptNode); 
        }

        for (DepartmentVO department : departments) {
            if (department.getUpperDeptNo() == null) {
                tri.add(deptMap.get(department.getDeptNo()));
            } else {
                Map<String, Object> parent = deptMap.get(department.getUpperDeptNo());
                if (parent != null) {
                    @SuppressWarnings("unchecked")
                    List<Map<String, Object>> children = (List<Map<String, Object>>) parent.get("children");
                    children.add(deptMap.get(department.getDeptNo()));
                }
            }
        }

        return tri;
    }
}
