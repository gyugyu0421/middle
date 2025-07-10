package com.example.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.example.model.FaqVO;
import com.example.service.FaqService;

@Controller
public class ChatController {
	
	@Autowired
    private FaqService faqService;

	@GetMapping("/chat")
	public String showChatForm(Model model) {
	    List<FaqVO> faqList = faqService.getAllFaqs(); // 질문 리스트 가져오기
	    model.addAttribute("faqList", faqList);
	    return "chat"; // chat.jsp
	}

    @PostMapping("/send")
    public String sendToGemini(@RequestParam("message") String message, Model model) {

        String faqAnswer = faqService.getAnswerIfExist(message);

        if (faqAnswer != null) {
            model.addAttribute("userMessage", message);
            model.addAttribute("botResponse", faqAnswer);
        } else {
        	String flaskUrl = "http://localhost:5000/?question=" + message;
            RestTemplate restTemplate = new RestTemplate();

            try {
                String geminiResponse = restTemplate.getForObject(flaskUrl, String.class);
                model.addAttribute("userMessage", message);
                model.addAttribute("botResponse", geminiResponse);
            } catch (Exception e) {
                model.addAttribute("userMessage", message);
                model.addAttribute("botResponse", "에러 발생: " + e.getMessage());
            }
        }

        return "chat";
    }
}