package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/template")
public class TemplateController {
	
	// 템플릿 목록 페이지
    @GetMapping("/templatelist")
    public String showTemplateList() {
        return "template/templatelist"; //jsp 경로
    }
}