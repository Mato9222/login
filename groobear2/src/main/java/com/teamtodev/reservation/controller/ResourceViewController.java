package com.teamtodev.reservation.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.teamtodev.reservation.service.ResourceService;
import com.teamtodev.reservation.vo.ResourcesVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/resources")
public class ResourceViewController {
	
	@Autowired
	private ResourceService service;
	
	@GetMapping("/roomList")
	public String selectRoomList(Model model) {
		List<ResourcesVO> roomList = service.retrieveRoomList();
		model.addAttribute("roomList",roomList);
		return "reservation/roomlist";
	}
	
	@GetMapping("/carList")
	public String selectCarList(Model model) {
		List<ResourcesVO> carList = service.retrieveCarList();
		log.info("carList :  {}", carList);
		model.addAttribute("carList",carList);
		return "reservation/carlist";
	}
	
	@GetMapping("/usingList")
	public String selectUsingList(Model model) {
		List<ResourcesVO> usingList = service.retrieveUsingList();
		model.addAttribute("usingList",usingList);
		return "reservation/usinglist";
	}
	
	@GetMapping("/resourceList")
	@ResponseBody
	public List<ResourcesVO> selectResourceList() {
		List<ResourcesVO> rsList = service.retrieveResourceList();
		return rsList;
	}

	@GetMapping(value="/searchResource/{resrceNo}",produces = MediaType.APPLICATION_JSON_VALUE)
	public ResourcesVO selectResourceDetail(@PathVariable int resrceNo) {
		ResourcesVO modalRsVO = service.retrieveResourceDetail(resrceNo);
		return modalRsVO;
	}
	
	   @GetMapping(value="/searchResourceDiv/{resrceNo}",produces = MediaType.APPLICATION_JSON_VALUE)
	   @ResponseBody
	   public ResourcesVO selectResourceDetailDiv(@PathVariable int resrceNo) {
	      ResourcesVO rsVO = service.retrieveResourceDetail(resrceNo);
	      return rsVO;
	   }
}
