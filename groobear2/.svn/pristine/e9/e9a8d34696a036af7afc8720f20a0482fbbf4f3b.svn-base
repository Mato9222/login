package com.teamtodev.employees.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.teamtodev.employees.mapper.EmployeeMapper;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;

import lombok.extern.slf4j.Slf4j;
@Service
public class CustomEmplDetailsService implements UserDetailsService{

	@Autowired
	private EmployeeMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		EmployeeVO realUser = mapper.selectEmplForAuth(username);
		if(realUser==null) {
			throw new UsernameNotFoundException(String.format("%s 사용자 없음.", username));
		}
		String emplRole = realUser.getRspofcCodeNm();
		List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList(emplRole);
		authorities.addAll(loadAuthrotiesByRole(emplRole));
		EmployeeVOWrapper userDetails = new EmployeeVOWrapper(realUser, authorities);
		return userDetails;
	}

	private List<GrantedAuthority> loadAuthrotiesByRole(String role){
		List<GrantedAuthority> authorities = new ArrayList<>();
//		if(role.endsWith("팀장")) {
//			authorities.add(new SimpleGrantedAuthority("fdfs"));
//		}
		return authorities;
	}
	
}
