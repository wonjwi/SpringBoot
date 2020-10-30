package com.edu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Controller
@RequestMapping("/boards")
@Log
public class WebBoardController {
	
	// /boards/list.html
	@GetMapping("/list")
	public void list() {
		log.info("list()에 진입했습니다.");
	}
}