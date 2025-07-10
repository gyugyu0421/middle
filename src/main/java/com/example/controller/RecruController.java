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
import com.example.service.RecruService;


@Controller
@RequestMapping("/koreaRecruit") 
public class RecruController {
	
    @Autowired
    private RecruService recruService;
	
    
	@RequestMapping("/koreaRecruit_List")
    public String kRecruL(
            @RequestParam Map<String, Object> paramMap,
            @RequestParam(required = false) List<String> employmentTypes,
            @RequestParam(required = false) List<String> companyTypes,
            Model model) {

        System.out.println("=== koreaRecruit_List 컨트롤러 진입 ===");

        paramMap.put("employmentTypes", employmentTypes);
        paramMap.put("companyTypes", companyTypes);

        List<RecruVO> result = recruService.filterRecruitments(paramMap);
        model.addAttribute("recruitList", result);
        System.out.println("[result.size()] :" + result.size());

        int count = recruService.getRecruCount();
        model.addAttribute("recruCount", count);

        return "/koreaRecruit/koreaRecruit_List";
    }
    
    @GetMapping("/koreaRecruit_Write")
    public String kRecruW(Model model) {
       	return "/koreaRecruit/koreaRecruit_Write";
    }
    
    @GetMapping("/koreaRecruit_View")
    public String koreaRecruit_View(RecruVO vo,Model model) {
    System.out.println("=== koreaRecruit_View 컨트롤러 진입 ===");

    RecruVO result = recruService.getKRecru(vo);
    model.addAttribute("kRecru", result);
    System.out.println("[result] :" +  result.toString());
    
	System.out.println("=== getOtherKRecruList 진입 ===");
	List<RecruVO> result2 = recruService.getOtherKRecruList(new HashMap<>());
	model.addAttribute("getOtherKRecruList", result2);
    System.out.println("[result.size()] :" +  result2.size());
    	
       	return "/koreaRecruit/koreaRecruit_View";
    }
    
    @RequestMapping("/insertRecru")
    public String insertRecru(@ModelAttribute RecruVO vo) {
    	System.out.println("넘어온 데이터: " + vo.toString());
    	
        recruService.insertKRecru(vo);
        return "redirect:/koreaRecruit/koreaRecruit_List"; // 작성 완료 후 목록 페이지로 이동
    }
    
    
}
