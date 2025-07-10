package com.example.model;

import lombok.Data;

@Data
public class QnaVO {
    private int qnakey;         // 글 키 값
    private int mkey;           // 회원 키값
    private String id;          // 아이디
    private String qnatitle;    // 제목
    private String qnacontents; // 내용
    private String qnadate;       // 등록일
    private String qna_status;  // 답변 유무
    private String username;    // 사용자 이름
    private String type;  //회원 유형
    private String admin_title;  //답변 제목
    private String admin_contents;  //답변 내용
    private String answer_date;  //답변 날짜
    
    
    
    
    
}
