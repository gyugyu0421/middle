package com.example.service;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class GeminiChatService {

    private static final String GEMINI_API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-1/chat:generate?key=AIzaSyAEGeDV86iRl_j1VfbbwnG5QwgcmwAde6U";

    private final RestTemplate restTemplate;

    public GeminiChatService() {
        this.restTemplate = new RestTemplate();
    }

    public String chatWithGemini(String userMessage) {

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);

        Map<String, String> message = new HashMap<>();
        message.put("author", "user");
        message.put("content", userMessage);

        List<Map<String, String>> messages = Collections.singletonList(message);

        Map<String, Object> body = new HashMap<>();
        body.put("model", "gemini-1");  // 모델 명시 필수일 수 있음
        body.put("messages", messages);

        HttpEntity<Map<String, Object>> request = new HttpEntity<>(body, headers);

        try {
            ResponseEntity<String> response = restTemplate.postForEntity(GEMINI_API_URL, request, String.class);
            if (response.getStatusCode().is2xxSuccessful()) {
                return response.getBody();
            } else {
                return "API 호출 실패: " + response.getStatusCode();
            }
        } catch (Exception e) {
            e.printStackTrace();
            return "예외 발생: " + e.getMessage();
        }
    }
}