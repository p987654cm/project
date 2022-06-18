package com.eeit144.drinkmaster.controller;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.eeit144.drinkmaster.bean.FirmBean;
import com.eeit144.drinkmaster.bean.FirmColumn;
import com.eeit144.drinkmaster.dto.FirmDTO;
import com.eeit144.drinkmaster.model.FirmService;

@Controller
@RequestMapping("backend/")
public class FirmController {

	private FirmService firmService;

	@Autowired
	public FirmController(FirmService firmService) {
		super();
		this.firmService = firmService;
	}

	@GetMapping("firm/{id}")
	public ResponseEntity<FirmDTO> findFirmById(@PathVariable Integer id) {
		Optional<FirmBean> firmBean = firmService.findById(id);
		
		if (firmBean.isEmpty()) {
			return new ResponseEntity<FirmDTO>(HttpStatus.NO_CONTENT);
		}
		FirmDTO firmDTO = new FirmDTO();
		firmDTO.setFirmId(firmBean.get().getFirmId());
		firmDTO.setFirmName(firmBean.get().getFirmName());
		firmDTO.setFirmAddress(firmBean.get().getFirmAddress());
		firmDTO.setFirmPhone(firmBean.get().getFirmPhone());
		return new ResponseEntity<FirmDTO>(firmDTO, HttpStatus.OK);
	}
	
	@GetMapping("firm/{id}/photo")
	public ResponseEntity<byte[]> getFirmLogo(@PathVariable("id") Integer id) {
		Optional<FirmBean> firmBean = firmService.findById(id);
		
		byte[] firmLogo = firmBean.get().getFirmLogo();
		
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.IMAGE_JPEG);
		
		return new ResponseEntity<byte[]>(firmLogo, headers, HttpStatus.OK);
	}

	@GetMapping("firm/all")
	public String findAllPages(@RequestParam(name = "p", defaultValue = "1") Integer page,
			@RequestParam(name = "c", defaultValue = "1") Integer column,
			@RequestParam(name = "s", defaultValue = "2") Integer size,
			@RequestParam(name = "d", defaultValue = "true") boolean direct,Model m) {
		if (column > 4)
			column = 1;

		Pageable pab = null;
		if (direct) {
			pab = PageRequest.of(page - 1, size, Sort.Direction.ASC, FirmColumn.getColumne(column));
		} else {
			pab = PageRequest.of(page - 1, size, Sort.Direction.DESC, FirmColumn.getColumne(column));
		}

		Page<FirmBean> allFirm = firmService.findAll(pab);
		
		for(FirmBean firm : allFirm) {
			firm.setFirmLogo(null);
		}
		
		m.addAttribute("firms", allFirm);
		
		return "backfirm";
	};

	@PostMapping("firm/add")
	public String addNewFirm(@RequestParam String firmName, @RequestParam String firmAddress,
			@RequestParam String firmPhone, @RequestPart MultipartFile firmLogo) {
		FirmBean newFirm = new FirmBean();

		String contentType = firmLogo.getContentType();
		
		if(!contentType.startsWith("image")) {
			return "redirect:/backend/firm/all";
		}
		
		newFirm.setFirmName(firmName);
		newFirm.setFirmAddress(firmAddress);
		newFirm.setFirmPhone(firmPhone);
		try {
			newFirm.setFirmLogo(firmLogo.getBytes());
		} catch (IOException e) {
			e.printStackTrace();
		}

		firmService.insertFirm(newFirm);
		
		return "redirect:/backend/firm/all";
	}
	
	@GetMapping("firm/edit/{id}")
	public String editFirmPage(@PathVariable("id") Integer id,Model m) {
		Optional<FirmBean> firm = firmService.findById(id);
		
		if(firm.isEmpty()) {
			return "redirect:/backend/firm/all";
		}
		
		m.addAttribute("firmBean", firm);
		return "backeditFirm";	
	}
	
	@PostMapping("firm/edit/{id}")
	public String updateFirm() {
		
		
		return "redirect:/backend/firm/all";
	}

}
