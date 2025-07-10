package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.AdminFreeboardVO;
import com.example.model.MemberVO;
import com.example.service.AdminFreeboardService;

@Controller


public class AdminFreeboardController {

    @Autowired
    private AdminFreeboardService adminFreeboardService;

    // 카테고리별 조회 - /BoardFree/category?fbcategory=xxx
    @GetMapping("/BoardFree/category")
    public String getListByCategory(@RequestParam("fbcategory") String fbcategory, Model model) {
        List<AdminFreeboardVO> list = adminFreeboardService.getListByCategory(fbcategory);
        model.addAttribute("freeboardList", list);    // 속성 이름 통일
        model.addAttribute("category", fbcategory);
        return "BoardFree";
    }

    // 전체 조회 - /BoardFree/list
    @GetMapping("/BoardFree")
    public String listAll(Model model) {
        List<AdminFreeboardVO> list = adminFreeboardService.getAllList();
        model.addAttribute("freeboardList", list);    // 속성 이름 통일
        model.addAttribute("category", "전체 게시판");  // 필요하면 카테고리명도 넣기
        

        List<AdminFreeboardVO> notices = adminFreeboardService.getRecentNotices();
        List<AdminFreeboardVO> populars = adminFreeboardService.getPopularPosts();

        model.addAttribute("notices", notices);
        model.addAttribute("populars", populars);

        
        
        
        return "BoardFree";
    }
    

    @GetMapping("/writeadmin")
    public String writeadmin(Model model) {
    	return "writeadmin";
    }
    
    @PostMapping("/free/write")
    public String writePost(AdminFreeboardVO post, HttpSession session) {
        // 세션에서 로그인된 관리자 정보 꺼내기
        MemberVO admin = (MemberVO) session.getAttribute("admin");
        if (admin == null) {
            return "redirect:/admin/login"; // 로그인 안 되어 있으면 로그인 페이지로
        }

        // 작성자 정보 세팅
        post.setId(admin.getId());
        post.setMkey(admin.getMkey());
        post.setUsername(admin.getUsername());

        // 글 등록
        adminFreeboardService.writePost(post);

        // 글쓰기 후 목록 페이지로 이동
        return "redirect:/BoardFree";
    }

    @GetMapping("/BoardFree/delete")
    public String deleteFreeboard(@RequestParam("fbkey") Integer fbkey, RedirectAttributes ra) {
        int result = adminFreeboardService.deletePost(fbkey);
        if (result == 1) {
            ra.addFlashAttribute("msg", "삭제되었습니다.");
        } else {
            ra.addFlashAttribute("msg", "삭제에 실패했습니다.");
        }
        return "redirect:/BoardFree";
    }
    
    @GetMapping("/freeboardDetail/{fbkey}")
    public String getFreeboardDetail(@PathVariable("fbkey") int fbkey, Model model) {
        AdminFreeboardVO post = adminFreeboardService.getFreeboardDetail(fbkey);
        model.addAttribute("freeboard", post);
        return "freeboardDetail";  // 이 파일명이 JSP와 같아야 함
    }
    
    
    
    
    
    
    
}

