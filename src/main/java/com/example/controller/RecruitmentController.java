package com.example.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.RecruitmentVO;
import com.example.service.RecruitmentService;


@Controller
public class RecruitmentController {
    
    @Autowired
    private RecruitmentService recruitmentService;

    @GetMapping("/recruit")
    public String recruitmentList(Model model) {
    	
        // DB에서 채용공고 목록 가져오기
        List<RecruitmentVO> recruitments = recruitmentService.getAllRecruitments();
        model.addAttribute("recruitments", recruitments);
        return "recruit"; // → /WEB-INF/views/recruit.jsp
    }
    

    // 비활성화 처리
    @GetMapping("/recruit/deactivate/{rckey}")
    public String deactivateRecruit(@PathVariable int rckey) {
        recruitmentService.deactivateRecruit(rckey);
        return "redirect:/recruit";
    }

    @GetMapping("/recruit/activate/{rckey}")
    public String activateRecruit(@PathVariable int rckey) {
        recruitmentService.activateRecruit(rckey);
        return "redirect:/recruit";
    }

    // 삭제 처리
    @GetMapping("/recruit/delete/{rckey}")
    public String deleteRecruit(@PathVariable int rckey, RedirectAttributes redirectAttrs) {
        boolean success = recruitmentService.deleteRecruit(rckey);
        if(success) {
            redirectAttrs.addFlashAttribute("message", "공고가 삭제되었습니다.");
        } else {
            redirectAttrs.addFlashAttribute("error", "삭제 실패했습니다.");
        }
        return "redirect:/recruit";
    }
    
    @GetMapping("/recruit/{rckey}")
    public String recruitmentDetail(@PathVariable("rckey") int rckey, Model model) {
        RecruitmentVO kRecru = recruitmentService.getRecruitmentByKey(rckey);
        model.addAttribute("kRecru", kRecru);
        return "recruitDetail"; // 상세 페이지 JSP or HTML
    }
    
    
    @GetMapping("/map")
    public String map(Model model) {
    	return "map";
    }
    
    
    
    
    

}