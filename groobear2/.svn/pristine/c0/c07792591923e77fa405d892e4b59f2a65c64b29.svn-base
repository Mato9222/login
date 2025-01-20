package com.teamtodev.employees.vo;

import java.util.List;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class EmployeeVOWrapper extends User{
	private final EmployeeVO realUser;

	public EmployeeVOWrapper(EmployeeVO realUser, List<GrantedAuthority> authorities) {
		super(realUser.getEmplId(), realUser.getEmplPw(), authorities);
		this.realUser = realUser;
	}

	public EmployeeVO getRealUser() {
		return realUser;
	}
	
}
