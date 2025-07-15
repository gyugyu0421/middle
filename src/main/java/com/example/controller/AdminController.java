package com.example.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.MemberVO;
import com.example.model.QnaVO;
import com.example.model.RecruitmentVO;
import com.example.model.ReportVO;
import com.example.service.MemberService; // ← 네가 만든 인터페이스명 소문자
import com.example.service.QnaService;
import com.example.service.RecruitmentService;
import com.example.service.ReportService;
import com.example.service.AdminResumeService;
// import 하자!

@Controller
public class AdminController {

    @Autowired
    private MemberService memberService; // ← 이름 일치해야 함
    
    @Autowired
    private RecruitmentService recruitmentService;
    
    @Autowired
    private QnaService qnaService;
    
    @Autowired
    private ReportService reportService;
    
    @Autowired
    private AdminResumeService resumeService;
    
    
    

    @GetMapping("/index")
    public String index(Model model) {
        List<MemberVO> memberList = memberService.getMemberList();
        int totalCount = memberService.getTotalMemberCount();

       
        
        int januaryCount = memberService.countJanuary();
        int februaryCount = memberService.countFebruary();
        int marchCount = memberService.countMarch();
        int aprilCount = memberService.countApril();
        int mayCount = memberService.countMay();
        int junCount = memberService.countJun();
        
        
        
        model.addAttribute("memberList", memberList);
        model.addAttribute("totalCount", totalCount);


        model.addAttribute("januaryCount", januaryCount);
        model.addAttribute("februaryCount", februaryCount);
        model.addAttribute("marchCount", marchCount);
        model.addAttribute("aprilCount", aprilCount);
        model.addAttribute("mayCount", mayCount);
        model.addAttribute("junCount", junCount);
        
        
        
        int companyCount = memberService.getTotalCompanyCount();
        
        int companyjanuaryCount = memberService.CompanycountJanuary();
        int companyfebruaryCount = memberService.CompanycountFebruary();
        int companymarchCount = memberService.CompanycountMarch();
        int companyaprilCount = memberService.CompanycountApril();
        int companymayCount = memberService.CompanycountMay();
        int companyjunCount = memberService.CompanycountJun();
        
        
        
        model.addAttribute("companyCount", companyCount);
        
        model.addAttribute("companyjanuaryCount", companyjanuaryCount);
        model.addAttribute("companyfebruaryCount", companyfebruaryCount);
        model.addAttribute("companymarchCount", companymarchCount);
        model.addAttribute("companyaprilCount", companyaprilCount);
        model.addAttribute("companymayCount", companymayCount);
        model.addAttribute("companyjunCount", companyjunCount);
        
        
        
        
        List<MemberVO> recentMembers = memberService.getRecentMembers();
        model.addAttribute("recentMembers", recentMembers);
        
        
        List<RecruitmentVO> recruitments = recruitmentService.getRecentRecruitments(); //채용공고
        model.addAttribute("recruitments", recruitments);
        
        
        List<RecruitmentVO> recentList = recruitmentService.getRecentRecruitments();
        model.addAttribute("recentRecruitments", recentList);
        
        
        int unansweredCount = qnaService.getUnansweredQnaCount();
        int answeredCount = qnaService.getAnsweredQnaCount();

        model.addAttribute("unansweredCount", unansweredCount);
        model.addAttribute("answeredCount", answeredCount);
        
        List<QnaVO> qnaList = qnaService.getRecentQnaList();
        model.addAttribute("recentQnaList", qnaList);
        
        
        
        // 신고 목록 가져오기 (예: 최근 신고 리스트, 또는 전체 리스트)
        List<ReportVO> reportList = reportService.getRecentReports();
        model.addAttribute("reportList", reportList);
        
        
        // 신고 상태별 통계(필요 시)
        int pendingCount = reportService.countReportsByStatus("처리대기");
        int processingCount = reportService.countReportsByStatus("처리중");
        int completedCount = reportService.countReportsByStatus("처리완료");
        
        model.addAttribute("pendingCount", pendingCount);
        model.addAttribute("processingCount", processingCount);
        model.addAttribute("completedCount", completedCount);
        
        
        // 채용공고 카운트들 개별 호출
        int domesticCount = recruitmentService.getDomesticRecruitmentCount();
        int overseasCount = recruitmentService.getOverseasRecruitmentCount();
        int regularCount = recruitmentService.getRegularRecruitmentCount();
        int contractFreelanceCount = recruitmentService.getContractFreelanceRecruitmentCount();
        
        // 모델에 담기
        model.addAttribute("domesticCount", domesticCount);
        model.addAttribute("overseasCount", overseasCount);
        model.addAttribute("regularCount", regularCount);
        model.addAttribute("contractFreelanceCount", contractFreelanceCount);
        
        int totalRecruitmentCount = recruitmentService.getTotalRecruitmentCount();
        model.addAttribute("totalRecruitmentCount", totalRecruitmentCount);
        
        
        
        int resumeCount = resumeService.getTotalResumeCount();
        model.addAttribute("resumeCount", resumeCount);
        
        
        // 최종 업데이트 시간 추가
        LocalDateTime now = LocalDateTime.now();
        String formattedDate = now.format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
        model.addAttribute("lastUpdated", formattedDate);
        
        
        
        
        double userGrowthRate = memberService.getUserJoinGrowthRate();
        double companyGrowthRate = memberService.getCompanyJoinGrowthRate();

        model.addAttribute("userGrowthRate", String.format("%.1f", userGrowthRate));
        model.addAttribute("companyGrowthRate", String.format("%.1f", companyGrowthRate));

        

        // JSP에 넘겨줌
        return "index"; // index.jsp 호출됨
    }

    @GetMapping("/")
    public String homeRedirect() {
        return "redirect:/index";
    }

    @GetMapping("/index1")
    public String index1Page(Model model) {
        // 필요한 데이터 셋팅
        List<MemberVO> memberList = memberService.getMemberList();
        model.addAttribute("memberList", memberList);
        return "index1"; // -> index1.jsp 파일 렌더링됨
    }

    
    @GetMapping("/admin/deleteMember")
    public String deleteMember(@RequestParam("mkey") Long mkey, RedirectAttributes rttr) {
        int result = memberService.deleteMember(mkey);
        if (result > 0) {
            rttr.addFlashAttribute("msg", "삭제 성공");
        } else {
            rttr.addFlashAttribute("msg", "삭제 실패");
        }
        return "redirect:/index1";
    }
   
    
    @GetMapping("/admin/deactivateMember")
    public String deactivateMember(@RequestParam("mkey") Long mkey, RedirectAttributes rttr) {
        int result = memberService.deactivateMember(mkey);
        if (result > 0) {
            rttr.addFlashAttribute("msg", "회원 정지 처리 완료");
        } else {
            rttr.addFlashAttribute("msg", "회원 정지 처리 실패");
        }
        return "redirect:/index1";
    }
    @GetMapping("/admin/activateMember")
    public String activateMember(@RequestParam("mkey") Long mkey, RedirectAttributes rttr) {
        int result = memberService.activateMember(mkey);
        if (result > 0) {
            rttr.addFlashAttribute("msg", "회원 활성화 처리 완료");
        } else {
            rttr.addFlashAttribute("msg", "회원 활성화 처리 실패");
        }
        return "redirect:/index1";
    }
    
    
    


}
