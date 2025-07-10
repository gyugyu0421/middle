package com.example.controller;

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

import com.example.model.UserQnaVO;
import com.example.service.UserQnaService;

@Controller
@RequestMapping("/user/qna")
public class UserQnaController {

    @Autowired
    private UserQnaService qnaService;

    // 목록 보기
    @GetMapping("/list")
    public String list(Model model) {
        List<UserQnaVO> qnalist = qnaService.getQnaList();
        model.addAttribute("qnaList", qnalist);
        return "qna/qna_list"; // JSP or Thymeleaf 위치
    }

    // 작성 폼
    @GetMapping("/write")
    public String writeForm(Model model) {
        model.addAttribute("qnaVO", new UserQnaVO());
        return "qna/qna_write";
    }

    // 작성 처리
    @PostMapping("/write")
    public String write(UserQnaVO qnaVO, HttpSession session) {
        String id = (String) session.getAttribute("id");
        String username = (String) session.getAttribute("username");
        String type = (String) session.getAttribute("type");
       
        if (id == null) {
            return "redirect:/login";             
            
        }
        qnaVO.setId(id);
        qnaVO.setUsername(username);
        qnaVO.setType(type);
        qnaVO.setQnaStatus("N");
        qnaService.insertQna(qnaVO);
        return "redirect:/user/qna/list";
    }

    // 상세 보기
    @GetMapping("/view/{qnakey}")
    public String view(@PathVariable("qnakey") Integer qnakey, Model model) {
        UserQnaVO qna = qnaService.getQnaByKey(qnakey);
        model.addAttribute("qna", qna);
        return "qna/qna_view";
    }

    // 수정 폼
    @GetMapping("/edit/{qnakey}")
    public String editForm(@PathVariable("qnakey") Integer qnakey, Model model) {
        UserQnaVO qna = qnaService.getQnaByKey(qnakey);
        model.addAttribute("qna", qna);
        return "qna/qna_edit";
    }

    // 수정 처리
    @PostMapping("/edit")
    public String editSubmit(UserQnaVO qnaVO) {
        qnaService.updateQna(qnaVO);
        return "redirect:/user/qna/view/" + qnaVO.getQnakey();
    }

    // 삭제
    @GetMapping("/delete/{qnakey}")
    public String delete(@PathVariable("qnakey") Integer qnakey) {
        qnaService.deleteQna(qnakey);
        return "redirect:/user/qna/list";
    }
    
    //로그인된 상태에서 삭제 버튼
    @PostMapping("/delete")
    public String delete(@RequestParam("qnakey") int qnakey, HttpSession session) {
        String loginId = (String) session.getAttribute("id");

        UserQnaVO qna = qnaService.getQnaByKey(qnakey);

        if (qna != null && loginId != null && loginId.equals(qna.getId())) {
            qnaService.deleteQna(qnakey);
        }

        return "redirect:/user/qna/list";
    }
    
    
    
 // 답변 작성 폼으로 이동
    @GetMapping("/answer/{qnakey}")
    public String showAnswerForm(@PathVariable int qnakey, Model model) {
        UserQnaVO qna = qnaService.getQnaByKey(qnakey);
        model.addAttribute("qna", qna);
        return "qna_answer"; // qna_answer.jsp로 이동
    }

    // 답변 등록 처리
    @PostMapping("/answer")
    public String submitAnswer(UserQnaVO vo) {
        qnaService.answerQna(vo); // admin 답변 저장
        return "redirect:/user/qna/view/" + vo.getQnakey(); // 상세보기로 이동
    }
}