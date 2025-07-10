package com.example.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.model.QnaVO;
import com.example.service.QnaService;

@Controller
public class QnaController {
	
	@Autowired
    private QnaService qnaService;
	
    @GetMapping("/oneonone")
    public String getQnaList(Model model) {
        List<QnaVO> qnaList = qnaService.getAllQna();
        model.addAttribute("qnaList", qnaList);
        return "oneonone"; //
    }
	
    // 관리자 답변 인서트
    @PostMapping("/qna/admin/reply")
    public String insertAdminReply(QnaVO qna, RedirectAttributes redirectAttrs) throws Exception {
        boolean inserted = qnaService.insertAdminReply(qna);
        if (inserted) {
            redirectAttrs.addFlashAttribute("message", "답변이 저장되었습니다.");
        } else {
            redirectAttrs.addFlashAttribute("error", "이미 답변이 존재합니다.");
        }
        return "redirect:/oneonone"; // 답변 완료 후 목록 페이지로 이동
    }

    // 삭제 처리 (GET 방식 예시)
    @GetMapping("/qna/delete/{qnakey}")
    public String deleteQna(@PathVariable int qnakey, RedirectAttributes redirectAttrs) throws Exception {
        boolean deleted = qnaService.deleteQna(qnakey);
        if (deleted) {
            redirectAttrs.addFlashAttribute("message", "질문이 삭제되었습니다.");
        } else {
            redirectAttrs.addFlashAttribute("error", "질문이 존재하지 않습니다.");
        }
        return "redirect:/oneonone"; // 삭제 후 목록 페이지로 이동
    }
    
    
    
    
	
}
