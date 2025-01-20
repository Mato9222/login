package com.teamtodev.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamtodev.common.mapper.CommonMapper;
import com.teamtodev.common.vo.CommonVO;
import com.teamtodev.employees.vo.EmployeeVO;
import com.teamtodev.employees.vo.EmployeeVOWrapper;
import com.teamtodev.reservation.service.ReservationService;
import com.teamtodev.reservation.service.ResourceService;
import com.teamtodev.reservation.vo.ReservationVO;
import com.teamtodev.reservation.vo.TimeTypeVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/reservation")
public class ReservationController {
	@Autowired
	private CommonMapper mapper;

	@Autowired
	private ResourceService rservice;

	@Autowired
	private ReservationService service;

	@GetMapping("/reservationList")
	public String reservationList(Model model,Authentication authentication) {
		EmployeeVOWrapper wrapper =  (EmployeeVOWrapper) authentication.getPrincipal();
		EmployeeVO emplVO = wrapper.getRealUser();
		List<ReservationVO> rvList = service.retrieveReservationList(emplVO.getEmplNo());
		model.addAttribute("rvList", rvList);
		List<TimeTypeVO> timeList = rservice.retrieveTimeTypeList();
		model.addAttribute("timeList", timeList);
		return "reservation/reservationlist";
	}

	@GetMapping("/reservationForm")
	public String formView(Model model) {
		List<CommonVO> ccList = mapper.selectCommonList("자원");
		model.addAttribute("ccList", ccList);
		List<TimeTypeVO> timeList = rservice.retrieveTimeTypeList();
		model.addAttribute("timeList", timeList);
		return "reservation/detailviewandform";
	}
	
	@GetMapping(value="{resveCode}",produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ReservationVO selectOneReservation(@PathVariable String resveCode){
		ReservationVO selectVo = service.retrieveReservation(resveCode);
		return selectVo;
	}

	@PostMapping(produces = MediaType.TEXT_PLAIN_VALUE)
	@ResponseBody
	public String insertReservation(@RequestBody ReservationVO rsVO) {
		service.createReservation(rsVO);
		return "ok";
	}

	@PutMapping(value = "/deleteReservation/{resveCode}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String deleteReservation(@RequestBody @PathVariable String resveCode) {
		service.deleteReservation(resveCode);
		return "ok";
	}
	
	@PutMapping(value = "/returnReservation/{resveCode}", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String returnReservation(@RequestBody @PathVariable String resveCode) {
		service.returnReservation(resveCode);
		return "ok";
	}

	@PutMapping(value = "/updateReservation", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public String updateReservation(@RequestBody  ReservationVO rsVO) {
		log.info("rsVO : {}",rsVO);
		service.modifyReservation(rsVO);
		return "ok";
	}
	
	@GetMapping(value="/getStartTimeNo/{resveBeginDe}/{resrceNo}")
	@ResponseBody
	public List<ReservationVO> selectStartTimeList(@RequestBody @PathVariable String resveBeginDe,@PathVariable int resrceNo){
		ReservationVO rvVO = new ReservationVO();
		rvVO.setResveBeginDe(resveBeginDe);
		rvVO.setResrceNo(resrceNo);
		List<ReservationVO> startList = service.retrieveReserStartTimeList(rvVO);
		return startList;
	}
	
	@GetMapping(value="/getEndTimeNo/{resveEndDe}/{resrceNo}")
	@ResponseBody
	public List<ReservationVO> selectEndTimeList(@RequestBody @PathVariable String resveEndDe,@PathVariable int resrceNo){
		ReservationVO rvVO = new ReservationVO();
		rvVO.setResveEndDe(resveEndDe);
		rvVO.setResrceNo(resrceNo);
		List<ReservationVO> endList = service.retrieveReserEndTimeList(rvVO);
		return endList;
	}
}
