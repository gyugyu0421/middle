package com.example.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.model.MembersVO;
import com.example.service.SignupService;

@Controller
public class SignupController {

    @Autowired
    private SignupService signupService;

    @PostMapping("/signup.do")
    public String signup(MembersVO vo, javax.servlet.http.HttpServletRequest request, Model model) {
    	
    	// ID 중복 검사
    	if (signupService.checkIdExists(vo.getId())) {
            model.addAttribute("msg", "이미 사용 중인 아이디입니다.");
            return "login/signupUser"; // 다시 회원가입 페이지로
        }
    	
    	vo.setMkey(signupService.getNextMkey());
		    	
    	// 이메일 조합
        String email = request.getParameter("emailFront") + "@" + request.getParameter("emailBack");
        vo.setEmail(email);

        // 생일 조합
        String year = request.getParameter("year");
        String month = request.getParameter("month");
        String day = request.getParameter("day");

        if (year != null && month != null && day != null &&
            !year.isEmpty() && !month.isEmpty() && !day.isEmpty()) {
            
            String birth = String.format("%s-%02d-%02d", year, Integer.parseInt(month), Integer.parseInt(day));
            vo.setMbirth(java.sql.Date.valueOf(birth));
        } else {
            vo.setMbirth(null); // 또는 기본값 설정 가능
        }

        // 상태 기본값
        vo.setStatus("정상");
    	
     // 콘솔 확인용 로그
        System.out.println("==== 회원가입 요청 도착 ====");
        System.out.println("ID: " + vo.getId());
        System.out.println("Type: " + vo.getType());
        System.out.println("pass:" + vo.getPw());
        System.out.println("Username (회사명): " + vo.getUsername());
        System.out.println("사업자등록번호: " + vo.getCnum());
        System.out.println("기업규모: " + vo.getCscale());
        System.out.println("Email: " + vo.getEmail());

        // 5. DB insert 호출
        signupService.insertMember(vo);

        // 6. 로그인 페이지로 이동
        return "main_recru";
    }
    	
	/*
	 * vo.setMkey(signupService.getNextMkey()); vo.setStatus("ACTIVE");
	 * signupService.insertMember(vo); return "redirect:/login/login.jsp"; }
	 */
    
    //일반 회원가입 페이지 요청
    @GetMapping("/signupUser")
    public String showSignupUserPage() {
        return "login/signupUser";  // /WEB-INF/views/login/signupUser.jsp
    }

    //기업 회원가입 페이지 요청
    @GetMapping("/signupCorp")
    public String showSignupCorpPage() {
        return "login/signupCorp";  // /WEB-INF/views/login/signupCorp.jsp  
    }
    
    @GetMapping("/checkId")
    @ResponseBody
    public String checkId(@RequestParam("id") String id) {
        boolean exists = signupService.checkIdExists(id);
        return exists ? "duplicate" : "available";
    }
    
    @GetMapping("/signup")
    public String signupForm() {
        return "login/signupUser";  // views/login/signupUser.jsp 위치 기준
    }
}
    