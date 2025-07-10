package com.example.service;

import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class TranslateServiceImpl implements TranslateService {

    private final String apiKey = "01e2c69b-ad6e-404a-90b9-437018e3f608:fx";

    private final String apiUrl = "https://api-free.deepl.com/v2/translate";

    @Override
    public String translate(String text, String sourceLang, String targetLang) {
        try {
            RestTemplate restTemplate = new RestTemplate();
            
			/* 언어 인코딩용 */
            for (var converter : restTemplate.getMessageConverters()) {
                if (converter instanceof StringHttpMessageConverter) {
                    ((StringHttpMessageConverter) converter).setDefaultCharset(StandardCharsets.UTF_8);
                }
            }

            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);

            MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
            params.add("auth_key", apiKey);
            params.add("text", text);  // 인코딩 안해도 됨
            params.add("source_lang", sourceLang);
            params.add("target_lang", targetLang);

            HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(params, headers);

            ResponseEntity<String> response = restTemplate.postForEntity(apiUrl, request, String.class);

            ObjectMapper mapper = new ObjectMapper();
            Map<String, Object> jsonMap = mapper.readValue(response.getBody(), Map.class);
            List<Map<String, String>> translations = (List<Map<String, String>>) jsonMap.get("translations");

            return translations.get(0).get("text");

        } catch (Exception e) {
            e.printStackTrace();
            return "번역 오류: " + e.getMessage();
        }
    }
}