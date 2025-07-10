package com.example.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.RecruVO;
import com.example.model.ResumeVO;
import com.example.service.RecruService;
import com.example.service.ResumeService;


@Controller
@RequestMapping("/resume")
public class MyresumeController {
	
    @Autowired
    private ResumeService resumeService;
	

    @GetMapping("/resume_Mylist")
    public String mypage(HttpSession session,
    		@RequestParam Map<String, Object> paramMap,
            @RequestParam(required = false) List<String> resumeList,		  
            Model model) {
    	
		   	
    	System.out.println("=== mypage 컨트롤러 진입 ===");

        paramMap.put("resumeList", resumeList);
			
		  List<ResumeVO> result = resumeService.getResumeList(paramMap);
		  model.addAttribute("myresumeList", result);
		  System.out.println("[result.size()] :" + result.size());
		 

        int count = resumeService.getResumeCount();
        model.addAttribute("resumeCount", count);
    	
    	
    	return "/resume/resume_Mylist";
    }
    
    @GetMapping("/resume_View")
    public String resume_View(ResumeVO vo, Model model) {
    	System.out.println("=== resume_View 컨트롤러 진입 ===");
    	
    	ResumeVO result2 = resumeService.getResume(vo);
    	model.addAttribute("resumeView",result2);
    	System.out.println("[result.size()]:"+result2.toString());
    	
    	
    	return "resume/resume_View";
    	
    }

    
    
}
