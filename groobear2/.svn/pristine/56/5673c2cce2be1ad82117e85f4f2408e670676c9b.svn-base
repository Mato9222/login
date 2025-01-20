package com.teamtodev.employees.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.teamtodev.employees.exception.AuthenticateException;
import com.teamtodev.employees.exception.BadCredentialException;
import com.teamtodev.employees.exception.PkNotFoundException;
import com.teamtodev.employees.exception.UserNotFoundException;
import com.teamtodev.employees.mapper.EmployeeMapper;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.enumpkg.ServiceResult;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class EmployeeServiceImpl implements EmployeeService{
	private final EmployeeMapper emplMapper;
	
	private void encryptEmpl(EmployeeVO empl) {
		String plain = empl.getEmplPw();
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String encoded = encoder.encode(plain);
		empl.setEmplPw(encoded);
	}
	
	@Override
	public ServiceResult insertEmployee(EmployeeVO emplVO) {
		EmployeeVO check = emplMapper.selectEmplForAuth(emplVO.getEmplId());
		if(check==null) {
			encryptEmpl(emplVO);
			if(emplMapper.insertEmployee(emplVO)>0) {
				return ServiceResult.OK;
			}else {
				return ServiceResult.FAIL;
			}
		}else {
			return ServiceResult.PKDUPLICATED;
		}
	}

	@Override
	public ServiceResult updateEmployee(EmployeeVO emplVO) {
		int update = emplMapper.updateEmployee(emplVO);
		if (update > 0 ) { 
			changeAuthentication(emplVO);
			return ServiceResult.OK;
		}
		else {
			return ServiceResult.FAIL;
		}
	}

	@Override
	public List<EmployeeVO> selectEmployeeList() {
		List<EmployeeVO> emplList = emplMapper.selectEmployeeList();
		return emplList;
	}

	// 아이디로 단건 조회
	@Override
	public EmployeeVO selectEmployeeById(String emplId) {
		EmployeeVO emplVO = emplMapper.selectEmployeeById(emplId).orElseThrow(() -> new PkNotFoundException(500));
		return emplVO;
	}
	
	// 사번으로 단건 조회
	@Override
	public EmployeeVO selectEmployeeByNo(int emplNo) {
		EmployeeVO emplVO = emplMapper.selectEmployeeByNo(emplNo).orElseThrow(() -> new PkNotFoundException(500));
		return emplVO;
	}

	@Override
	public ServiceResult deleteEmployee(int emplNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public EmployeeVO authenticate(EmployeeVO inputData) {
		EmployeeVO saved = emplMapper.selectEmployeeById(inputData.getEmplId()).orElseThrow(() -> new PkNotFoundException(500));
		if(saved==null)
			throw new UserNotFoundException(String.format("%s 존재하지 않은 계정", inputData.getEmplId()));
		if(saved.getRetireDe()!=null) 
			throw new AuthenticateException("퇴사한 임직원 계정");
		String savePass = saved.getEmplPw();
		String inputPass = inputData.getEmplPw();
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(encoder.matches(inputPass, savePass)) {
			return saved;
		}else {
			throw new BadCredentialException("비밀번호 오류");
		}
	}

	@Override
	public ServiceResult UpdateEmployeeSignURL(EmployeeVO emplVO) {
		int update = emplMapper.UpdateEmployeeSignURL(emplVO);
		if(update > 0) {
			changeAuthentication(emplVO);
			return ServiceResult.OK;
		}
		return ServiceResult.FAIL;
	}
	
	@Autowired
	AuthenticationManager authManager;
	private void changeAuthentication(EmployeeVO emplVO) {
		EmployeeVO user = emplMapper.selectEmplForAuth(emplVO.getEmplId());
		String emplId = emplVO.getEmplId();
		String emplPw = emplVO.getEmplPw();
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		if(encoder.matches(emplPw, user.getEmplPw() )) {
			UsernamePasswordAuthenticationToken token = new UsernamePasswordAuthenticationToken(emplId, emplPw);
			Authentication auth;
			auth = authManager.authenticate(token);
			SecurityContextHolder.getContext().setAuthentication(auth);
		}
	}

	@Override
	public int selectEmplPasswordAccess(EmployeeVO emplVO) {
		EmployeeVO user = emplMapper.selectEmplForAuth(emplVO.getEmplId());
		PasswordEncoder encoder = PasswordEncoderFactories.createDelegatingPasswordEncoder();
		String userPw = user.getEmplPw();
		String InputPw = emplVO.getEmplPw();
		int result = 0;
		if(encoder.matches(InputPw, userPw)) {
			changeAuthentication(emplVO);
			return 1;
		}else {
			return result;
		}
	}

}
