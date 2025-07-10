package com.example.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ViewController {

    @GetMapping("/gptchat")
    public String gptView() {
        return "gptchat"; // → /WEB-INF/views/gptchat.jsp로 포워딩
    }
}