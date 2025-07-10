package com.example.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.model.MembersVO;
import com.example.service.LoginService;

@Controller
public class LoginController {

    @Autowired
    private LoginService loginService;

    @GetMapping("/login")
    public String showLogin() {
        return "login/login";  // login.jsp
    }

    @GetMapping("/main")
    public String mainPage() {
        return "main_recru";  // 경로 : WEB-INF/views/login/main.jsp
    }
    
    @PostMapping("/login")
    public String login(@RequestParam String id,
                        @RequestParam String pw,
                        HttpSession session,
                        Model model) {
    	
        MembersVO user = loginService.login(id, pw);
        // 세션 저장
        if (user != null) {
        	session.setAttribute("loginUser", user);
            session.setAttribute("mkey", user.getMkey());
            session.setAttribute("id", user.getId());
            session.setAttribute("username", user.getUsername());
            session.setAttribute("type", user.getType());
         
            System.out.println(" 로그인 성공 ");
            System.out.println(" ID: " + user.getId());
            System.out.println(" TYPE: " + user.getType());
            
            return "redirect:/main_recru";  // main_recru
        } else {
            model.addAttribute("error", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "login/login";	//로그인페이지
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/main_recru";
    }
    
    @GetMapping("/login/main")
    public String loginForm() {
        return "login/main_recru"; // 로그인 메인 페이지
    }

    @GetMapping("/login/signupUser")
    public String signupUserForm() {
        return "login/signupUser"; // 개인 회원가입 페이지
    }

    @GetMapping("/login/signupCorp")
    public String signupCorpForm() {
        return "login/signupCorp"; // 기업 회원가입 페이지
    }
}