package com.example.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dao.FaqDAO;
import com.example.model.FaqVO;

@Service
public class FaqService {

    @Autowired
    private FaqDAO faqDAO;

    public String getAnswerIfExist(String userQuestion) {
        FaqVO faq = faqDAO.findByQuestion(userQuestion);
        return faq != null ? faq.getAnswer() : null;
        
    }
    public List<FaqVO> getAllFaqs() {
        return faqDAO.getAllFaqs();
    }
}

