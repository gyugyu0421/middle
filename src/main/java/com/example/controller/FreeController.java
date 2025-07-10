package com.example.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.FreeVO;
import com.example.model.MembersVO;
import com.example.model.ReportVO;
import com.example.service.FreeService;
import com.example.service.ReportService;

@Controller
@RequestMapping("/user/free")
public class FreeController {

    @Autowired
    private FreeService freeService;
    
    @Autowired
    private ReportService reportService;

    // 게시글 목록 조회
    @GetMapping("/list")
    public String list(@RequestParam(value = "category", required = false) String category, Model model) {
        List<FreeVO> list;

        if (category != null && !category.isEmpty()) {
            list = freeService.getListByCategory(category);
            model.addAttribute("category", category);
        } else {
            list = freeService.getFreeList();
        }

        model.addAttribute("freeList", list);
        return "free/free_list";
    }

    @GetMapping("/write")
    public String writeForm() {
        return "free/free_write";
    }

    // 게시글 작성
    @PostMapping("/write")
    public String writeSubmit(FreeVO freeVO, HttpSession session) {
    	
    	Integer mkey = (Integer) session.getAttribute("mkey");
        String id = (String) session.getAttribute("id");
        String username = (String) session.getAttribute("username");

        if (mkey == null) {
            System.out.println("로그인된 mkey 없음");
            return "redirect:/login"; // 또는 에러 처리
        }
        
        freeVO.setMkey(mkey);	//회원키
        freeVO.setId(id);	//아이디
        freeVO.setUsername(username);	//사용자 이름
        freeVO.setFbview(0);	//조회수
        freeVO.setFblike(0);	//추천수
        
        freeService.insertFree(freeVO);
        return "redirect:/user/free/list";
    }

    @GetMapping("/view/{fbkey}")
    public String view(@PathVariable("fbkey") Integer fbkey, Model model) {
    	
		/* 조회수 증가(먼저) */
    	freeService.increaseViewCount(fbkey);
    	
		/* 게시글 상세 조회 */
        FreeVO free = freeService.getFreeByKey(fbkey);
        model.addAttribute("free", free);
        return "free/free_view";
    }

    @GetMapping("/edit/{fbkey}")
    public String editForm(@PathVariable("fbkey") Integer fbkey, Model model) {
        FreeVO free = freeService.getFreeByKey(fbkey);
        model.addAttribute("free", free);
        return "free/free_write";
    }

    @PostMapping("/edit")
    public String editSubmit(FreeVO freeVO) {
        freeService.updateFree(freeVO);
        return "redirect:/user/free/view/" + freeVO.getFbkey();
    }

    @GetMapping("/delete/{fbkey}")
    public String delete(@PathVariable("fbkey") Integer fbkey) {
        freeService.deleteFree(fbkey);
        return "redirect:/user/free/list";
    }
    
    //추천 기능
    @PostMapping("/like")
    public String likePost(@RequestParam("fbkey") int fbkey, RedirectAttributes rttr) {
        freeService.increaseLikeCount(fbkey);	//추천수 +1
        rttr.addAttribute("fbkey", fbkey);  // 상세페이지로 다시 이동
        return "redirect:/user/free/view/" + fbkey;
    }
    
    
    
    @PostMapping("/report")
    public String reportFree(@RequestParam("boardId") Integer boardId,
                             @RequestParam("reason") String reason,
                             HttpSession session) {

        MembersVO loginUser = (MembersVO) session.getAttribute("loginUser");
        
        System.out.println(">> 로그인 유저: " + loginUser);
        System.out.println(">> boardId: " + boardId);
        System.out.println(">> reportService: " + reportService);
        

        if (loginUser == null) {
            return "redirect:/login"; // 로그인 안 한 경우
        }

        ReportVO report = new ReportVO();
        report.setBoardType("자유게시판");
        report.setBoardId(boardId);
		/* report.setUsername(username); */
        report.setReason(reason);
        report.setReporterMkey(Long.valueOf(loginUser.getMkey()));
        report.setUsername(loginUser.getUsername());
        report.setStatus("처리대기");
        report.setReportDate(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(new Date()));

        reportService.insertReport(report); // 신고 저장

        return "redirect:/user/free/list"; // 신고 후 리스트로 이동
    }
} 
