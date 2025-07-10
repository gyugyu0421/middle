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
public class MainController {
	
    @Autowired
    private RecruService recruService;
    
    @Autowired
    private OverseaRecruService oversearecruService;
	
	
    
    @RequestMapping("/main_recru")
    public String kRecruL(
            @RequestParam Map<String, Object> paramMap,
            @RequestParam(required = false) List<String> employmentTypes,
            @RequestParam(required = false) List<String> companyTypes,
            Model model) {

        System.out.println("=== koreaRecruit_List 컨트롤러 진입 ===");
        System.out.println("=== 최신 국내 채용 공고 ===");

        paramMap.put("employmentTypes", employmentTypes);
        paramMap.put("companyTypes", companyTypes);

        List<RecruVO> result = recruService.filterRecruitments(paramMap);
        model.addAttribute("recruitList", result);
        System.out.println("[result.size()] :" + result.size());

        int count = recruService.getRecruCount();
        model.addAttribute("recruCount", count);
        
        
        System.out.println("=== overseaRecruit_List 컨트롤러 진입 ===");

        paramMap.put("employmentTypes", employmentTypes);
        paramMap.put("companyTypes", companyTypes);
        System.out.println("=== 최신 해외 채용 공고 ===");

        List<RecruVO> result2 = oversearecruService.filterOverseaRecruitments(paramMap);
        model.addAttribute("recruitList2", result2);
        System.out.println("[result.size()] :" + result2.size());

        int count2 = oversearecruService.getOverseaRecruCount();
        model.addAttribute("recruCount", count2);


        return "/main_recru";
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
    
    
    
    
}
