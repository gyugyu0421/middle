package com.example.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.dao.RecruDAO;
import com.example.model.RecruVO;
import com.example.service.MemberService;
import com.example.service.OverseaRecruService;
import com.example.service.RecruService;


@Controller
@RequestMapping("/overseaRecruit") 
public class OverseaRecruController {
	
    @Autowired
    private OverseaRecruService oversearecruService;
	
	
    
    @RequestMapping("/overseaRecruit_List")
    public String overseaRecruit_List(
            @RequestParam Map<String, Object> paramMap,
            @RequestParam(required = false) List<String> employmentTypes,
            @RequestParam(required = false) List<String> companyTypes,
            Model model) {

        System.out.println("=== overseaRecruit_List 컨트롤러 진입 ===");

        paramMap.put("employmentTypes", employmentTypes);
        paramMap.put("companyTypes", companyTypes);

        List<RecruVO> result = oversearecruService.filterOverseaRecruitments(paramMap);
        model.addAttribute("recruitList", result);
        System.out.println("[result.size()] :" + result.size());

        int count = oversearecruService.getOverseaRecruCount();
        model.addAttribute("recruCount", count);

        return "/overseaRecruit/overseaRecruit_List";
    }
    
    @GetMapping("/overseaRecruit_Write")
    public String overseaRecruit_Write(Model model) {
       	return "/overseaRecruit/overseaRecruit_Write";
    }
    
    @GetMapping("/overseaRecruit_View")
    public String overseaRecruit_View(RecruVO vo,Model model) {
    System.out.println("=== overseaRecruit_View 컨트롤러 진입 ===");

    RecruVO result = oversearecruService.getOverseaRecru(vo);
    model.addAttribute("oRecru", result);
    System.out.println("[result] :" +  result.toString());
    
	System.out.println("=== getOtherOverseaRecruList 진입 ===");
	List<RecruVO> result2 = oversearecruService.getOtherOverseaRecruList(new HashMap<>());
	model.addAttribute("getOtherOverseaRecruList", result2);
    System.out.println("[result.size()] :" +  result2.size());
    	
       	return "/overseaRecruit/overseaRecruit_View";
    }
    
    @RequestMapping("/insertOverseaRecru")
    public String insertRecru(@ModelAttribute RecruVO vo) {
    	System.out.println("넘어온 데이터: " + vo.toString());
    	
    	oversearecruService.insertOverseaRecru(vo);
        return "redirect:/overseaRecruit/overseaRecruit_List"; // 작성 완료 후 목록 페이지로 이동
    }
    
    
}
