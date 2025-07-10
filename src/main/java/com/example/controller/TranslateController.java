package com.example.controller;

import com.example.service.TranslateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.ui.Model;

@Controller
@RequestMapping("/resume")
public class TranslateController {

    @Autowired
    private TranslateService translateService;

    @PostMapping("/translatForm")
    @ResponseBody
    public String translate(@RequestParam("sourceText") String sourceText,
                            @RequestParam("sourceLang") String sourceLang,
                            @RequestParam("targetLang") String targetLang
                            ) {
        String result = translateService.translate(sourceText, sourceLang, targetLang);
		/* model.addAttribute("translatedText", result); */
		/* return "resume/resume_Write"; */
        return result;
    }
}