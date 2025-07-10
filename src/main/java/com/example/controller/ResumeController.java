package com.example.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.model.MemberVO;
import com.example.model.MembersVO;
import com.example.model.RecruVO;
import com.example.model.ResumeVO;
import com.example.service.RecruService;
import com.example.service.ResumeService;


@Controller
@RequestMapping("/resume") 
public class ResumeController {
	
	@Autowired
    private ResumeService resumeService;
	
	
	@GetMapping("/resume_Write")
    public String resume_Write(Model model) {	
		
		return "resume/resume_Write";		
	}
	
	
	@RequestMapping("/insertResume")
    public String resumeWrite(@ModelAttribute ResumeVO vo, HttpSession session) {
		System.out.println("=== resumeWrite 진입 ===");
		
		 MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
		
		 session.setAttribute("mkey", loginUser.getMkey());
		 session.setAttribute("id", loginUser.getId());
		 session.setAttribute("username", loginUser.getUsername());

        vo.setMkey(loginUser.getMkey());
        vo.setId(loginUser.getId());

        System.out.println("넘어온 데이터: " + vo.toString());
        resumeService.insertResume(vo);
        return "redirect:/main_recru";
    }
	
}
