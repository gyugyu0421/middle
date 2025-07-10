package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.MemberVO;
import com.example.service.MemberService;

@Controller
public class AdminLoginController {

    @Autowired
    private MemberService memberService;

    // 관리자 로그인 폼
    @GetMapping("/adminlogin")
    public String adminLoginForm() {
        return "adminlogin";  // admin/login.jsp (로그인 폼)
    }

    // 관리자 로그인 처리
    @PostMapping("/adminlogin")
    public String adminLogin(@RequestParam String id, 
                             @RequestParam String pw, 
                             HttpSession session, 
                             RedirectAttributes rttr) {

        MemberVO admin = memberService.login(id, pw);

        if (admin != null && "관리자".equals(admin.getType())) {
            session.setAttribute("admin", admin);  // 세션에 관리자 정보 저장
            return "redirect:/index";   // 관리자 페이지로 이동
        } else {
            rttr.addFlashAttribute("errorMsg", "아이디 또는 비밀번호가 틀리거나 권한이 없습니다.");
            return "redirect:/adminlogin";       // 로그인 폼으로 다시 이동
        }
    }

    @GetMapping("/admin/logout")
    public String adminLogout(HttpSession session, RedirectAttributes redirectAttributes) {
        session.invalidate();
        redirectAttributes.addFlashAttribute("logoutMsg", "로그아웃 되셨습니다.");
        return "redirect:/adminlogin";
    }
}